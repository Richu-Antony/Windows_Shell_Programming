@echo off
@REM mode con cols=50 lines=50
title TCP/IP Reset and repair V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : TCP/IP Reset and repair V6.11.22                 
echo  Author      : Richu Antony                                 
echo  Description : WINDOWS 7-10 TCP/IP Reset and repair
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

COLOR 1F

ECHO ==============================================================
ECHO # RESET IP ....
echo.
netsh int ip reset
echo.

ECHO ==============================================================
ECHO # RESET IP TO DHCP ....
echo.
netsh interface ip set address "Local Area Connection" dhcp
echo.
echo.

ECHO ==============================================================
ECHO # RESET DNS TO DHCP ....
echo.
netsh interface ip set dns "Local Area Connection" dhcp
echo.
echo.

ECHO ==============================================================
ECHO # RESET WINSOCK ....
echo.
netsh winsock reset
echo.
echo.

ECHO ==============================================================
ECHO # CLEAR ARP CACHE ....
echo.
netsh interface ip delete arpcache
echo.
echo.

ECHO ==============================================================
ECHO # CLEAR DNC CACHE ....
echo.
ipconfig /flushdns
echo.
echo.
ECHO. "REPAIR DONE...."
echo.

PAUSE
EXIT

::Verified and Tested