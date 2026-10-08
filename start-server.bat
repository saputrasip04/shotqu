@echo off
title ShotQu PWA Server (Port 8080)
echo ==============================================================
echo   ShotQu Pra-Produksi Film PWA - Server Multi-Device
echo ==============================================================
echo.
echo Menjalankan server...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0server.ps1" -Port 8080
pause
