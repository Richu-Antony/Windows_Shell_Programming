@echo off
@REM mode con cols=50 lines=50
title Start Program Startup V6.11.22

cls

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : Program Startup V6.11.22                                
echo  Author      : Richu Antony                                 
echo  Description : Program Startup Automation             
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

set GREETING=Greetings, master! Stay Safe and May The Source Be With You! 

echo ===========================================================================
echo *** %GREETING% ***
echo ===========================================================================

echo.
echo ==^> Start Microsoft Edge"
Start ""  "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
echo.

echo ==^> Start Android Studio
Start ""  "C:\Program Files\Android\Android Studio\bin\studio64.exe"
echo.

echo ==^> Start Visual studio code
Start ""  "C:\Users\richu\AppData\Local\Programs\Microsoft VS Code\Code.exe"
echo.

echo ==^> Start Explorer
start explorer
echo.

PAUSE
echo Goodbye, master!

::Verified and Tested