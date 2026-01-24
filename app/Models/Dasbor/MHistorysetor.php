<?php

namespace App\Models\Dasbor;

use Vinkla\Hashids\Facades\Hashids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class MHistorysetor extends Model
{

    public static function getAllDataSetor($request)
    {
        $draw   = (int) $request->input('draw', 1);
        $start  = (int) $request->input('start', 0);
        $length = (int) $request->input('length', 10);

        $search = $request->input('search.value');

        // Mapping kolom DataTables (sesuai urutan tabel HTML)
        $columns = [
            0 => 'msa_id',          // No (dummy)
            1 => 'msa_name',        // Nama
            2 => 'msa_norek',       // Norek
            3 => 'tts_setor_date',  // Tanggal Setor
            4 => 'total_berat',     // Total Berat
            5 => 'total_harga',     // Total Harga
            6 => 'teller_id',       // Teller
        ];

        $orderColumnIndex = (int) $request->input('order.0.column', 3);
        $orderDir         = $request->input('order.0.dir', 'desc');
        $orderDir         = in_array(strtolower($orderDir), ['asc', 'desc']) ? $orderDir : 'desc';

        $orderColumn = $columns[$orderColumnIndex] ?? 'tts_setor_date';

        /**
         * =============================
         * QUERY UTAMA (REKAP)
         * =============================
         */
        $query = DB::table('trx_transaksi_setor as ts')
            ->join('mst_anggota as a', 'a.msa_id', '=', 'ts.tts_msa_id')
            ->select([
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'ts.tts_setor_date',
                DB::raw('SUM(ts.tts_berat_sampah) AS total_berat'),
                DB::raw('SUM(ts.tts_berat_sampah * ts.tts_harga_perberat) AS total_harga'),
                'ts.tts_created_by as teller_id',
            ])
            ->groupBy(
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'ts.tts_setor_date',
                'ts.tts_created_by'
            );

        /**
         * =============================
         * TOTAL DATA (tanpa filter)
         * =============================
         */
        $recordsTotal = DB::query()
            ->fromSub($query, 'x')
            ->count();

        /**
         * =============================
         * FILTER / SEARCH
         * =============================
         */
        if (!empty($search)) {
            $query->where(function ($q) use ($search) {
                $q->where('a.msa_name', 'like', "%{$search}%")
                    ->orWhere('a.msa_norek', 'like', "%{$search}%")
                    ->orWhere('ts.tts_setor_date', 'like', "%{$search}%");
            });
        }

        /**
         * =============================
         * TOTAL FILTERED
         * =============================
         */
        $recordsFiltered = DB::query()
            ->fromSub($query, 'x')
            ->count();

        /**
         * =============================
         * ORDERING
         * =============================
         */
        if (in_array($orderColumn, ['total_berat', 'total_harga', 'teller_id'])) {
            $query->orderBy(DB::raw($orderColumn), $orderDir);
        } else {
            $query->orderBy($orderColumn, $orderDir);
        }

        /**
         * =============================
         * LIMIT OFFSET
         * =============================
         */
        if ($length != -1) {
            $query->offset($start)->limit($length);
        }

        $rows = $query->get();

        /**
         * =============================
         * FORMAT DATA
         * =============================
         */
        $data = [];
        $no = $start + 1;

        foreach ($rows as $row) {
            $tglSetor = $row->tts_setor_date ? Carbon::parse($row->tts_setor_date)->locale('id')->translatedFormat('l, j F Y') : '-';

            $data[] = [
                $no++, // No
                $row->msa_name ?? '-',
                $row->msa_norek ?? '-',
                $tglSetor,
                number_format((float) $row->total_berat, 2, '.', ''), // Total berat
                'Rp. '.number_format((float) $row->total_harga, 0, ',', '.'), // Total harga masih 0
                $row->teller_id ?? '-',
                '<button class="btn btn-sm btn-outline-primary" data-name="show_detail" data-id="'.$row->msa_id.'" data-date="'.$row->tts_setor_date.'">Detail</button>',
            ];
        }

        return [
            'draw'            => $draw,
            'recordsTotal'    => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data'            => $data,
        ];
    }

    public static function getDetailDataSetor($request)
    {
        $draw   = (int) $request->input('draw', 1);
        $start  = (int) $request->input('start', 0);
        $length = (int) $request->input('length', 10);

        $msa_id         = $request->input('msa_id');
        $tts_setor_date = $request->input('tts_setor_date');

        $search = $request->input('search.value');

        // mapping kolom datatable detail
        $columns = [
            0 => 'mcs_name',        // No dummy
            1 => 'mcs_name',        // Categori Sampah
            2 => 'total_berat',     // Berat
            3 => 'mcs_satuan',      // Satuan
            4 => 'harga_perberat',  // Harga Perberat (sementara 0)
            5 => 'total_harga',     // Total Harga (sementara 0)
        ];

        $orderColumnIndex = (int) $request->input('order.0.column', 1);
        $orderDir         = $request->input('order.0.dir', 'asc');
        $orderDir         = in_array(strtolower($orderDir), ['asc', 'desc']) ? $orderDir : 'asc';

        $orderColumn = $columns[$orderColumnIndex] ?? 'mcs_name';

        /**
         * Query detail: per anggota per tanggal, group per kategori
         */
        $query = DB::table('trx_transaksi_setor as ts')
                ->join('mst_categori_sampah as cs', 'cs.mcs_id', '=', 'ts.tts_mcs_id')
                ->leftJoin('mst_status as st', function($join) {
                    $join->on('st.mss_code_id', '=', 'ts.tts_status')
                        ->where('st.mss_code', 'status_setor');
                })
                ->select([
                    'cs.mcs_id',
                    'cs.mcs_name',
                    'cs.mcs_satuan',

                    DB::raw('SUM(ts.tts_berat_sampah) AS total_berat'),

                    // harga
                    DB::raw('MAX(ts.tts_harga_perberat) AS harga_perberat'),
                    DB::raw('SUM(ts.tts_berat_sampah * ts.tts_harga_perberat) AS total_harga'),

                    // status
                    DB::raw("MAX(ts.tts_status) AS tts_status"),
                    DB::raw("COALESCE(MAX(st.mss_name), '-') AS status_name"),
                    DB::raw("COALESCE(MAX(st.mss_class), 'bg-secondary') AS status_class"),
                ])
                ->where('ts.tts_msa_id', $msa_id)
                ->where('ts.tts_setor_date', $tts_setor_date)
                ->groupBy(
                    'cs.mcs_id',
                    'cs.mcs_name',
                    'cs.mcs_satuan'
                );

        // Total tanpa filter
        $recordsTotal = DB::query()
            ->fromSub($query, 'x')
            ->count();

        // Search filter
        if (!empty($search)) {
            $query->having('cs.mcs_name', 'like', "%{$search}%");
        }

        // Total setelah filter
        $recordsFiltered = DB::query()
            ->fromSub($query, 'x')
            ->count();

        // Order
        if (in_array($orderColumn, ['total_berat', 'harga_perberat', 'total_harga'])) {
            $query->orderBy(DB::raw($orderColumn), $orderDir);
        } else {
            $query->orderBy($orderColumn, $orderDir);
        }

        // Paging
        if ($length != -1) {
            $query->offset($start)->limit($length);
        }

        $rows = $query->get();

        // Format datatables
        $data = [];
        $no = $start + 1;

        foreach ($rows as $row) {
            $statusBadge = '<span class="badge '.$row->status_class.'">'.$row->status_name.'</span>';

            $data[] = [
                $no++,
                $row->mcs_name ?? '-',
                number_format((float)$row->total_berat, 2, '.', ''),
                $row->mcs_satuan ?? '-',
                $statusBadge,
                'Rp. '.number_format((float)$row->harga_perberat, 0, ',', '.'), // harga per berat
                'Rp. '.number_format((float)$row->total_harga, 0, ',', '.'),    // total harga
            ];
        }

        return [
            'draw'            => $draw,
            'recordsTotal'    => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data'            => $data,
        ];
    }

    public static function getHeaderDetailSetor($request)
    {
        $msa_id         = $request->input('msa_id');
        $tts_setor_date = $request->input('tts_setor_date');

        $row = DB::table('trx_transaksi_setor as ts')
            ->join('mst_anggota as a', 'a.msa_id', '=', 'ts.tts_msa_id')
            ->select([
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'ts.tts_setor_date',
                DB::raw('SUM(ts.tts_berat_sampah) AS total_berat'),
                DB::raw('SUM(ts.tts_berat_sampah * ts.tts_harga_perberat) AS total_harga'),
            ])
            ->where('ts.tts_msa_id', $msa_id)
            ->where('ts.tts_setor_date', $tts_setor_date)
            ->groupBy(
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'ts.tts_setor_date'
            )
            ->first();

        if (!$row) {
            return [
                'status' => false,
                'message' => 'Data tidak ditemukan',
                'data' => null,
            ];
        }

        // format tanggal carbon indonesia
        $tglSetor = Carbon::parse($row->tts_setor_date)
            ->locale('id')
            ->translatedFormat('l, j F Y');

        return [
            'status' => true,
            'message' => 'OK',
            'data' => [
                'msa_id' => $row->msa_id,
                'msa_name' => $row->msa_name,
                'msa_norek' => $row->msa_norek,
                'tts_setor_date' => $row->tts_setor_date,
                'tts_setor_date_text' => $tglSetor,
                'total_berat' => number_format((float)$row->total_berat, 2, '.', ''),
                'total_harga' => 'Rp. '.number_format((float)$row->total_harga, 0, ',', '.'),
            ]
        ];
    }


}