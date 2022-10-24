@echo off
Title Windows Network Utilities
color 17
mode con:cols=125 lines=40
goto menu
:menu

echo ----------------------------------------------------------------------------------------
echo Note: Some of the present utilities may require 'Admin' Privileges
echo       If so please exit, the right click the file and select: 'Run as Administrator'
echo ----------------------------------------------------------------------------------------
echo What Would You Like To Do?
echo 1 Display DNS
echo 2 Flush DNS
echo 3 Wireless Signal
echo 4 Ping Your Current Connection
echo 5 Run the 'Ipconfig' utility
echo 6 Show The Driver's of Your Current Connection's Card
echo 7 Show Wired (Lan) Settings
echo 8 Release IPv4 Address (If You Run This You MUST Run 'Renew IPv4 Address')
echo 9 Renew IPv4 Address
echo 10 Release / Renew Automated
echo 11 Quit

:choice
echo Please Choose an Option From The Above Menu Only
set /P C=[1,2,3,4,5,6,7,8,9,10,11]?
if '%C%' == '1' goto disdns
if '%C%' == '2' goto clrdns
if '%C%' == '3' goto sig
if '%C%' == '4' goto ping
if '%C%' == '5' goto ip
if '%C%' == '6' goto drv
if '%C%' == '7' goto lan
if '%C%' == '8' goto rel
if '%C%' == '9' goto ren
if '%C%' == '10' goto aut
if '%C%' == '11' goto end
goto choice

:disdns
ipconfig /displaydns
pause
cls
goto menu

:clrdns
ipconfig /cleardns
pause
cls
goto menu

:sig
netsh wlan show interface
pause
cls
goto menu

:ping
ping localhost
pause
cls
goto menu

:ip
ipconfig /allcompartments /all
pause
cls
goto menu

:drv
netsh wlan show drivers
pause
cls
goto menu

:lan
netsh lan dump
pause
cls
goto menu

:rel
echo Note: This will disconnect our remote session and existing downloads if present. 
echo Please provide your callback number if autoreconnection fails. 
pause>nul
ipconfig /release
pause
cls
goto menu

:ren
ipconfig /renew
pause
cls
goto menu

:aut
echo Note: This will disconnect our remote session and existing downloads if present. 
echo Please provide your callback number if autoreconnection fails. 
pause>nul
ipconfig /release
ipconfig /renew
pause
cls
goto menu



:end
exit

