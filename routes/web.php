<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Portofolio\Home;
use App\Http\Controllers\Dasbor\Dasbor;
use App\Http\Controllers\Dasbor\HistorySetor;
use App\Http\Controllers\Dasbor\Anggota;
use App\Http\Controllers\Dasbor\Setor;


// Route::get('/', function () {
//     return view('welcome');
// });

Route::redirect('/', '/home');
Route::get('/home', [Home::class, 'index'])->name('home');

Route::prefix('dasbor')->name('dasbor.')->group(function () {
    Route::get('/', [Dasbor::class, 'index'])->name('index');
    
    Route::match(['get','post'], '/list-data', [Dasbor::class, 'listData'])->name('listData');
});

Route::prefix('setor')->name('setor.')->group(function () {
    Route::get('/', [Setor::class, 'index'])->name('index');

    Route::match(['get','post'], '/list-data', [Setor::class, 'listData'])->name('listData');

    Route::match(['get','post'], '/insert-data', [Setor::class, 'insertData'])->name('insertData');

    Route::match(['get','post'], '/update-data', [Setor::class, 'updateDate'])->name('updateDate');
});

Route::prefix('historysetor')->name('historysetor.')->group(function () {
    Route::get('/', [HistorySetor::class, 'index'])->name('index');

    Route::match(['get','post'], '/list-data', [HistorySetor::class, 'listData'])->name('listData');
});

Route::prefix('anggota')->name('anggota.')->group(function () {
    Route::get('/', [Anggota::class, 'index'])->name('index');

    Route::match(['get','post'], '/list-data', [Anggota::class, 'listData'])->name('listData');

    Route::match(['get','post'], '/insert-data', [Anggota::class, 'insertData'])->name('insertData');

    Route::match(['get','post'], '/update-data', [Anggota::class, 'updateDate'])->name('updateDate');
});