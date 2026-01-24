<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bank Sampah Songo || @yield('title')</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">

        <!-- Start Include All CSS -->
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/bootstrap.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/animate.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/themewar-font.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/organio-icon.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/owl.carousel.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/owl.theme.default.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/nice-select.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/slick.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/lightcase.css') }}">

        <!-- Revolution Slider Setting CSS -->
        <link rel="stylesheet" type="text/css" href="{{ asset('assets/portofolio/css/settings.css') }}">

        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/preset.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/ignore_for_wp.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/theme.css') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/portofolio/css/responsive.css') }}"/>
        <!-- End Include All CSS -->

        <!-- Favicon Icon -->
        <link rel="icon"  type="image/png" href="{{ asset('assets/logo/logo-1.png') }}">
        <!-- Favicon Icon -->
    </head>
    <body>
        <!-- Preloading -->
        <div class="preloader clock text-center">
            <div class="organiaLoader">
                <div class="loaderO">
                    <span>S</span>
                    <span>O</span>
                    <span>N</span>
                    <span>G</span>
                    <span>O</span>
                </div>
            </div>
        </div>
        <!-- Preloading -->

        @include('Portofolio.component.header')
        
        @yield('content')

        <!-- Bact To Top -->
        <a href="javascript:void(0);" id="backtotop"><i class="twi-arrow-to-top1"></i></a>
        <!-- Bact To Top -->

        <!-- Start Include All JS -->
        <script src="{{ asset('assets/portofolio/js/jquery.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/jquery-ui.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/jquery.plugin.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/jquery.countdown.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/jquery.appear.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/owl.carousel.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/owl.carousel.filter.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/shuffle.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/masonry.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/nice-select.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/slick.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/lightcase.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/gmaps.js') }}"></script>
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyBJtPMZ_LWZKuHTLq5o08KSncQufIhPU3o"></script>

        <!-- Slider Revolution Main Files -->
        <script src="{{ asset('assets/portofolio/js/jquery.themepunch.tools.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/jquery.themepunch.revolution.min.js') }}"></script>

        <!-- Slider Revolution Extension -->    
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.actions.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.carousel.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.kenburn.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.layeranimation.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.migration.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.navigation.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.parallax.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.slideanims.min.js') }}"></script>
        <script src="{{ asset('assets/portofolio/js/extensions/revolution.extension.video.min.js') }}"></script>

        <script src="{{ asset('assets/portofolio/js/theme.js') }}"></script>

    </body>
</html>