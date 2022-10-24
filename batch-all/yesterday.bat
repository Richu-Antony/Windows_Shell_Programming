@echo off

setlocal
for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A&SET MM=%%B&SET DD=%%C)

set /a DD=1%DD%-101
set /a MM=1%MM%-100

if  %DD% GTR 0 goto end
set /a MM=%MM%-1

if %MM% GTR 0 goto leap

set /a DD=31
set /a MM=12
set /a YY=%YY%-1
:: echo %YY%, %MM%, %DD% -> 2005, 12, 31
goto end

:leap
set /a TT=%YY%/4
set /a TT=%TT%*4
if not %YY% equ %TT% goto mon%MM%
set /a DD=29
goto end

:mon1
:mon3
:mon5
:mon7
:mon8
:mon10
set /a DD=31
goto end

:mon2
set /a DD=28
goto end

:mon4
:mon6
:mon9
:mon11
set /a DD=30
goto end

:end
set /a DD=%DD% + 100
set DD=%DD:~1,2%
set /a MM=%MM% + 100
set MM=%MM:~1,2%

echo.
echo %YY%-%MM%-%DD%
echo.

endlocal