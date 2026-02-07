(function (jQuery) {
  "use strict";

if ($('#d-activity').length) {

    let chartsaldo = null;

    $.ajax({
        url: "/dasbor/list-data",
        type: "POST",
        dataType: "json",
        data: {
            type_data: "chartSaldoMasukKeluar"
        },
        success: function(res) {

            const labelsFormattedsaldo = res.labels.map(tgl => formatTanggal(tgl));

            const optionssaldo = {
                series: [{
                    name: 'Saldo Masuk',
                    data: res.masuk
                }, {
                    name: 'Saldo Keluar',
                    data: res.keluar
                }],
                chart: {
                    type: 'bar',
                    height: 230,
                    toolbar: { show: false }
                },
                colors: ["#3a57e8", "#4bc7d2"],
                plotOptions: {
                    bar: {
                        columnWidth: '28%',
                        borderRadius: 5
                    }
                },
                dataLabels: { enabled: false },
                xaxis: {
                    categories: labelsFormattedsaldo,
                    labels: { rotate: -45 }
                },
                yaxis: {
                    labels: {
                        formatter: val => 'Rp ' + val.toLocaleString('id-ID')
                    }
                },
                tooltip: {
                    enabled: true,
                },
            };

            chartsaldo = new ApexCharts(
                document.querySelector("#d-activity"),
                optionssaldo
            );
            chartsaldo.render();
        }
    });

    // ColorChange JALAN SETELAH chart ADA
    document.addEventListener('ColorChange', (e) => {
        if (chartsaldo) {
            chartsaldo.updateOptions({
                colors: [e.detail.detail1, e.detail.detail2]
            });
        }
    });
}


if ($('#d-main').length) {

    $.ajax({
        url: "/dasbor/list-data",
        type: "POST",
        dataType: "json",
        data: {
            type_data: "chartBeratSetorDanJual"
        },
        success: function (res) {

            // console.log(res);

            const options = {
                series: [{
                    name: 'Total Terkumpul @Kg',
                    data: res.setor
                }, {
                    name: 'Total Terjual @Kg',
                    data: res.jual
                }],
                chart: {
                    fontFamily: '"Inter", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"',
                    height: 245,
                    type: 'area',
                    toolbar: {
                        show: false
                    },
                    sparkline: {
                        enabled: false,
                    },
                },
                colors: ["#3a57e8", "#4bc7d2"],
                dataLabels: {
                    enabled: true
                },
                stroke: {
                    curve: 'smooth',
                    width: 3,
                },
                yaxis: {
                    show: true,
                    labels: {
                        show: true,
                        minWidth: 40,
                        maxWidth: 60,
                        style: {
                            colors: "#8A92A6",
                        },
                        offsetX: 0,
                    },
                },
                legend: {
                    show: true,
                },
                xaxis: {
                    labels: {
                        minHeight: 22,
                        maxHeight: 22,
                        show: true,
                        style: {
                            colors: "#8A92A6",
                        },
                    },
                    lines: {
                        show: false
                    },
                    categories: res.categories // dari AJAX
                },
                grid: {
                    show: false,
                },
                fill: {
                    type: 'gradient',
                    gradient: {
                        shade: 'dark',
                        type: "vertical",
                        shadeIntensity: 0,
                        gradientToColors: undefined,
                        inverseColors: true,
                        opacityFrom: .4,
                        opacityTo: .1,
                        stops: [0, 50, 80],
                        colors: ["#3a57e8", "#4bc7d2"]
                    }
                },
                tooltip: {
                    enabled: true,
                },
            };

            const chart = new ApexCharts(
                document.querySelector("#d-main"),
                options
            );

            chart.render();

            // tetap support ColorChange bawaan template
            document.addEventListener('ColorChange', (e) => {
                const newOpt = {
                    colors: [e.detail.detail1, e.detail.detail2],
                    fill: {
                        type: 'gradient',
                        gradient: {
                            shade: 'dark',
                            type: "vertical",
                            shadeIntensity: 0,
                            gradientToColors: [
                                e.detail.detail1,
                                e.detail.detail2
                            ],
                            inverseColors: true,
                            opacityFrom: .4,
                            opacityTo: .1,
                            stops: [0, 50, 60],
                            colors: [
                                e.detail.detail1,
                                e.detail.detail2
                            ],
                        }
                    },
                };
                chart.updateOptions(newOpt);
            });

        },
        error: function (xhr) {
            console.error('Gagal load chart:', xhr.responseText);
        }
    });

}

if ($('.d-slider1').length > 0) {
    const options = {
        centeredSlides: false,
        loop: false,
        slidesPerView: 4,
        autoplay:false,
        spaceBetween: 32,
        breakpoints: {
            320: { slidesPerView: 1 },
            550: { slidesPerView: 2 },
            991: { slidesPerView: 3 },
            1400: { slidesPerView: 3 },
            1500: { slidesPerView: 4 },
            1920: { slidesPerView: 5 },
            2040: { slidesPerView: 7 },
            2440: { slidesPerView: 8 }
        },
        pagination: {
            el: '.swiper-pagination'
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },  

        // And if we need scrollbar
        scrollbar: {
            el: '.swiper-scrollbar'  
        }
    } 
    let swiper = new Swiper('.d-slider1',options);

    document.addEventListener('ChangeMode', (e) => {
      if (e.detail.rtl === 'rtl' || e.detail.rtl === 'ltr') {
        swiper.destroy(true, true)
        setTimeout(() => {
            swiper = new Swiper('.d-slider1',options);
        }, 500);
      }
    })
}

function formatTanggal(dateStr) {
    const hari = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
    const bulan = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

    const d = new Date(dateStr);

    const ddd = hari[d.getDay()];
    const dd  = String(d.getDate()).padStart(2, '0');
    const MM  = bulan[d.getMonth()];
    const yyyy = d.getFullYear();

    return `${ddd}, ${dd} ${MM} ${yyyy}`;
}

})(jQuery)
