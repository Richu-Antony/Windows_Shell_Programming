@echo off
@REM mode con cols=50 lines=50
title Execution is starting...

:: Green
color A 

cls

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : All in one Software Solution V6.11.22
echo  Author      : Richu Antony
echo  Description : All in one Software Solution
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 3 127.0.0.1 > nul

:: White
color F
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './Winget_A_T.ps1' ;"

echo.
PING -n 2 127.0.0.1 > nul

cls

:: Green
color A 

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : All in one Software Solution V6.11.22
echo  Author      : Richu Antony
echo  Description : All in one Software Solution
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

pause

::Verified and Tested