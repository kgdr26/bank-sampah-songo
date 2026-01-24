(function ($) {

    // List datatables untuk list data
    $('#list_data').DataTable({
        processing: true,
        serverSide: true,
        destroy: true,
        responsive: true,
        order: [[1, 'asc']], // Nama ASC

        ajax: {
            url: "/anggota/list-data",
            type: "POST",
            data: function (d) {
                d.type_data = "listAnggota";
            },
            error: function (xhr) {
                console.log(xhr.responseText);
            }
        },

        columnDefs: [
            { targets: 0, orderable: false, searchable: false }, // No
            { targets: 6, orderable: false, searchable: false }, // Action
            { targets: 5, className: "text-end" }, // Saldo
        ],
    });

    $('#list_data').on('click', 'button[data-name="show_detail"]', function (e) {
        e.preventDefault();

        let msa_id = $(this).data('id');

        // reset dulu
        $('#nama_anggota').html('-');
        $('#norek_anggota').html('-');
        $('#notlp_anggota').html('-');
        $('#alamat_anggota').html('-');
        $('#saldo_anggota').html('-');

        $.ajax({
            url: "/anggota/list-data",
            type: "POST",
            dataType: "json",
            data: {
                type_data: "detailAnggota",
                msa_id: msa_id
            },
            success: function (res) {
                if(res.status === true){
                    $('#nama_anggota').html(res.data.nama);
                    $('#norek_anggota').html(res.data.norek);
                    $('#notlp_anggota').html(res.data.notlp);
                    $('#alamat_anggota').html(res.data.alamat);
                    $('#saldo_anggota').html(res.data.saldo);

                    $('#modaldetailanggota').modal('show');
                }else{
                    alert(res.message || 'Data tidak ditemukan');
                }
            },
            error: function (xhr) {
                console.log(xhr.responseText);
                alert('Gagal mengambil data detail');
            }
        });
    });

    $('#list_data').on('click', 'button[data-name="edit_anggota"]', function (e) {
        e.preventDefault();

        let msa_id = $(this).data('id');

        // reset dulu
        $('#msa_id').val('');
        $('#msa_norek').val('');
        $('#msa_name').val('');
        $('#msa_no_tlp').val('');
        $('#msa_alamat').val('');

        $.ajax({
            url: "/anggota/list-data",
            type: "POST",
            dataType: "json",
            data: {
                type_data: "detailAnggota",
                msa_id: msa_id
            },
            success: function (res) {
                if(res.status === true){
                    $('#msa_id').val(res.data.id);
                    $('#msa_name').val(res.data.nama);
                    $('#msa_norek').val(res.data.norek);
                    $('#msa_no_tlp').val(res.data.notlp);
                    $('#msa_alamat').val(res.data.alamat);

                    $('#modaleditanggota').modal('show');


                    $('[data-name="save_edit"]').off('click').on('click', function (e) {
                        e.preventDefault();

                        let btn  = $(this);
                        let form = $('#formedit')[0];
                        let formData = new FormData(form);
                        formData.append('type_data', 'updateAnggota');

                        // ===== START LOADING =====
                        btn.prop('disabled', true);
                        let oldText = btn.html();
                        btn.html('<span class="spinner-border spinner-border-sm me-1"></span> Saving...');

                        $.ajax({
                            url: "/anggota/update-data",
                            type: "POST",
                            data: formData,
                            processData: false,
                            contentType: false,
                            dataType: "json",

                            success: function (res) {
                                if (res.status) {
                                    $('#modaleditanggota').modal('hide');
                                    $('#list_data').DataTable().ajax.reload(null, false);
                                } else {
                                    alert(res.message || 'Gagal menyimpan data');
                                }
                            },

                            error: function (xhr) {
                                console.log(xhr.responseText);
                                alert('Terjadi kesalahan saat update data');
                            },

                            complete: function () {
                                // ===== STOP LOADING =====
                                btn.prop('disabled', false);
                                btn.html(oldText);
                            }
                        });
                    });



                }else{
                    alert(res.message || 'Data tidak ditemukan');
                }
            },
            error: function (xhr) {
                console.log(xhr.responseText);
                alert('Gagal mengambil data detail');
            }
        });

       
    });

    

    $('button[data-name="add_anggota"]').on('click', function (e) {
        e.preventDefault();

        $('#formadd')[0].reset();
        $('#modaladdanggota').modal('show');

        $('[data-name="save_add"]').off('click').on('click', function (e) {
            e.preventDefault();

            let btn = $(this);
            let form = $('#formadd')[0];
            let formData = new FormData(form);
            formData.append('type_data', 'insertAnggota');

            // ===== START LOADING =====
            btn.prop('disabled', true);
            let oldText = btn.html();
            btn.html('<span class="spinner-border spinner-border-sm me-1"></span> Saving...');

            $.ajax({
                url: "/anggota/insert-data",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",

                success: function (res) {
                    if (res.status === true) {
                        alert(res.message);

                        $('#modaladdanggota').modal('hide');
                        $('#list_data').DataTable().ajax.reload(null, false);
                    } else {
                        alert(res.message || 'Gagal menyimpan data');
                    }
                },

                error: function (xhr) {
                    console.log(xhr.responseText);
                    alert('Terjadi kesalahan saat menyimpan data');
                },

                complete: function () {
                    // ===== STOP LOADING =====
                    btn.prop('disabled', false);
                    btn.html(oldText);
                }
            });
        });
    });



})(jQuery);