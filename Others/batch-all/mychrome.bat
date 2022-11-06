@echo off
::
:: 2020-04-28
::

setlocal

set TPATH="c:\users\%username%\appdata\local\google\chrome\user data\swreporter"
set TFILE=software_reporter_tool.exe


:: select latest directory
::
for /f %%A in ('dir /b /a:d /o:-n %TPATH%') do (set TDIR=%%A&& goto :first)


:first
if not exist %TPATH%\%TDIR%\%TFILE% (
	echo not found
	exit /b
)

echo.
dir %TPATH%\%TDIR%
echo.

:: rename command cannot assign target directory
::
if exist %TPATH%\%TDIR%\%TFILE% (
	if not exist %TPATH%\%TDIR%\_%TFILE% (
		ren %TPATH%\%TDIR%\%TFILE% _%TFILE%

		echo renamed %TPATH%\%TDIR%\_%TFILE% 
		echo.
	) else (
		echo existed %TPATH%\%TDIR%\_%TFILE%
		echo.
	)
)

:: create empty file
::
if not exist %TPATH%\%TDIR%\%TFILE% (
	type NUL > %TPATH%\%TDIR%\%TFILE%
	attrib +r %TPATH%\%TDIR%\%TFILE%
	
	echo created readonly %TPATH%\%TDIR%\%TFILE%
	echo.
)

exit /b
