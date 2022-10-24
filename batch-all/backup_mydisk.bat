@echo off
::
:: Update from laptop to external storage.
::
:: 2018-10-10
:: Update: 2019-08-18
:: Update: 2021-07-11
::


setlocal Enabledelayedexpansion

set LOGDIR=.\Logs
set LOGFILE=%COMPUTERNAME%_%USERNAME%_%date%.log
set LOGOPT=/LOG+:%LOGDIR%\%LOGFILE% /NP /NDL
set COPYOPT=/E /MIR /R:1 /W:1 /XA:H


set SRCDRV=%HOMEDRIVE%%HOMEPATH%
for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A&SET MM=%%B&SET DD=%%C)
set BKUPDIR=.\%COMPUTERNAME%_%USERNAME%_%YY%%MM%

set TOTAL=10
set SRCDIR[1]=Desktop
set SRCDIR[2]=Documents
set SRCDIR[3]=Downloads
set SRCDIR[4]=Favorites
set SRCDIR[5]=Pictures
set SRCDIR[6]=Videos
set SRCDIR[7]=Music
set SRCDIR[8]=Dropbox
set SRCDIR[9]=OneDrive
set SRCDIR[10]="Google 드라이브"



set T1=%TIME%
echo =======================
echo From: %SRCDRV%
echo To: %BKUPDIR%
echo Begin: %T1%
echo =======================
echo.


::
:: execution part
::
if not exist %SRCDRV%		echo error %SRCDRV% & goto :error_label
if not exist %LOGDIR%		echo %LOGDIR% & mkdir %LOGDIR%
if not exist %BKUPDIR%		echo %BKUPDIR% & mkdir %BKUPDIR%

for /l %%i in (1,1,%TOTAL%) do (
	if not exist %SRCDRV%\!SRCDIR[%%i]! (
		echo =======================
		echo not found %SRCDIR%\!SRCDIR[%%i]!
		echo =======================
	) else (
		echo %SRCDRV%\!SRCDIR[%%i]!  %BKUPDIR%\!SRCDIR[%%i]!
		robocopy %SRCDRV%\!SRCDIR[%%i]! %BKUPDIR%\!SRCDIR[%%i]! %COPYOPT% %LOGOPT%
	)
)


:error_label



set T2=%TIME%
call :DIFF %T1% %T2%
echo =======================
echo Finish: %T2% (%DURATION%)
echo =======================
echo.

pause

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