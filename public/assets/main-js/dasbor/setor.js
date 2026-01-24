(function ($) {

    // List datatables untuk list data
    let tableDetail = $('#list_data').DataTable({
        processing: true,
        serverSide: true,
        destroy: true,

        ajax: {
            url: '/setor/list-data',
            type: 'POST',
            data: function (d) {
                d.type_data = 'listDetailSetor';
                d.tts_msa_id = $('#tts_msa_id').val();
                d.tts_setor_date = $('#tts_setor_date').val();
            }
        },

        columnDefs: [
            { targets: 0, orderable: false, searchable: false },
            { targets: 4, orderable: false, searchable: false },
            { targets: [2], className: 'text-end' }
        ]
    });

    $('[data-name="show_data"]').on('click', function () {
        tableDetail.ajax.reload();
    });


    $('button[data-name="save_setor"]').on('click', function (e) {
         e.preventDefault();

        let btn  = $(this);
        let form = $('#addsetor')[0];
        let formData = new FormData(form);
        formData.append('type_data', 'insertSetor');

        // ===== START LOADING =====
        let oldText = btn.html();
        btn.prop('disabled', true);
        btn.html('<span class="spinner-border spinner-border-sm me-1"></span> Saving...');

        $.ajax({
            url: "/setor/insert-data",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",

            success: function (res) {
                if (res.status) {
                    tableDetail.ajax.reload(null, false);
                } else {
                    alert(res.message || 'Gagal menyimpan data');
                }
            },

            error: function (xhr) {
                console.log(xhr.responseText);
                alert('Terjadi kesalahan sistem');
            },

            complete: function () {
                // ===== STOP LOADING =====
                btn.prop('disabled', false);
                btn.html(oldText);
            }
        });

    });

    // style
    $('.select2').each(function (i, el) {
        // console.log('Init Select2 ke-', i);
        const $el = $(el);
        $el.select2({
            placeholder: 'Select Data...',
            allowClear: true,
            width: '100%',
        });
    });

    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    }).datepicker('setDate', new Date());

})(jQuery);