@echo off 
@REM mode con cols=50 lines=50
title Wifi Password - Reveler V6.11.22

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Wifi Password - Reveler V6.11.22                                    
echo  Author      : Richu Antony                                 
echo  Description : All the Wifi Password Reveler                 
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 3 127.0.0.1 > nul

netsh wlan export profile key=clear > nul 
findstr /c:"<keyMaterial>" *.xml > WiFi.txt 
powershell -Command "(gc WiFi.txt) -replace '<keyMaterial>', '' -replace '</keyMaterial>', '' -replace 'Wi-Fi-', '' -replace '.xml:', ':' | Out-File -encoding ASCII WiFi.txt" 
del /f /s /q *.xml > nul 
start WiFi.txt

exit

::Verified and Tested