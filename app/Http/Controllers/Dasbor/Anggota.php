<?php

namespace App\Http\Controllers\Dasbor;

use App\Models\Dasbor\MAnggota as MAnggota;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class Anggota extends Controller
{

    public function index()
    {
        // include css yang di perlukan
        $data['css'] = [
            
        ];

        // include js yang di perlukan
        $data['js'] = [
            asset('assets/js/datatable/datatables/jquery.dataTables.min.js'),
            asset('assets/main-js/dasbor/anggota.js'),
        ];

        return view('Dashbor.anggota', $data);
    }

    // function list data
    public function listData(Request $request)
    {
        $typeData = $request->input('type_data');

        if($typeData == 'listAnggota'){
            $result = MAnggota::getListAnggota($request);
        }elseif ($typeData == 'detailAnggota') {
            $result = MAnggota::getDetailAnggota($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

    // function update data
    public function updateDate(Request $request)
    {

        // echo "<pre>";
        // print_r($request->all());
        // echo "</pre>";
        // die;

    
        $typeData = $request->input('type_data');

        if($typeData == 'updateAnggota'){
            $result = MAnggota::updateAnggota($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

    // function insert data
    public function insertData(Request $request)
    {

        // echo "<pre>";
        // print_r($request->all());
        // echo "</pre>";
        // die;

    
        $typeData = $request->input('type_data');

        if($typeData == 'insertAnggota'){
            $result = MAnggota::insertAnggota($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

}