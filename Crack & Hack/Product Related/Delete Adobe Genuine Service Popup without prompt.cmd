@echo off
@REM mode con cols=50 lines=50
title Delete Adobe Genuine Service V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Delete Adobe Genuine Service V6.11.22                       
echo  Author      : Richu Antony                                 
echo  Description : Delete Adobe Genuine Service Popup without prompt V6.11.22        
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


:init
    setlocal DisableDelayedExpansion
    set "batchPath=%~0"
    for %%k in (%0) do set batchName=%%~nk
    set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
    setlocal EnableDelayedExpansion

:checkPrivileges
    NET FILE 1>NUL 2>NUL
    if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
    if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
    echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
    echo args = "ELEV " >> "%vbsGetPrivileges%"
    echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
    echo args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
    echo Next >> "%vbsGetPrivileges%"
    echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
    "%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
    exit /b

:gotPrivileges
    setlocal & pushd .
    cd /d %~dp0
    if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
    cls
    goto Start

:Start
    echo Important note: Please ignore any "file/service/directory not found" errors. They are natural, 
    echo and completely fine if they occur.
timeout 8
taskkill /f /im "AGMService.exe"
taskkill /f /im "AGSService.exe"
Rmdir /s /q "C:\Program Files (x86)\Common Files\Adobe\AdobeGCClient" 
Rmdir /s /q "C:\Program Files (x86)\Common Files\Adobe\OOBE\PDApp\AdobeGCClient"
sc.exe delete "AGMService"
sc.exe delete "AGSService"
Rmdir /s /q "C:\Users\Public\Documents\AdobeGCData"
Rmdir /s /q "C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\AdobeGenuineClient"
del /f /q /s "C:\Windows\System32\Tasks\AdobeGCInvoker-1.0"
del /f /q /s "C:\Windows\System32\Tasks_Migrated\AdobeGCInvoker-1.0"
del /f /q /s "C:\Program Files (x86)\Adobe\Adobe Creative Cloud\Utils\AdobeGenuineValidator.exe"
del /f /q /s "C:\Windows\Temp\adobegc.log"
del /f /q /s "%userprofile%\AppData\Local\Temp\adobegc.log"
goto Finish

:Finish
    echo ======================================================================
    echo Removal of Adobe Genuine Service has finished.
    echo.
    echo Please note that although Adobe Genuine Service's file, services, and folders have been removed, 
    echo it may come back. You will need to re-run this script, as the removal is not perfect.
    echo.
    echo Also note the fact that if you re-install or update any Adobe apps, the Adobe Genuine Service will be 
    echo reinstroduced, so the script will need to be run again.
    echo .
    echo Before you exit, btw there is an optional and manual deletion of prefetch files created by Adobe Genuine Service.
    echo To find these prefetch files, look in "C:\Windows\Prefetch".
    echo.
    echo Look for any .PF file with "AGS", "AMG", "AdobeGenuine", or of the like in the filename and delete that file manually. 
    echo This will cause no harm to your computer, so don't worry :)
    echo.
    echo.
    pause
    exit

::Verified and Tested