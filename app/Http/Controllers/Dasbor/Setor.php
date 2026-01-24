<?php

namespace App\Http\Controllers\Dasbor;

use App\Models\Dasbor\MSetor as MSetor;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class Setor extends Controller
{

    public function index()
    {
        // include css yang di perlukan
        $data['css'] = [
            asset('assets/bootstrap-datepicker/bootstrap-datepicker.min.css'),
            asset('assets/select2/select2.min.css'),
        ];

        // include js yang di perlukan
        $data['js'] = [
            asset('assets/bootstrap-datepicker/bootstrap-datepicker.min.js'),
            asset('assets/select2/select2.min.js'),
            asset('assets/js/datatable/datatables/jquery.dataTables.min.js'),
            asset('assets/main-js/dasbor/setor.js'),
        ];

        $data['list_anggota'] = DB::table('mst_anggota')->get();
        $data['list_sampah'] = DB::table('mst_categori_sampah')->where('mcs_active', 1)->get();
 
        return view('Dashbor.setor', $data);
    }

    // function list data
    public function listData(Request $request)
    {
        $typeData = $request->input('type_data');

        if($typeData == 'listDetailSetor'){
            $result = MSetor::getListDetailSetor($request);
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

        if($typeData == 'insertSetor'){
            $result = MSetor::insertSetor($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

}