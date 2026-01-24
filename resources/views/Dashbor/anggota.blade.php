@extends('main-dashbor')
@section('title', 'Data Anggota')
@section('content')

    <div class="conatiner-fluid content-inner mt-n5 py-0">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">List Data Anggota</h4>
                        </div>

                        <button type="button" class="btn btn-primary" data-name="add_anggota">Add Anggota</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="list_data" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Norek</th>
                                        <th>No TLP</th>
                                        <th>Alamat</th>
                                        <th>Total Saldo</th>
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

    {{-- Modal get detail data --}}
    <div class="modal fade" id="modaldetailanggota" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modaldetailanggotaLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modaldetailanggotaLabel">Detail Data Anggota</h5>
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
                            <th>No Tlp</th>
                            <th>:</th>
                            <th id="notlp_anggota"></th>
                        </tr>
                        <tr>
                            <th>Alamat</th>
                            <th>:</th>
                            <th id="alamat_anggota"></th>
                        </tr>
                        <tr>
                            <th>Saldo</th>
                            <th>:</th>
                            <th id="saldo_anggota"></th>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    {{-- Modal update data --}}
    <div class="modal fade" id="modaleditanggota" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modaleditanggotaLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modaleditanggotaLabel">Edit Data Anggota</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formedit">
                        <input type="hidden" name="msa_id" id="msa_id">
                        <div class="form-group">
                            <label class="form-label" for="msa_norek">No Rekening</label>
                            <input type="msa_norek" class="form-control" id="msa_norek" name="msa_norek" readonly>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="msa_name">Name</label>
                            <input type="msa_name" class="form-control" id="msa_name" name="msa_name">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="msa_no_tlp">No Tlp</label>
                            <input type="msa_no_tlp" class="form-control" id="msa_no_tlp" name="msa_no_tlp">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="msa_alamat">Alamat</label>
                            <input type="msa_alamat" class="form-control" id="msa_alamat" name="msa_alamat">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-name="save_edit">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    {{-- Modal Insert data --}}
    <div class="modal fade" id="modaladdanggota" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modaladdanggotaLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modaladdanggotaLabel">Add Data Anggota</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formadd">

                        <div class="form-group">
                            <label class="form-label" for="msa_name">Name</label>
                            <input type="msa_name" class="form-control" id="msa_name" name="msa_name">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="msa_no_tlp">No Tlp</label>
                            <input type="msa_no_tlp" class="form-control" id="msa_no_tlp" name="msa_no_tlp">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="msa_alamat">Alamat</label>
                            <input type="msa_alamat" class="form-control" id="msa_alamat" name="msa_alamat">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-name="save_add">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

@endsection