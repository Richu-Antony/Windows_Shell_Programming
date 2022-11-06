@echo off
@REM mode con cols=50 lines=50
title Resync Time V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Resync Time V6.11.22                         
echo  Author      : Richu Antony                                 
echo  Description : Resync Time  
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


:: Force administrator permissions
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )


:: Fixed common errors with w32tm
w32tm /unregister
w32tm /register
:: Fixed common errors with w32tm
net start w32time
w32tm /resync

pause

::Verified and Tested