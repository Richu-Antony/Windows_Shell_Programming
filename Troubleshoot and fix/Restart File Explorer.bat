echo off 
@REM mode con cols=50 lines=50
title Restart File Explorer V6.11.22

cls

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : Restart File Explorer V6.11.22                                  
echo  Author      : Richu Antony                                 
echo  Description : Restart File Explorer                 
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 2 127.0.0.1 > nul

:: Kills and then starts the file explorer.
taskkill /f /im explorer.exe
start explorer.exe

::Verified and Tested