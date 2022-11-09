@echo off
color fc
title Wifi-Hotspot
pause
color fc
echo Press any key to create and set SSID and key of your wifi network.
rem space   
netsh wlan set hostednetwork mode=allow ssid=WiKeyMouse key=sangam123 keyUsage=persistent
pause
echo Press any key to start the previously created hotspot.
netsh wlan start hostednetwork
pause
echo Press any key to show detail of Wifi card and connected device.
netsh wlan show hostednetwork
pause
echo Press any key to stop the hosted network and exit from this window
netsh wlan stop hostednetwork
pause
