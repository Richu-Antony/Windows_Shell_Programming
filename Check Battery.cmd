@echo off
REM By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@setlocal enableextensions
@cd /d "%~dp0"

color 0a 
title Battery Checker Tool V1.0

:: Information About The Product
echo ----------------------------------------------------------
echo / Tool : Battery Checker Tool V1.0                       \
echo \ Version : 1.0                                          /  
echo / Author : Richu Antony                                  \
echo \ Description : Battery health checking                  /
echo / GitHub : https://www.github.com/Richu-Antony           \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it

WMIC PATH Win32_Battery Get EstimatedChargeRemaining

powercfg /batteryreport 
::powercfg /energy /output "c:\energy_report.html"
echo.
echo.

pause