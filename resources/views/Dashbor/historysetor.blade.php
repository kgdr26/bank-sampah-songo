@extends('main-dashbor')
@section('title', 'History Setor')
@section('content')

    <div class="conatiner-fluid content-inner mt-n5 py-0">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">List History Setor Sampah</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="list_data" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Norek</th>
                                        <th>Tanggal Setor</th>
                                        <th>Total Berat</th>
                                        <th>Total Harga</th>
                                        <th>Teller</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    {{-- Modal get detail History Setor --}}
    <div class="modal fade" id="modaldetailsetor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modaldetailsetorLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modaldetailsetorLabel">List Detail Data Setor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="mb-3 w-100">
                        <tr>
                            <th class="w-25">Nama</th>
                            <th>:</th>
                            <th id="nama_anggota"></th>
                        </tr>
                        <tr>
                            <th>No. Rekening</th>
                            <th>:</th>
                            <th id="norek_anggota"></th>
                        </tr>
                        <tr>
                            <th>Tanggal Setor</th>
                            <th>:</th>
                            <th id="tglsetor_anggota"></th>
                        </tr>
                        <tr>
                            <th>Total Berat</th>
                            <th>:</th>
                            <th id="totalberat_anggota"></th>
                        </tr>
                        <tr>
                            <th>Total Harga</th>
                            <th>:</th>
                            <th id="totalharga_anggota"></th>
                        </tr>
                    </table>
                    <div class="table-responsive">
                        <table id="list_data_per_anggota" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Categori Sampah</th>
                                    <th>Berat</th>
                                    <th>Satuan</th>
                                    <th>Status</th>
                                    <th>Harga Perberat</th>
                                    <th>Total Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

@endsection
