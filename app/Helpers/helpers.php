<?php

if (!function_exists('rupiah')) {
    /**
     * Format angka ke Rupiah
     *
     * @param int|float $angka
     * @param bool $prefix
     * @return string
     */
    function rupiah($angka, $prefix = true)
    {
        if ($angka === null) {
            return $prefix ? 'Rp 0' : '0';
        }

        $hasil = number_format($angka, 0, ',', '.');

        return $prefix ? 'Rp ' . $hasil : $hasil;
    }
}
