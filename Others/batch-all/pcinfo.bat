@ECHO OFF
::
:: Date : 2009-03-09
:: Update: 2019-07-11
::

SETLOCAL

SET debug=1

SET hour=%TIME:~0,2%
SET minute=%TIME:~3,2%
SET second=%TIME:~6,2%
SET tf=t%hour%%minute%%second%

set f1=%tf%-sysinfo.txt
set f2=%tf%-dxdiag.txt
set f3=%tf%-msinfo.txt
set f4=%tf%.txt


ECHO ===============================
ECHO Please wait...(debug_mode=%debug%)
ECHO ===============================


IF %debug% NEQ 1 	GOTO :actual

:debug
::
:: debug code
::
ECHO 1...
ECHO systeminfo.exe ^> %f1% > %f1%

ECHO 2...
ECHO dxdiag.exe /t %F2% > %f2%

ECHO 3...
ECHO msinfo32.exe /categories system /report %f3% > %f3%

GOTO :result

:actual
::
:: actual body
::
ECHO 1...
systeminfo.exe > %f1%

ECHO 2...
dxdiag.exe /t %F2%

ECHO 3...
::msinfo32.exe /categories system /report %f3%
GOTO :result

:result
::
:: result
::
ECHO 4
copy %f1%+%f2%+%f3% %f4% > NUL 2> NUL

notepad %f4%

DEL %f1% %f2% %f3% %f4% 2> NUL


ENDLOCAL
