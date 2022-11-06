@echo off
@REM mode con cols=50 lines=50
title Reset Network V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Reset Network V6.11.22                          
echo  Author      : Richu Antony                                 
echo  Description : Reset Network Configuration and settings        
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


:: PING GOOGLE
set /p pgoogle=Do you want to ping Google? [S/n]: 
if %pgoogle% EQU s (
    ping google.es
) else (
    if %pgoogle% EQU S (
    ping google.es
    ) 
)

set /p pdnsgoogle=Do you want to ping Google's DNS's? [S/n]: 
if %pdnsgoogle% EQU s (
    ping 8.8.8.8
) else (
    if %pdnsgoogle% EQU S (
    ping 8.8.8.8
    ) 
)

netsh interface show interface


set /p interfaz=Type the name of the network interface you want to use AS IT APPEARS ABOVE: 
netsh interface ipv4 set dnsservers %interfaz% static 8.8.8.8 primary
netsh interface ipv4 add dnsservers %interfaz% 8.8.4.4 index=2 

cls

:: Renovar cache DNS
ipconfig /flushdns

cls

:: Renew DHCP Leases
ipconfig /release
ipconfig /renew

cls

ipconfig /all

echo.
echo COMPLETE PROCESS
pause

::Verified and Tested