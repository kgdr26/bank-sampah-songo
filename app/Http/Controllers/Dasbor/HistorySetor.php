<?php

namespace App\Http\Controllers\Dasbor;

use App\Models\Dasbor\MHistorysetor as MHistorysetor;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class HistorySetor extends Controller
{

    public function index()
    {
        // include css yang di perlukan
        $data['css'] = [
            
        ];

        // include js yang di perlukan
        $data['js'] = [
            asset('assets/js/datatable/datatables/jquery.dataTables.min.js'),
            asset('assets/main-js/dasbor/historysetor.js'),
        ];

        return view('Dashbor.historysetor', $data);
    }

    // function list data
    public function listData(Request $request)
    {
        $typeData = $request->input('type_data');

        if($typeData == 'allData'){
            $result = MHistorysetor::getAllDataSetor($request);
        }elseif($typeData == 'detailData'){
            $result = MHistorysetor::getDetailDataSetor($request);
        }elseif($typeData == 'headerDetail'){
            $result = MHistorysetor::getHeaderDetailSetor($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

}