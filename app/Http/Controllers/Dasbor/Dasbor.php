<?php

namespace App\Http\Controllers\Dasbor;

use App\Models\Dasbor\MDasbor as MDasbor;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;

class Dasbor extends Controller
{

    public function index()
    {

        $data['arrData']    = MDasbor::getDataDashbard();

        // include css yang di perlukan
        $data['css'] = [
            
        ];

        // include js yang di perlukan
        $data['js'] = [
            asset('assets/main-js/dasbor/dasbor.js'),
        ];

        return view('Dashbor.dasbor', $data);
    }

    // function list data
    public function listData(Request $request)
    {
        $typeData = $request->input('type_data');

        if($typeData == 'chartBeratSetorDanJual'){
            $result = MDasbor::getchartBeratSetorDanJual($request);
        }elseif($typeData == 'chartSaldoMasukKeluar'){
            $result = MDasbor::getChartSaldoMasukKeluar($request);
        }else{
            $result = [];
        }

        return response()->json($result);
    }

}