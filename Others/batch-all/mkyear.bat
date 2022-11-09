@ECHO OFF
::
:: 2019-06-26
::

SETLOCAL

IF "%1" == "" (
	SET this_year=%DATE:~0,4%
) ELSE (
	SET this_year=%1
)


FOR /l %%i IN (1,1,12) DO (
	CALL :func %%i
)

GOTO :EOF




:func

SET /A mon=100 + %1
SET name=%this_year%-%mon:~1%

IF NOT EXIST %name% (
	ECHO MKDIR %name%
	MKDIR %name%
)

EXIT /b
