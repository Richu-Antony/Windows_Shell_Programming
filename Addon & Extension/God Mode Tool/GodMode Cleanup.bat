@echo off
@REM mode con cols=50 lines=50
title GodMode Cleanup V6.11.22

cls

start GodMode_Msg.vbs


@REM Color 3f
:: Green
color A 


:mainmenu
    cls
    echo.
    echo Copyright(C) 2022 By Rica Inc.
    echo #
    echo  Tool        : GodMode Cleanup V6.11.22
    echo  Author      : Richu Antony                                 
    echo  Description : GodMode Cleanup                  
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.
    echo [1]- Start Scan ^ [2]-Help ^ [3]-Leave
    echo. 
    set /p choice="Choice: "


    if %choice% == 1 ( 
       goto scan
    )

    if %choice% == 2 (
       goto help
    )

    if %choice% == 3 (
       exit
    ) else (
       goto error
    )

:scan
    cls
    echo //// SCAN \\\\
    echo.
    echo.
    echo -> Starting scan
    echo.
    echo Scanning addons... (1/3)
    set /a addonscount = 0
    set /a cachecount = 0
    set /a serverfilecount = 0

    for %%x in (garrysmod\addons\*.gma) do set /a addonscount+=1

    echo.
    echo Scanning cache... (2/3)

    for %%x in (garrysmod\cache\*.*) do set /a cachecount+=1
    for %%x in (garrysmod\cache\lua\*.*) do set /a cachecount+=1
    for %%x in (garrysmod\cache\workshop\*.*) do set /a cachecount+=1
    :: Do same for data

    echo.
    echo Scanning server files... (3/3)

    for %%x in (garrysmod\downloads\server\*.gma) do set /a serverfilecount+=1
    for %%x in (garrysmod\downloadlists*.lst) do set /a serverfilecount+=1
    :: Do same for download
    echo.

:scanend
    cls
    echo  //// SCAN \\\\
    echo.
    echo Scan end !
    echo.
    echo.
    echo. 
    echo Addons: %addonscount% files
    echo.
    echo Cache: %cachecount% files
    echo.
    echo Server files: %serverfilecount%
    echo. 
    echo [0]-Clean everything  ^|  [1]-Clean addons  ^|  [2]-Clean cache  ^|  [3]-Clean server files
    echo ([b]-Back)
    echo. 
    set /p scanchoix=""

    if %scanchoix% == 0 (
        del garrysmod\addons\*.gma /f /q
        del garrysmod\cache\*.* /f /q /s
        del garrysmod\downloads\*.*  /f /q /s
        del garrysmod\download\*.* /f /q /s
        rmdir garrysmod\download\ /s /q
        mkdir garrysmod\download\
        del garrysmod\downloadlists\*.lst /f /q /s
        del garrysmod\data\*.* /f /q /s
        rmdir garrysmod\data\ /s /q
        mkdir garrysmod\data\
        goto mainmenu
    )

    if %scanchoix% == 1 (
        del garrysmod\addons\*.gma /f /q
        goto mainmenu
    )

    if %scanchoix% == 2 (
        del garrysmod\cache\*.* /f /q /s
        del garrysmod\data\*.* /f /q /s
        goto mainmenu
    )

    if %scanchoix% == 3 (
        del garrysmod\downloads\*.* /f /q /s
        del garrysmod\download\*.* /f /q /s
        del garrysmod\downloadlists\*.lst /f /q /s
        goto mainmenu
    )

    if %scanchoix% == b (
        goto mainmenu
    ) else (
        goto error2
    )


:: Main menu choice is wrong
:error
    cls
    echo #### INCORRECT INPUT ####
    pause
    goto mainmenu

:: Clean menu choice is wrong
:error2
    cls
    echo #### INCORRECT INPUT ####
    pause
    goto scanend

:: Help text
:help
    cls
    echo.
    echo Copyright(C) 2022 By Rica Inc.
    echo #
    echo  Tool        : GodMode Cleanup V6.11.22                                
    echo  Author      : Richu Antony                                 
    echo  Description : GodMode Cleanup                  
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.
    echo Any file deletion is irreversible
    echo If the ammount of files/addons is high, cleanup might take several minutes
    echo.
    echo It is recommended use to clean your GodMode up regulary
    echo.
    echo.
    pause
    goto mainmenu

::Verified and Tested