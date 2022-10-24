@echo off
REM By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@setlocal enableextensions
@cd /d "%~dp0"

color 0a 
title Automated Windows Repair Tool V1.0

:: Information About The Product
echo ----------------------------------------------------------
echo / Tool : Automated Windows Repair Tool V1.0              \
echo \ Version : 1.0                                          /  
echo / Author : Richu Antony                                  \
echo \ Description : Fix the windows corrupted files          /
echo / GitHub : https://www.github.com/Richu-Antony           \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it

echo DO NOT POWER OFF THE COMPUTER DURING THE PROCESS AND REQUIRES INTERNET CONNECTION.
echo.

echo This program runs Listing all files in c and followed by SFC and DISM scan and reboots automatically
echo.

echo Please Connect to the internet For further exection.
:connection
PING google.com | FIND "time=" > NUL
IF ERRORLEVEL 1 goto connection
echo Connection established......
echo.

echo.
echo Now running: System File Checker tool
sfc /scannow
echo.
echo.

echo Now running: Deployment Image Servicing and Management
DISM.exe /Online /Cleanup-image /Restorehealth
echo.
echo.

echo Now running: Scheduled Disk Checkup
chkdsk /f /r
echo.
echo.

echo Now running: List All The Files and Folders In The C Drive
echo.
tree C:// 
echo Now running: Exporting All The Files and Folders List Into C Drive, This May Take a while.
echo.
tree c:\ /a /f > c:\Files and folders list.txt
echo.
echo.

echo Reboot PC? Save the tasks The system is going to reboot
echo.
pause
shutdown /r