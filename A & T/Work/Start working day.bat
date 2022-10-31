@echo off
@REM mode con cols=50 lines=50
title Start Working Day V31.10.22 10.39

cls
echo.
echo By Rica Inc.
echo #
echo  Tool   : GodMode Cleanup V31.10.22 9.31                                     
echo  Author : Richu Antony                                 
echo  Description : GodMode Cleanup                  
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

set GREETING=Greetings, master! Stay Safe and May The Source Be With You!

echo ===========================================================================
echo *** %GREETING% ***
echo ===========================================================================


echo ==^> Start OUTLOOK"
Start ""  "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"

echo ==^> Start Chrome"
start chrome <URL>
start chrome "" <URL> (new tab)

echo ==^> Start Webstorm
Start ""  "C:\Program Files\JetBrains\WebStorm 2020.2.3\bin\webstorm64.exe"

echo ==^> Start CMD
start /b /d "C:\Git\

echo ==^> Start Sublime Text 3...
Start ""  "C:\Program Files\Sublime Text 3\sublime_text.exe"

PAUSE
echo Goodbye, master!
