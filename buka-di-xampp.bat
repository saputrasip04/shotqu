@echo off
title ShotQu Pra-Produksi Film - XAMPP Launcher
cd /d "%~dp0"

echo ======================================================================
echo    ShotQu Pra-Produksi Film & Televisi - SMKN Ihya Ulummudin
echo           Koneksi XAMPP (Apache, PHP & MariaDB/MySQL)
echo ======================================================================
echo.

:: 1. Cek Service/Proses Apache & MySQL
powershell -NoProfile -Command "
$httpd = Get-Process httpd -ErrorAction SilentlyContinue
$mysqld = Get-Process mysqld -ErrorAction SilentlyContinue

if (-not $httpd) {
    Write-Host '⚠️  Apache belum berjalan. Mencoba menjalankan Apache...' -ForegroundColor Yellow
    if (Test-Path 'F:\xampp\apache\bin\httpd.exe') {
        Start-Process 'F:\xampp\apache\bin\httpd.exe' -WindowStyle Hidden
    }
} else {
    Write-Host '✅ Apache XAMPP: AKTIF (Running)' -ForegroundColor Green
}

if (-not $mysqld) {
    Write-Host '⚠️  MySQL belum berjalan. Mencoba menjalankan MySQL...' -ForegroundColor Yellow
    if (Test-Path 'F:\xampp\mysql\bin\mysqld.exe') {
        Start-Process 'F:\xampp\mysql\bin\mysqld.exe' -ArgumentList '--defaults-file=F:\xampp\mysql\bin\my.ini','--standalone' -WindowStyle Hidden
    }
} else {
    Write-Host '✅ MySQL Database: AKTIF (Running)' -ForegroundColor Green
}
"

:: 2. Tampilkan Info Alamat Akses
echo.
echo ----------------------------------------------------------------------
echo  Alamat Akses:
echo  * Komputer / Laptop : http://localhost/shotlist
echo  * Portal Guru/Admin : http://localhost/shotlist/login.html
echo  * Database Admin    : http://localhost/phpmyadmin
echo.
powershell -NoProfile -Command "
$ips = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object { 
    $_.InterfaceAlias -notmatch 'Loopback' -and $_.IPAddress -notmatch '^169\.' 
}
foreach ($ip in $ips) {
    Write-Host (' * HP Android / Tab  : http://' + $ip.IPAddress + '/shotlist (Wi-Fi: ' + $ip.InterfaceAlias + ')') -ForegroundColor Cyan
}
"
echo ----------------------------------------------------------------------
echo.
echo Membuka ShotQu di browser...
timeout /t 1 /nobreak >nul
start http://localhost/shotlist

echo.
echo Aplikasi telah dibuka di peramban web.
echo Tekan sembarang tombol untuk menutup jendela ini...
pause >nul
