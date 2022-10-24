@ECHO OFF
::
:: 2019-07-11
:: 2019-08-01
:: 2019-10-04
::

SETLOCAL

SET tdir=".\90일후 (3달후)"
SET mon=%DATE:~5,2%
SET day=%DATE:~-2%
SET debugFlag=0

:: only for testing
::
::SET mon=11
::SET day=08


FOR /L %%n IN (0,1,91) DO (
	CALL :next %%n
)

ENDLOCAL
ECHO.
PAUSE
GOTO :EOF



:next
SET idx=%1
SET /A tday=1%day% - 100
SET /A share=(%tday% + %idx%) / 31
SET /A trest30=(%tday% + %idx%) %% 31 + 101

SET /a m0=1%mon% - 100
SET /a m1=(m0 + 0) %% 12 + 101
SET /a m2=(m0 + 1) %% 12 + 101
SET /a m3=(m0 + 2) %% 12 + 101

SET rest30=%trest30:~1,2%
SET mon1=%m1:~1,2%
SET mon2=%m2:~1,2%
SET mon3=%m3:~1,2%


IF %share% EQU 0 (
	IF "%debugFlag%" equ "1"	ECHO debug: %mon%%rest30%.xlsx	
	IF NOT EXIST %tdir%\%mon%%rest30%.xlsx	ECHO %mon%%rest30%.xlsx	
) ELSE IF %share% EQU 1 (
	IF "%debugFlag%" equ "1"	ECHO debug: %mon1%%rest30%.xlsx	
	IF NOT EXIST %tdir%\%mon1%%rest30%.xlsx	ECHO %mon1%%rest30%.xlsx	
) ELSE IF %share% EQU 2 (
	IF "%debugFlag%" equ "1"	ECHO debug: %mon2%%rest30%.xlsx	
	IF NOT EXIST %tdir%\%mon2%%rest30%.xlsx	ECHO %mon2%%rest30%.xlsx	
) ELSE IF %share% EQU 3 (
	IF "%debugFlag%" equ "1"	ECHO debug: %mon3%%rest30%.xlsx	
	IF NOT EXIST %tdir%\%mon3%%rest30%.xlsx	ECHO %mon3%%rest30%.xlsx	
)


EXIT /b
