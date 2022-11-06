@echo off 
@REM mode con cols=50 lines=50
title Wifi Password - Revel V2.11.22

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Wifi Password - Revel V2.11.22                                    
echo  Author      : Richu Antony                                 
echo  Description : Wifi Password                  
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


netsh wlan export profile key=clear > nul 
findstr /c:"<keyMaterial>" *.xml > WiFi.txt 
powershell -Command "(gc WiFi.txt) -replace '<keyMaterial>', '' -replace '</keyMaterial>', '' -replace 'Wi-Fi-', '' -replace '.xml:', ':' | Out-File -encoding ASCII WiFi.txt" 
del /f /s /q *.xml > nul 
start WiFi.txt

pause

::Verified and Tested