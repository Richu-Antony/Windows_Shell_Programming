@echo off
REM By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@setlocal enableextensions
@cd /d "%~dp0"

color 0a 
title No Internet Conecction Fixer V1.0

:: Information About The Product
echo ----------------------------------------------------------
echo / Tool : No Internet Conecction Fixer V1.0               \
echo \ Version : 1.0                                          /  
echo / Author : Richu Antony                                  \
echo \ Description : Reset and fix                            /
echo / GitHub : https://www.github.com/Richu-Antony           \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it
pause
echo.

:netsh
netsh winsock reset
netsh int ip reset

:ipconfig
ipconfig /release
ipconfig /renew
ipconfig /flushdns

echo Process Done ! Now Restart Your PC !
pause