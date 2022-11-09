@echo off
::
:: 2020-03-16
:: 2020-05-04
::

setlocal

set LOGVER=2
set LOGDIR=.\Logs
set LOGFILE=%COMPUTERNAME%_%USERNAME%.log
set LFILE=%LOGDIR%\%LOGFILE%
set FINDFILE=ff.bat
set WORDBOOK=MyWordBook.xlsx


if "%USERNAME%" == "iam0man" (
:: Office 2013
	set EXCEL="C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE"
) else (
:: Office 2016
	set EXCEL="C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
)


:: set target file name automatically
::
set MON=%DATE:~5,2%
set DAY=%DATE:~-2%
set FN=%MON%%DAY%.xlsx
if "%1" == "" 	goto :SKIP
:: use date by entering manually
::
set FN=%1.xlsx


:SKIP
set TM=%TIME: =0%
set HOUR=%TM:~0,2%
set MINUTE=%TM:~3,2%
set SECOND=%TM:~6,2%
set TF=tmp%HOUR%%MINUTE%%SECOND%.txt


if not exist %LOGDIR%		echo %LOGDIR% & mkdir %LOGDIR%

dir /s /b %FN% > %TF% 2> NUL 
if not %errorlevel% == 0 	(echo. & echo All Done! & goto :FINISH)
for /f "tokens=* usebackq" %%F in (`type %TF% ^| find "" /v /c`) do (set FCOUND=%%F)
set T1=%TIME: =0%

echo =======================
echo %FCOUND%
echo =======================

::
:: debugging point
::
:: goto :FINISH

:: start excel background
::
start %WORDBOOK%
timeout /t 1 > NUL

:: execute excel each file
::
for /F "delims=" %%i in (%TF%) do (	
	echo. & echo %%i & echo.
	%EXCEL% "%%i"
	pause
)

set T2=%TIME: =0%
CALL :DIFF %T1% %T2%
echo.
echo =======================
echo Finish: %T2% (%DURATION%)
echo =======================




echo.
for /F "delims=" %%i in (%TF%) do echo %%i
echo ==================================================
set /p YN="Delete all %FN%? (y/n): "
::
:: When you compare the string, you should wrap the double quatation.
::
if not "%YN%"=="y" goto :FINISH
for /F "delims=" %%i in (%TF%) do (
	del "%%i"
)


::
:: call external batch file and send parameter.
::
echo =======================
CALL %FINDFILE% %FN%
echo =======================



::
:: Collect log data before deleting files.
::
echo {>> %LFILE%
echo 	"Target":"%FN%",>> %LFILE%
echo 	"Begin":"%DATE%T%T1%",>> %LFILE%
echo 	"End":"%DATE%T%T2%",>> %LFILE%
echo 	"Duration":"%DURATION%",>> %LFILE%
echo 	"Files":"%FCOUND%",>> %LFILE%
echo 	"Version":"%LOGVER%",>> %LFILE%
echo 	"Host":"%COMPUTERNAME%",>> %LFILE%
echo }>> %LFILE%


:FINISH
del %TF% 2> NUL
echo.

endlocal
pause
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