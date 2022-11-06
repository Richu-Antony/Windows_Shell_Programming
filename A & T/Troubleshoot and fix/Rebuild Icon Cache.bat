echo off 
@REM mode con cols=50 lines=50
title Rebuild Icon Cache V2.11.22

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Rebuild Icon Cache V2.11.22                                    
echo  Author      : Richu Antony                                 
echo  Description : Rebuild Icon Cache                 
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 2 127.0.0.1 > nul

set iconcache=%localappdata%\IconCache.db

echo.
echo The explorer process must be temporarily killed before deleting the IconCache.db file. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
echo.
If exist "%iconcache%" goto delete
echo.
echo The IconCache.db file has already been deleted. 
goto restart


:delete
    echo.
    echo Attempting to delete IconCache.db file...
    echo.
    ie4uinit.exe -ClearIconCache
    taskkill /IM explorer.exe /F 
    del "%iconcache%" /A
    start explorer.exe
    echo.
    echo IconCache.db file has been successfully deleted.
    goto restart


:restart
    echo.
    echo.
    echo You will need to restart the PC to finish rebuilding your icon cache.
    echo.
    CHOICE /C:YN /M "Do you want to restart the PC now? "
    IF ERRORLEVEL 2 goto no
    IF ERRORLEVEL 1 goto yes

:yes
    shutdown /r /f /t 00

:no
    exit /B