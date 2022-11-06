@echo off
@REM This script gives you the ability to search for any text in the NetStat command (ex. a specific port).
@REM It also gives you the ability in the next step to kill a specific process.
@REM Useful when you need to find and kill a process that uses a specific port in your system.
@REM Should run as Administrator.

@REM Author: https://github.com/ckaridis

:netStat
set text=
echo === NetStat ===
set /p text=Text to find in NetStat command (type "a" to list all processes): 
if '%text%'=='' goto taskKill
if '%text%'=='a' goto netStatAll
call :netStatFind "%text%"
goto netStat

:netStatFind
netstat -abno | find "%~1"
goto netStat

:netStatAll
netstat -abno
goto netStat


:taskKill
echo === TaskKill ===
set taskId=
set /p taskId=Enter the PID of the task to kill (leave blank to go back or "x" to exit): 
if '%taskId%'=='x' goto endOfFile
if '%taskId%'=='' goto netStat
taskkill /F /PID "%taskId%"
goto taskKill

:endOfFile
exit /B