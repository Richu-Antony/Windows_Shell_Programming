:: This kills the Firefox web browser and restarts it.

@echo off

:: clears the screen
cls

:: Enter your process name below
tskill "firefox"

:: pauses for 5 seconds
PING 1.1.1.1 -n 1 -w 5000 >NUL

:: starts the program without opening a new command window
:: you may need to change the file path below
start "" "C:\Program Files\Mozilla Firefox\firefox.exe"

:: clears the screen again
cls

:: echos the following
echo Mozilla Firefox has been restarted. Press any key to exit.

pause
