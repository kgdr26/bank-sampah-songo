(function ($) {

function showLoader() {
    $("#loading").fadeIn("fast");
}

function hideLoader() {
    $("#loading").fadeOut("slow", function () {
        $(this).hide();
    });
}

// expose ke global
window.showLoader = showLoader;
window.hideLoader = hideLoader;

// auto hide setelah halaman selesai load
$(window).on("load", function(){
    hideLoader();
});


})(jQuery);