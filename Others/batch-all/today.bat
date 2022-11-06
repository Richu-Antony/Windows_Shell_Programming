@echo off
::
:: example
::


setlocal
for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A& SET MO=%%B& SET DD=%%C)

echo.
echo %YY%%MO%%DD%
endlocal


setlocal
SET YY=%DATE:~0,4%
SET MO=%DATE:~5,2%
SET DD=%DATE:~8,2%

echo.
echo %YY%%MO%%DD%
echo.
endlocal


::
:: it should be included the space after &.
::
SETLOCAL
for /f "tokens=1-4 delims=:. " %%A in ('echo %TIME%') do (set HH=%%A& SET MI=%%B& SET SS=%%C& SET MS=%%D)
ECHO.
ECHO %HH%%MI%%SS%%MS%
ENDLOCAL

SETLOCAL
SET HH=%TIME:~0,2%
SET MI=%TIME:~3,2%
SET SS=%TIME:~6,2%
SET MS=%TIME:~9,2%

ECHO.
ECHO %HH%%MI%%SS%%MS%
ENDLOCAL

