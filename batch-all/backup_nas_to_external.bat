@echo off
::
::
:: 2017-11-12
:: Update: 2019-08-18
:: Update: 2021-07-11
::

setlocal Enabledelayedexpansion

set LOGDIR=.\Logs
set LOGFILE=backup_%date%.log
set LOGOPT=/LOG+:%LOGDIR%\%LOGFILE% /NP /NDL
set COPYOPT=/E /MIR /R:1 /W:1

set BKUPDIR=.\NAS
set SRCDRV=Z:

:: Source directories
::
set TOTAL=4
set SRCDIR[1]=Backup
set SRCDIR[2]=Photo
set SRCDIR[3]=Users
set SRCDIR[4]=Video


::
:: execution part
::

if not exist %SRCDRV%\ (
	echo Z drive is not exist
	pause
	goto :EOF
)

if not exist %LOGDIR%		mkdir %LOGDIR%


set T1=%TIME%
echo =======================
echo From: %SRCDRV%
echo To: %BKUPDIR%
echo Begin: %T1%
echo =======================
echo.

for /l %%i in (1,1,%TOTAL%) do (
	if not exist %SRCDRV%\!SRCDIR[%%i]! (
		echo =======================
		echo not found %SRCDIR%\!SRCDIR[%%i]!
		echo =======================
	) else (
		echo %SRCDRV%\!SRCDIR[%%i]!
		robocopy %SRCDRV%\!SRCDIR[%%i]! %BKUPDIR%\!SRCDIR[%%i]! %COPYOPT% %LOGOPT%
	)
)


set T2=%TIME%
call :DIFF %T1% %T2%
echo =======================
echo Finish: %T2% (%DURATION%)
echo =======================
echo.

endlocal
goto :EOF




:DIFF

for /f "tokens=1-3 delims=:." %%A in ('echo %~1') do (
	set HH=%%A&set MM=%%B&set SS=%%C
)
set /a H=1%HH% - 100
set /a M=1%MM% - 100
set /a S=1%SS% - 100
set /a UT1=%H%*3600 + %M%*60 + %S%

for /f "tokens=1-3 delims=:." %%A in ('echo %~2') do (
	set HH=%%A&set MM=%%B&set SS=%%C
)
set /a H=1%HH% - 100
set /a M=1%MM% - 100
set /a S=1%SS% - 100
set /a UT2=%H%*3600 + %M%*60 + %S%

set /a DF=%UT2%-%UT1%
set /a HH=(%DF%/3600) + 100
set HH=%HH:~1,2%
set /a MM=((%DF% %% 3600)/60) + 100
set MM=%MM:~1,2%
set /a SS=(%DF% %% 60) + 100
set SS=%SS:~1,2%

set DURATION=%HH%:%MM%:%SS%

exit /b
