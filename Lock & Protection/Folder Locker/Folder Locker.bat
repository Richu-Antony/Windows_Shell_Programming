@echo off 
@REM mode con cols=50 lines=50
title Private Folder V2.11.22


:Main
cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Private Folder V2.11.22                                  
echo  Author      : Richu Antony                                 
echo  Description : Private Folder                 
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

color a
cls

if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Private goto MDLOCKER

:CONFIRM
    echo.
    echo - Version 2.11.22
    echo.
    echo =======================================================
    echo "Coded By Richu Antony / Do Not Share Without Credits"
    echo =======================================================
    timeout /t 3 /nobreak
    title Private Folder - Lock Function
    echo.
    echo ============================================================
    echo  Are you sure you want to lock the Private folder (Yes/No) ?
    echo ============================================================
    echo.
    set/p "cho=> "
    if %cho%==Yes goto LOCK
    if %cho%==yes goto LOCK
    if %cho%==no goto END
    if %cho%==No goto END
    echo Invalid choice.
    goto CONFIRM
    
:LOCK
    ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
    attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
    echo Private Folder locked
    goto End

:UNLOCK
    echo.
    echo - Version 2.11.22
    echo.
    echo =======================================================
    echo "Coded By Richu Antony / Do Not Share Without Credits"
    echo =======================================================
    timeout /t 3 /nobreak
    title Private Folder - Unlock Function
    echo.
    echo =============================================
    echo  Enter Password to Unlock The Private folder!
    echo =============================================
    echo.

    set/p "pass=>"
    if NOT %pass%== Jarvis goto FAIL
    attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
    ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
    title Private Folder - Coded By Richu Antony
    echo.
    echo Private Folder Unlocked Successfully
    echo.
    timeout /t 5 /nobreak
    title Private Folder - Help Page
    echo.
    echo.
    echo ==========================================
    echo  Would You Need A Help/Support... (Yes/No) ?
    echo ==========================================
    echo.

:choise
    set/p "AREYOUSURE=> "
    if /I "%AREYOUSURE%" EQU "No" goto somewhere
    if /I "%AREYOUSURE%" EQU "no" goto somewhere
    if /I "%AREYOUSURE%" EQU "Yes" goto somewhere_else
    if /I "%AREYOUSURE%" EQU "yes" goto somewhere_else
    goto choise

:somewhere
    exit

:somewhere_else
    cls
    start chrome.exe https://github.com/
    start chrome.exe https://www.instagram.com/
    goto End

:FAIL
    echo Invalid password
    goto end

:MDLOCKER
    md Private
    echo.
    echo Private created successfull
    pause
    goto End

:End

::Verified and Tested