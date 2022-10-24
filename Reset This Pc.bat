@echo off
REM By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

color 0a 
title Reset This PC V1.0

:: Information About The Product
echo ----------------------------------------------------------
echo / Tool : Reset This PC V1.0                              \
echo \ Version : 1.0                                          /  
echo / Author : Richu Antony                                  \
echo \ Description : Rest This PC                             /
echo / GitHub : https://www.github.com/Richu-Antony           \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it

systemreset --factoryreset

exit