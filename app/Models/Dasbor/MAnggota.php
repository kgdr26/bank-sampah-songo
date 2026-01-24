<?php

namespace App\Models\Dasbor;

use Vinkla\Hashids\Facades\Hashids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class MAnggota extends Model
{

    public static function getListAnggota($request)
    {
        $draw   = (int) $request->input('draw', 1);
        $start  = (int) $request->input('start', 0);
        $length = (int) $request->input('length', 10);

        $search = $request->input('search.value');

        // Mapping kolom DataTables (sesuai HTML)
        $columns = [
            0 => 'a.msa_id',      // No (dummy)
            1 => 'a.msa_name',    // Nama
            2 => 'a.msa_norek',   // Norek
            3 => 'a.msa_no_tlp',  // No TLP
            4 => 'a.msa_alamat',  // Alamat
            5 => 'total_saldo',   // Total Saldo (alias)
        ];

        $orderColumnIndex = (int) $request->input('order.0.column', 1);
        $orderDir         = $request->input('order.0.dir', 'asc');
        $orderDir         = in_array(strtolower($orderDir), ['asc', 'desc']) ? $orderDir : 'asc';
        $orderColumn      = $columns[$orderColumnIndex] ?? 'a.msa_name';

        /**
         * =============================
         * BASE QUERY
         * =============================
         */
        $baseQuery = DB::table('mst_anggota as a')
            ->leftJoin('trx_transaksi_setor as ts', function ($join) {
                $join->on('ts.tts_msa_id', '=', 'a.msa_id')
                    ->where('ts.tts_status', '>', 0);
            });

        /**
         * =============================
         * TOTAL DATA (SEMUA ANGGOTA)
         * =============================
         */
        $recordsTotal = DB::table('mst_anggota')->count();

        /**
         * =============================
         * QUERY DATA
         * =============================
         */
        $dataQuery = clone $baseQuery;

        $dataQuery->select([
            'a.msa_id',
            'a.msa_name',
            'a.msa_norek',
            'a.msa_no_tlp',
            'a.msa_alamat',
            DB::raw('COALESCE(SUM(ts.tts_berat_sampah * ts.tts_harga_perberat), 0) AS total_saldo'),
        ])
        ->groupBy(
            'a.msa_id',
            'a.msa_name',
            'a.msa_norek',
            'a.msa_no_tlp',
            'a.msa_alamat'
        );

        /**
         * =============================
         * SEARCH / FILTER
         * =============================
         */
        if (!empty($search)) {
            $dataQuery->where(function ($q) use ($search) {
                $q->where('a.msa_name', 'like', "%{$search}%")
                ->orWhere('a.msa_norek', 'like', "%{$search}%")
                ->orWhere('a.msa_no_tlp', 'like', "%{$search}%")
                ->orWhere('a.msa_alamat', 'like', "%{$search}%");
            });
        }

        /**
         * =============================
         * TOTAL FILTERED
         * =============================
         */
        $recordsFiltered = DB::query()
            ->fromSub(clone $dataQuery, 'x')
            ->count();

        /**
         * =============================
         * ORDERING
         * =============================
         */
        if ($orderColumn === 'total_saldo') {
            $dataQuery->orderBy(DB::raw('total_saldo'), $orderDir);
        } else {
            $dataQuery->orderBy($orderColumn, $orderDir);
        }

        /**
         * =============================
         * LIMIT OFFSET
         * =============================
         */
        if ($length != -1) {
            $dataQuery->offset($start)->limit($length);
        }

        $rows = $dataQuery->get();

        /**
         * =============================
         * FORMAT DATA
         * =============================
         */
        $data = [];
        $no = $start + 1;

        foreach ($rows as $row) {
            $data[] = [
                $no++,
                $row->msa_name ?? '-',
                $row->msa_norek ?? '-',
                $row->msa_no_tlp ?? '-',
                $row->msa_alamat ?? '-',
                'Rp. ' . number_format((float) $row->total_saldo, 0, ',', '.'),
                '
                    <button class="btn btn-sm btn-outline-primary" data-name="show_detail" data-id="'.$row->msa_id.'">Detail</button>
                    <button class="btn btn-sm btn-outline-info" data-name="edit_anggota" data-id="'.$row->msa_id.'">Edit</button>
                ',
            ];
        }

        return [
            'draw'            => $draw,
            'recordsTotal'    => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data'            => $data,
        ];
    }

    public static function getDetailAnggota($request)
    {
        $msa_id = $request->input('msa_id');

        if (!$msa_id) {
            return [
                'status' => false,
                'message' => 'ID anggota tidak ditemukan'
            ];
        }

        $row = DB::table('mst_anggota as a')
            ->leftJoin('trx_transaksi_setor as ts', function ($join) {
                $join->on('ts.tts_msa_id', '=', 'a.msa_id')
                    ->where('ts.tts_status', '>', 0);
            })
            ->select([
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'a.msa_no_tlp',
                'a.msa_alamat',
                DB::raw('COALESCE(SUM(ts.tts_berat_sampah * ts.tts_harga_perberat), 0) AS total_saldo'),
            ])
            ->where('a.msa_id', $msa_id)
            ->groupBy(
                'a.msa_id',
                'a.msa_name',
                'a.msa_norek',
                'a.msa_no_tlp',
                'a.msa_alamat'
            )
            ->first();

        if (!$row) {
            return [
                'status' => false,
                'message' => 'Data anggota tidak ditemukan'
            ];
        }

        return [
            'status' => true,
            'data' => [
                'id'   => $row->msa_id ?? '-',
                'nama'   => $row->msa_name ?? '-',
                'norek'  => $row->msa_norek ?? '-',
                'notlp'  => $row->msa_no_tlp ?? '-',
                'alamat' => $row->msa_alamat ?? '-',
                'saldo'  => 'Rp. ' . number_format((float) $row->total_saldo, 0, ',', '.'),
            ]
        ];
    }

    public static function updateAnggota($request)
    {
        $msa_id     = $request->input('msa_id');
        $msa_name   = $request->input('msa_name');
        $msa_no_tlp = $request->input('msa_no_tlp');
        $msa_alamat = $request->input('msa_alamat');

        if (empty($msa_id)) {
            return [
                'status' => false,
                'message' => 'ID anggota tidak valid'
            ];
        }

        $update = DB::table('mst_anggota')
            ->where('msa_id', $msa_id)
            ->update([
                'msa_name'       => $msa_name,
                'msa_no_tlp'     => $msa_no_tlp,
                'msa_alamat'     => $msa_alamat,
                'msa_updated_by' => 1,
                'msa_updated_date' => now(),
            ]);

        if ($update === false) {
            return [
                'status' => false,
                'message' => 'Gagal menyimpan data'
            ];
        }

        return [
            'status' => true,
            'message' => 'Data anggota berhasil diperbarui'
        ];
    }


    public static function insertAnggota($request)
    {
        $msa_name   = $request->input('msa_name');
        $msa_no_tlp = $request->input('msa_no_tlp');
        $msa_alamat = $request->input('msa_alamat');

        if (empty($msa_name)) {
            return [
                'status' => false,
                'message' => 'Nama wajib diisi'
            ];
        }

        /**
         * =============================
         * GENERATE NO REKENING
         * FORMAT: 0910YYYYMMXXXX
         * =============================
         */
        $prefix = '0910';
        $year   = date('Y');
        $month  = date('m');

        $last = DB::table('mst_anggota')
            ->where('msa_norek', 'like', "{$prefix}{$year}{$month}%")
            ->orderBy('msa_norek', 'desc')
            ->value('msa_norek');

        if ($last) {
            $lastSeq = (int) substr($last, -4);
            $seq = str_pad($lastSeq + 1, 4, '0', STR_PAD_LEFT);
        } else {
            $seq = '0001';
        }

        $msa_norek = $prefix . $year . $month . $seq;

        /**
         * =============================
         * INSERT DATA
         * =============================
         */
        $insert = DB::table('mst_anggota')->insert([
            'msa_name'        => $msa_name,
            'msa_norek'       => $msa_norek,
            'msa_no_tlp'      => $msa_no_tlp,
            'msa_alamat'      => $msa_alamat,
            'msa_created_by'  => 1,
            'msa_created_date'=> now(),
        ]);

        if (!$insert) {
            return [
                'status' => false,
                'message' => 'Gagal menyimpan data anggota'
            ];
        }

        return [
            'status' => true,
            'message' => 'Data anggota berhasil ditambahkan'
        ];
    }




}