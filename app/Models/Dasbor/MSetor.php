<?php

namespace App\Models\Dasbor;

use Vinkla\Hashids\Facades\Hashids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class MSetor extends Model
{

    public static function insertSetor($request)
    {
        $msa_id   = $request->input('tts_msa_id');
        $mcs_id   = $request->input('tts_mcs_id');
        $tanggal  = $request->input('tts_setor_date');
        $berat    = (float) $request->input('tts_berat_sampah');

        if (!$msa_id || !$mcs_id || !$tanggal || $berat <= 0) {
            return [
                'status' => false,
                'message' => 'Data setor belum lengkap'
            ];
        }


        $insert = DB::table('trx_transaksi_setor')->insert([
            'tts_msa_id'          => $msa_id,
            'tts_mcs_id'          => $mcs_id,
            'tts_setor_date'      => $tanggal,
            'tts_berat_sampah'    => $berat,
            'tts_status'          => 1, // default valid
            'tts_created_by'      => 1,
            'tts_created_date'    => now(),
        ]);

        if (!$insert) {
            return [
                'status' => false,
                'message' => 'Gagal menyimpan transaksi setor'
            ];
        }

        return [
            'status' => true,
            'message' => 'Transaksi setor berhasil disimpan'
        ];
    }

    public static function getListDetailSetor($request)
    {
        $draw   = (int) $request->input('draw', 1);
        $start  = (int) $request->input('start', 0);
        $length = (int) $request->input('length', 10);

        $msa_id = $request->input('tts_msa_id');
        $tanggal = $request->input('tts_setor_date');

        /**
         * =============================
         * GUARD (WAJIB)
         * =============================
         */
        if (empty($msa_id) || empty($tanggal)) {
            return [
                'draw' => $draw,
                'recordsTotal' => 0,
                'recordsFiltered' => 0,
                'data' => [],
            ];
        }

        /**
         * =============================
         * BASE QUERY
         * =============================
         */
        $baseQuery = DB::table('trx_transaksi_setor as ts')
            ->join('mst_categori_sampah as cs', 'cs.mcs_id', '=', 'ts.tts_mcs_id')
            ->where('ts.tts_msa_id', $msa_id)
            ->where('ts.tts_status', '>', 0)
            ->whereDate('ts.tts_setor_date', $tanggal);

        /**
         * =============================
         * TOTAL DATA
         * =============================
         */
        $recordsTotal = (clone $baseQuery)->count();

        /**
         * =============================
         * QUERY DATA
         * =============================
         */
        $dataQuery = clone $baseQuery;

        $dataQuery->select([
            'ts.tts_id',
            'cs.mcs_name',
            'ts.tts_berat_sampah',
            DB::raw("'Kg' AS satuan"),
        ]);

        /**
         * =============================
         * TOTAL FILTERED
         * =============================
         */
        $recordsFiltered = $recordsTotal;

        /**
         * =============================
         * ORDER & LIMIT
         * =============================
         */
        $dataQuery->orderBy('ts.tts_id', 'desc');

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
                $row->mcs_name ?? '-',
                number_format((float) $row->tts_berat_sampah, 2, '.', ''),
                $row->satuan,
                '
                <button class="btn btn-sm btn-outline-info" data-id="'.$row->tts_id.'" data-name="edit_setor">Edit</button>
                <button class="btn btn-sm btn-outline-danger" data-id="'.$row->tts_id.'" data-name="delete_setor">Delete</button>
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




}