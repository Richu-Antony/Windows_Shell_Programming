@echo off
::
:: 2021-01-04
::

setlocal

::if "%1" == ""	goto :ERRMESG
::if "%2" == ""	goto :ERRMESG
::set BEFORE=%1
::set AFTER=%2
::
::You cannot use the %% variable again inside the %% variable.
::
::set VAR=%source:%BEFORE%=%AFTER%%
::
set SELF=%0

dir /a-d /b *.xlsx
echo ==================================================
set /p YN="Did you backup the files? (y/n): "
::
:: When you compare the string, you should wrap the double quatation.
::
if not "%YN%"=="y" goto :EOF
echo.


for /f "tokens=* usebackq" %%f in (`dir /a-d /b *.xlsx`) do (
	call :FUNC "%%f"
)

endlocal
goto :EOF


:FUNC
set SOURCE=%~1
set TARGET=%SOURCE:2020=2021%

if exist "%TARGET%"		echo "check (set TARGET=) in the %SELF%"&exit /b

:: for debugging
::
::echo "%SOURCE%" "==>" "%TARGET%"
ren "%SOURCE%" "%TARGET%"
echo %TARGET%

exit /b


::ERRMESG
::echo %0 old new
::goto :EOF
