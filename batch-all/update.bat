@echo off
::
::
:: Update from laptop to external storage.
::
:: 2019-02-08
::
::
::echo robocopy "%HOME%\%%d" "%BKUPDIR%\%%d" %COPYOPT% %LOGOPT%
::if not exist %BKUPDIR%\%%d	mkdir %BKUPDIR%\%%d


setlocal

set LOGDIR=.\Logs
set LOGFILE=%COMPUTERNAME%_%USERNAME%_%date%.log
set LOGOPT=/LOG+:%LOGDIR%\%LOGFILE% /NP /NDL
set COPYOPT=/E /MIR /R:1 /W:1 /XA:H
set HOME=%HOMEDRIVE%%HOMEPATH%


set D1=Desktop
set D2=Documents
set D3=Downloads
set D4=Favorites
set D5=Pictures
set D6=Videos
set D7=Music

set M1=Dropbox
set M2=OneDrive


for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A&SET MM=%%B&SET DD=%%C)
set BKUPDIR=.\%COMPUTERNAME%_%USERNAME%_%YY%%MM%


::
:: execution part
::
if not exist %HOME%		echo error %HOME% & goto :error_label
if not exist %LOGDIR%		echo %LOGDIR% & mkdir %LOGDIR%
if not exist %BKUPDIR%		echo %BKUPDIR% & mkdir %BKUPDIR%

set T1=%TIME%
echo =======================
echo From: %HOME%
echo To: %BKUPDIR%
echo Begin: %T1%
echo =======================
echo.

for %%d in (%D1% %D2% %D3% %D4% %D5% %D6% %D7% %M1% %M2%) do (
	if not exist %HOME%\%%d (
		echo =======================
		echo not found %HOME%\%%d
		echo =======================
	) else (
		echo %%d
		robocopy %HOME%\%%d %BKUPDIR%\%%d %COPYOPT% %LOGOPT%
	)
	echo.
)

::
:: It has issue that is folder name inclued space
::
set SRC_GDRIVE="%HOME%\Google 드라이브"
set DEST_GDRIVE="%BKUPDIR%\Google 드라이브"

if not exist %SRC_GDRIVE% (
	echo =======================
	echo not found %SRC_GDRIVE%
	echo =======================
) else (
	echo %SRC_GDRIVE%
	robocopy %SRC_GDRIVE% %DEST_GDRIVE% %COPYOPT% %LOGOPT%
)
echo.


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



