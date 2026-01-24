(function ($) {

    // List datatables untuk list data
    $('#list_data').DataTable({
        processing: true,
        serverSide: true,
        destroy: true,
        responsive: true,
        order: [[3, 'desc']], // urut tanggal setor desc

        ajax: {
            url: "/historysetor/list-data",
            type: "POST",
            data: function (d) {
                d.type_data = "allData"; // untuk controller
            },
            error: function (xhr) {
                console.log(xhr.responseText);
            }
        },

        columnDefs: [
            { targets: 0, orderable: false, searchable: false }, // No
            { targets: 7, orderable: false, searchable: false }, // Action
            { targets: [4,5], className: "text-end" },
            { targets: [3], className: "text-center" },
        ],
    });

    let dtDetail = null;

    $('#list_data').on('click', 'button[data-name="show_detail"]', function (e) {
        e.preventDefault();

        const msa_id         = $(this).data('id');
        const tts_setor_date = $(this).data('date');

        // reset tampilan dulu
        $('#nama_anggota').text('-');
        $('#norek_anggota').text('-');
        $('#tglsetor_anggota').text('-');
        $('#totalberat_anggota').text('-');
        $('#totalharga_anggota').text('-');

        $('#modaldetailsetor').modal('show');

        // ==============================
        // 1) LOAD HEADER DETAIL
        // ==============================
        $.ajax({
            url: "/historysetor/list-data",
            type: "POST",
            dataType: "json",
            data: {
                type_data: "headerDetail",
                msa_id: msa_id,
                tts_setor_date: tts_setor_date
            },
            success: function(res){
                if(res.status === true){
                    $('#nama_anggota').text(res.data.msa_name);
                    $('#norek_anggota').text(res.data.msa_norek);
                    $('#tglsetor_anggota').text(res.data.tts_setor_date_text);
                    $('#totalberat_anggota').text(res.data.total_berat);
                    $('#totalharga_anggota').text(res.data.total_harga);
                }else{
                    alert(res.message ?? 'Data header tidak ditemukan');
                }
            },
            error: function(xhr){
                console.log(xhr.responseText);
            }
        });

        // ==============================
        // 2) LOAD DATATABLE DETAIL
        // ==============================
        if (dtDetail) {
            dtDetail.destroy();
            $('#list_data_per_anggota tbody').html('');
        }

        dtDetail = $('#list_data_per_anggota').DataTable({
            processing: true,
            serverSide: true,
            destroy: true,
            responsive: true,
            order: [[1, 'asc']],
            ajax: {
                url: "/historysetor/list-data",
                type: "POST",
                data: function (d) {
                    d.type_data = "detailData";
                    d.msa_id = msa_id;
                    d.tts_setor_date = tts_setor_date;
                }
            },
            columnDefs: [
                { targets: 0, orderable: false, searchable: false },
                { targets: [2,5,6], className: "text-end" },
                { targets: [3,4], className: "text-center" }, // satuan + status
            ],
        });
    });

})(jQuery);