@echo off
::
:: 2019-09-25
::
:: mkdiff old_dir new_dir


SETLOCAL

IF "%1" == "" 	echo %0 old new && GOTO :end
IF "%2" == "" 	echo %0 old new && GOTO :end

set OLD=%1
set ofile=%OLD:~-5%.txt
set NEW=%2
set nfile=%NEW:~-5%.txt

if not exist %OLD%	echo no old directory && goto :end
if not exist %NEW%	echo no new directory && goto :end

echo.
echo %ofile%
echo.
dir /b %OLD% | sed -E "s/^[0-9][0-9][0-9]//" | sed -E "s/^\[[0-9][0-9][0-9]\]//" | sort > %ofile%

echo.
echo %nfile%
echo.
dir /b %NEW% | sed -E "s/^[0-9][0-9][0-9]//" | sed -E "s/^\[[0-9][0-9][0-9]\]//" | sort > %nfile%

set new_dir=diff_%OLD:~-5%_vs_%NEW:~-5%
set odiff=%ofile%-diff.txt
set ndiff=%nfile%-diff.txt

mkdir %new_dir%
findstr /bevg:%ofile% %nfile% > %new_dir%\%ndiff%
findstr /bevg:%nfile% %ofile% > %new_dir%\%odiff%

if exist %ofile%	del %ofile%
if exist %nfile%	del %nfile%



:end

ENDLOCAL