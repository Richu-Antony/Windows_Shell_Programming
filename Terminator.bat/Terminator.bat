@echo off
title Terminator.bat

REM removes header from PsExec output;
REM add 2>&1 | %FILTER% to the end of PsExec commands.
set F1=find /v "PsExec v"
set F2=find /v "Copyright"
set F3=find /v "Sysinternals"
set FILTER=%F1%^|%F2%^|%F3%

:PC
Title Terminator
cls
set PCname=blank
set /p PCname="Enter PC Name or IP: "
if %PCname%==blank (
	echo.
	echo  Selection cannot be blank. Please try again!
	echo.
	pause
	cls
	goto PC
)
cls
goto start


:start
cls

echo Running using PC: %PCname%
echo.
echo Please select an option:
echo.
echo 1. Check System Uptime
echo 2. Reboot the computer
echo 3. Logoff current user
echo 4. Change PC selection
echo.
set selection=blank
set /p selection="Enter Selection (1-4): "

if %selection%==blank (
	echo.
	echo  Selection cannot be blank. Please try again!
	echo.
	pause
	cls

	goto start
	)
if '%selection%'=='1' goto Uptime
if '%selection%'=='2' goto Reboot-cls
if '%selection%'=='3' goto Logoff
if '%selection%'=='4' goto PC
echo.
echo  '%selection%' is not a valid option. Please try again!

echo.
pause
goto start


:Uptime
cls

echo Performing Uptime check...
echo.
systeminfo /s %PCname% | findstr /c:"Host Name" /c:"OS Name:" /c:"Boot Time" /c:"Up Time"

goto Reboot-no-cls

:Reboot-cls
cls
:Reboot-no-cls
echo.
set reboot=N
set /p reboot="Reboot the computer? (Y or N): "

if /I '%reboot%'=='Y' (
	cls
	echo Rebooting %PCname%...
	echo.
	Shutdown /r /f /t 10 /m \\%PCname% /c "Your PC will reboot in 10 seconds" /d P:0:0
	echo.
	echo Done!
	echo.
	pause
	goto PC
)
if /I '%reboot%'=='N' (
	echo.
	echo  Reboot canceled
	echo.
	pause
	goto start
)
echo.
echo '%reboot%' is not a valid option. Please try again!

echo.
pause
goto PC


:Logoff
cls
echo.
set logoff=N
set /p logoff="Logoff current user? (Y or N): "

if /I '%logoff%'=='Y' (
	cls
	echo logging off current user on %PCName%
	psexec.exe \\%PCname% logoff console 2>&1 | %FILTER%
	echo.
	pause
	goto start
)
if /I '%logoff%'=='N' (
	echo.
	echo  Logoff canceled
	echo.
	pause
	goto start
)
echo.
echo '%logoff%' is not a valid option. Please try again!

echo.
pause
goto PC
