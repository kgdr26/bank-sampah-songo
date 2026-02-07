<?php

namespace App\Models\Dasbor;

use Vinkla\Hashids\Facades\Hashids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class MDasbor extends Model
{

    //Function untuk ambil semu data yang di perlukan di halaman dashboard
    public static function getDataDashbard()
    {
        // query anggota
        $anggota    =  DB::table('mst_anggota')
                        ->where('msa_status', 1);

        // query Saldo tersimpan 
        $totalJual = DB::table('trx_penjualan_sampah')
                        ->select(DB::raw('SUM(tps_harga_perberat * tps_total_berat) as total'))
                        ->value('total');

        $totalTarik = DB::table('trx_transaksi_tarik')
                          ->sum('ttt_nominal_tarik');

        $totaltersimpan     = $totalJual - $totalTarik;

        // Query saldo anggota
        $saldoanggota       = DB::table('trx_transaksi_setor')
                                ->select(DB::raw('SUM(tts_harga_perberat * tts_berat_sampah) as total'))
                                ->where('tts_status', '>', 0)
                                ->value('total');

        $saldokartar        = $totaltersimpan - $saldoanggota;

        // Query sampah terkumpul
        $sampahterkumpul    = DB::table('trx_transaksi_setor as t0')
                                ->join('mst_categori_sampah as t1', 't1.mcs_id', '=', 't0.tts_mcs_id')
                                ->selectRaw("
                                    SUM(
                                        CASE
                                            WHEN t1.mcs_satuan = 'Kg'
                                                THEN t0.tts_berat_sampah
                                            WHEN t1.mcs_satuan = 'L'
                                                THEN t0.tts_berat_sampah * 0.9
                                            ELSE 0
                                        END
                                    ) AS total_kg
                                ")
                                ->where('t0.tts_status', '>', 0)
                                ->value('total_kg');

        // Query sampah terjual
        $sampahterjual     = DB::table('trx_penjualan_sampah as t0')
                                ->join('mst_categori_sampah as t1', 't1.mcs_id', '=', 't0.tps_mcs_id')
                                ->selectRaw("
                                    SUM(
                                        CASE
                                            WHEN t1.mcs_satuan = 'Kg'
                                                THEN t0.tps_total_berat
                                            WHEN t1.mcs_satuan = 'L'
                                                THEN t0.tps_total_berat * 0.9
                                            ELSE 0
                                        END
                                    ) AS total_kg
                                ")
                                ->value('total_kg');

        $sampahtersimpan    = $sampahterkumpul - $sampahterjual;

        // Buat query reward
        $reward             = DB::table('mst_anggota as t0')
                                ->leftJoin('trx_transaksi_setor as t1', function ($join) {
                                    $join->on('t1.tts_msa_id', '=', 't0.msa_id')
                                        ->where('t1.tts_status', '>', 0);
                                })
                                ->leftJoin('mst_categori_sampah as t2', 't2.mcs_id', '=', 't1.tts_mcs_id')
                                ->leftJoin('trx_transaksi_tarik as t3', 't3.ttt_msa_id', '=', 't0.msa_id')
                                ->select(
                                    // IDENTITAS ANGGOTA
                                    't0.msa_id',
                                    't0.msa_user_id',
                                    't0.msa_norek',
                                    't0.msa_name',
                                    't0.msa_no_tlp',
                                    't0.msa_alamat',
                                    't0.msa_status',
                                    't0.msa_created_date',

                                    // TOTAL BERAT (PAKAI KONVERSI)
                                    DB::raw('
                                        COALESCE(
                                            SUM(
                                                CASE
                                                    WHEN t2.mcs_satuan = "Kg"
                                                        THEN t1.tts_berat_sampah
                                                    WHEN t2.mcs_satuan = "L"
                                                        THEN t1.tts_berat_sampah * 0.9
                                                    ELSE 0
                                                END
                                            ), 0
                                        ) AS total_berat_kg
                                    '),

                                    // SALDO (TANPA KONVERSI)
                                    DB::raw('
                                        COALESCE(SUM(t1.tts_harga_perberat * t1.tts_berat_sampah), 0)
                                        -
                                        COALESCE(SUM(t3.ttt_nominal_tarik), 0)
                                        AS saldo
                                    '),

                                    // JUMLAH KATEGORI SAMPAH
                                    DB::raw('
                                        COUNT(DISTINCT t1.tts_mcs_id) AS total_kategori
                                    ')
                                )
                                ->groupBy(
                                    't0.msa_id',
                                    't0.msa_user_id',
                                    't0.msa_norek',
                                    't0.msa_name',
                                    't0.msa_no_tlp',
                                    't0.msa_alamat',
                                    't0.msa_status',
                                    't0.msa_created_date'
                                )
                                ->orderByDesc('saldo')
                                ->limit(1)
                                ->first();


        $arr = [
            'total_anggota'     => $anggota->count(),
            'saldo_tersimpan'   => $totaltersimpan,
            'saldo_ditarik'     => $totalTarik,
            'saldo_anggota'     => $saldoanggota,
            'saldo_kartar'      => $saldokartar,
            'sampah_terkumpul'  => $sampahterkumpul,
            'sampah_terjual'    => $sampahterjual,
            'sampah_tersimpan'  => $sampahtersimpan,
            'reward'            => (array) $reward
        ];

        return $arr;
    }

    //Function untuk chart histori setor dan penjualan
    public static function getchartBeratSetorDanJual($request)
    {
        // =========================
        // SUBQUERY SETOR (MASTER TANGGAL)
        // =========================
        $setorSub = DB::table('trx_transaksi_setor as tts')
            ->leftJoin('mst_categori_sampah as mcs', 'mcs.mcs_id', '=', 'tts.tts_mcs_id')
            ->select(
                'tts.tts_setor_date as tanggal',
                DB::raw('
                    SUM(
                        CASE
                            WHEN mcs.mcs_satuan = "Kg"
                                THEN tts.tts_berat_sampah
                            WHEN mcs.mcs_satuan = "L"
                                THEN tts.tts_berat_sampah * 0.9
                            ELSE 0
                        END
                    ) AS total_setor
                ')
            )
            ->where('tts.tts_status', '>', 0)
            ->groupBy('tts.tts_setor_date');

        // =========================
        // SUBQUERY JUAL (PER TANGGAL)
        // =========================
        $jualSub = DB::table('trx_penjualan_sampah as tps')
                    ->leftJoin('mst_categori_sampah as mcs', 'mcs.mcs_id', '=', 'tps.tps_mcs_id')
                    ->select(
                        'tps.tps_date_setor as tanggal',
                        DB::raw('
                            SUM(
                                CASE
                                    WHEN mcs.mcs_satuan = "Kg"
                                        THEN tps.tps_total_berat
                                    WHEN mcs.mcs_satuan = "L"
                                        THEN tps.tps_total_berat * 0.9
                                    ELSE 0
                                END
                            ) AS total_jual
                        ')
                    )
                    ->groupBy('tps.tps_date_setor');

        // =========================
        // JOIN HASIL AGREGASI
        // =========================
        $data = DB::query()
                ->fromSub($setorSub, 's')
                ->leftJoinSub($jualSub, 'j', 'j.tanggal', '=', 's.tanggal')
                ->select(
                    's.tanggal',
                    's.total_setor',
                    DB::raw('COALESCE(j.total_jual, 0) as total_jual')
                )
                ->orderBy('s.tanggal')
                ->get();

        // =========================
        // FORMAT UNTUK CHART
        // =========================
        $categories = [];
        $setor      = [];
        $jual       = [];

        foreach ($data as $row) {
            $categories[] = Carbon::parse($row->tanggal)
                ->translatedFormat('D, d M Y');

            $setor[] = round($row->total_setor, 2);
            $jual[]  = round($row->total_jual, 2);
        }

        $arr = [
            'categories' => $categories,
            'setor'      => $setor,
            'jual'       => $jual,
        ];

        return $arr;
    }


}