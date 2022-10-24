@ECHO OFF
::
:: 2019-09-18
:: 2020-03-16
::

setlocal

if "%1" == "" 	goto :ENTER

:: there is a argument.
::
set NAME="%1*"
echo.
dir /s /b %NAME% 2> nul | find "" /v /c
echo.

endlocal
goto :EOF



:ENTER
echo.
set /P n1="Enter the name: "
set NAME="%n1%*"

if %NAME% NEQ "*"		goto :SEARCH
set mmdd=%date:~5,2%%date:~-2%
set NAME="%mmdd%*"
echo %mmdd%



:SEARCH
echo.
dir /s /b %NAME% 2> NUL | find "" /v /c
echo.

endlocal
pause
goto :EOF
