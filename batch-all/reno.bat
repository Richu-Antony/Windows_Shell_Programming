@echo off
::
:: file name should be started "o "
::


setlocal

if "%1" == "" (
	echo "%0 [start_id] [end_idx] [flag=y]"
	echo.
	echo.
	goto :EOF
)

set START_IDX=%1
set END_IDX=%2
set JUMP=2
if "%3" == "y" (
	set RENAME_YES=1
) else (
	set RENAME_YES=0
)

:: check
::
for /l %%i in (%START_IDX%,1,%END_IDX%) do (
	if not exist "o %%i.pdf" (
		echo not found "o %%i.pdf"
		goto :EOF
	)
)


for /l %%i in (%START_IDX%,1,%END_IDX%) do (
	call :FUNC %%i
)

goto :EOF




:FUNC

set IDX=%1
set FNAME="o %IDX%.pdf"


set /A NUM=(%IDX%-%START_IDX%)*%JUMP%+1001
set NEW="p%NUM:~1%.pdf"

if exist %FNAME% (
	echo ren %FNAME% %NEW%
	if "%RENAME_YES%" == "1"	ren %FNAME% %NEW%
)

exit /b