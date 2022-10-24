
@echo off  
title Simplify Your Life


echo.
echo Please Support Us. 
echo.
echo Execution is starting.....
echo.
echo.
PING -n 3 127.0.0.1 > nul

@REM Individual Application Installation
@REM ./Individual.bat

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './Winget_A_T.ps1'"
@REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './Winget_Operations.ps1'"
:: PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\New\myscript.ps1'"

echo.
color 02
PING -n 2 127.0.0.1 > nul
color 01
PING -n 2 127.0.0.1 > nul
color 0C 
PING -n 2 127.0.0.1 > nul
color 0D
PING -n 2 127.0.0.1 > nul
color 0E
PING -n 2 127.0.0.1 > nul
color 04
PING -n 2 127.0.0.1 > nul
color 0A
echo                                   AUTHOR: Richu Antony
echo.
echo ==== Thanks for using the service please help us to improve the work by donating and contributing ====

echo.
pause