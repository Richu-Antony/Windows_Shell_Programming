
@echo off
title Softwre is installing
echo Installation.bat Script start executing ..........  
echo. 

::=============================== Essentials ================================
Echo === Install 7zip ===
winget install 7zip.7zip
if %ERRORLEVEL% EQU 0 Echo '7zip' installed successfully.
echo. 

@REM Echo === Install VLC ===
@REM winget install VideoLAN.VLC
@REM if %ERRORLEVEL% EQU 0 Echo 'CPUID CPU-Z' installed successfully.
@REM echo. 

@REM Echo === Install Google Chrome ===
@REM winget install Google.Chrome
@REM if %ERRORLEVEL% EQU 0 Echo 'Google Chrome' installed successfully.
@REM echo. 

@REM Echo === Install qBittorrent ===
@REM winget install qBittorrent.qBittorrent
@REM if %ERRORLEVEL% EQU 0 Echo 'qBittorrent' installed successfully.
@REM echo. 

@REM Echo === Install IObit AdvancedSystemCare ===
@REM winget install IObit.AdvancedSystemCare
@REM if %ERRORLEVEL% EQU 0 Echo 'IObit AdvancedSystemCare' installed successfully. 
@REM echo. 

@REM Echo === Install IObit Uninstaller ===
@REM winget install IObit.Uninstaller
@REM if %ERRORLEVEL% EQU 0 Echo 'IObit Uninstaller' installed successfully.
@REM echo.  

@REM Echo === Install IObit Piriform CCleaner ===
@REM winget install Piriform.CCleaner
@REM if %ERRORLEVEL% EQU 0 Echo 'Piriform CCleaner' installed successfully.
@REM echo.  

@REM ::======================================== Programming ====================
@REM Echo === Install Visual Studio Code ===
@REM winget install Microsoft.VisualStudioCode
@REM if %ERRORLEVEL% EQU 0 Echo 'Visual Studio Code' installed successfully.
@REM echo.  

@REM Echo === Install Oracle JDK 18 ===
@REM winget install Oracle.JDK.18
@REM if %ERRORLEVEL% EQU 0 Echo ' Oracle JDK 18' installed successfully.
@REM echo.  

@REM Echo === Install Xampp ===
@REM winget install ApacheFriends.Xampp
@REM if %ERRORLEVEL% EQU 0 Echo 'Xampp' installed successfully.
@REM echo.  

@REM Echo === Install Python ===
@REM winget install Python.Python.3
@REM if %ERRORLEVEL% EQU 0 Echo 'Python' installed successfully.
@REM echo.  

@REM Echo === Install msys2 ===
@REM winget install msys2.msys2
@REM if %ERRORLEVEL% EQU 0 Echo 'msys2' installed successfully.
@REM echo.  

@REM Echo === Install Git ===
@REM winget install Git.Git
@REM if %ERRORLEVEL% EQU 0 Echo 'Git' installed successfully.
@REM echo.  

@REM Echo === Install MongoDB Server ===
@REM winget install MongoDB.Server
@REM if %ERRORLEVEL% EQU 0 Echo 'MongoDB Server' installed successfully.
@REM echo.

@REM Echo === Install MongoDB Compass Full ===
@REM winget install MongoDB.Compass.Full
@REM if %ERRORLEVEL% EQU 0 Echo 'MongoDB Compass Full' installed successfully.
@REM echo. 

@REM Echo === Install Notepad++ ===
@REM winget install Notepad++.Notepad++
@REM if %ERRORLEVEL% EQU 0 Echo 'Notepad++' installed successfully.
@REM echo. 

@REM Echo === Install Android Studio ===
@REM winget install Google.AndroidStudio
@REM if %ERRORLEVEL% EQU 0 Echo 'Android Studio' installed successfully.
@REM echo.  

@REM ::================================= Extensions ========================
@REM Echo === Install Microsoft DirectX ===
@REM winget install  Microsoft.DirectX
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.DirectX' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2005Redist-x64 ===
@REM winget install Microsoft.VC++2005Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2005Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2008Redist-x64 ===
@REM winget install Microsoft.VC++2008Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2008Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2010Redist-x64 ===
@REM winget install Microsoft.VC++2010Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2010Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2012Redist-x64 ===
@REM winget install Microsoft.VC++2012Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2012Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2013Redist-x64 ===
@REM winget install Microsoft.VC++2013Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2013Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2015-2019Redist-x64 ===
@REM winget install Microsoft.VC++2015-2019Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2015-2019Redist-x64' installed successfully.
@REM echo. 

@REM Echo === Install Microsoft.VC++2015-2022Redist-x64 ===
@REM winget install Microsoft.VC++2015-2022Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2015-2022Redist-x64' installed successfully.
@REM echo.

@REM Echo === Install Microsoft.VC++2015Redist-x64 ===
@REM winget install Microsoft.VC++2015Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2015Redist-x64' installed successfully.
@REM echo.

@REM Echo === Install Microsoft.VC++2017Redist-x64 ===
@REM winget install Microsoft.VC++2017Redist-x64
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2017Redist-x64' installed successfully.
@REM echo.

@REM Echo === Install Microsoft.DotNet.DesktopRuntime.3_1 ===
@REM winget install Microsoft.DotNet.DesktopRuntime.3_1
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.VC++2017Redist-x64' installed successfully.
@REM echo.

@REM Echo === Install Microsoft.DotNet.DesktopRuntime.5 ===
@REM winget install Microsoft.DotNet.DesktopRuntime.5
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.DotNet.DesktopRuntime.5' installed successfully.
@REM echo.

@REM Echo === Install Microsoft.DotNet.DesktopRuntime.6 ===
@REM winget install Microsoft.DotNet.DesktopRuntime.6
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft.DotNet.DesktopRuntime.6' installed successfully.
@REM echo.

@REM ::================================= Power Users =======================
@REM Echo === Install Microsoft PowerToys ===
@REM winget install Microsoft.PowerToys
@REM if %ERRORLEVEL% EQU 0 Echo 'Microsoft PowerToys' installed successfully.
@REM echo.

@REM Echo === Install CPUID CPU-Z ===
@REM winget install CPUID.CPU-Z
@REM if %ERRORLEVEL% EQU 0 Echo 'CPUID CPU-Z' installed successfully.
@REM echo.  

@REM Echo === Install NotebookFanControl ===
@REM winget install Hirschmann.NotebookFanControl
@REM if %ERRORLEVEL% EQU 0 Echo 'NotebookFanControl' installed successfully.
@REM echo. 

@REM Echo === Install Blender ===
@REM winget install BlenderFoundation.Blender
@REM if %ERRORLEVEL% EQU 0 Echo 'Blender' installed successfully.
@REM echo. 

@REM Echo === Install OBSStudio ===
@REM winget install OBSProject.OBSStudio
@REM if %ERRORLEVEL% EQU 0 Echo 'OBSStudio' installed successfully.
@REM echo. 

@REM Echo === Install InnoSetup ===
@REM winget install JRSoftware.InnoSetup
@REM if %ERRORLEVEL% EQU 0 Echo 'InnoSetup' installed successfully.
@REM echo. 

::================================= Other Purpose ======================

title All in one 'Richu Antony' Configuration Program

cmd /k