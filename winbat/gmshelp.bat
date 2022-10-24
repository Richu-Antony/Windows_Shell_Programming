@echo off

rem Gmshelp for WinGAMESS 
rem
rem Written by Stig Rune Sellevag <stig-rune.sellevag@ffi.no>
rem No warranty offered.
rem
rem Modification Log:
rem -----------------
rem 2011-04-30 SRS> Original code.

setlocal enableextensions

set doc="C:\WinGAMESS\manuals\INPUT.DOC"

if [%1] == [/?] goto usage

set key=%1
set line=0

if [%key%] == [] goto read

rem --------------------------------------------------------------------------

:find 

for /f "usebackq tokens=1,1 delims=:" %%i in (`findstr /b /i /n /c:"$%key% group" %doc%`) do (call set line=%%i)

rem --------------------------------------------------------------------------

:read

if %line% lss 1 (
        less +0 %doc%
) else (
        less +%line% %doc%
)

goto end

rem --------------------------------------------------------------------------

:usage

echo Usage: %0 [namelist group]
echo.
echo Do not include the dollar sign in the namelist group.

rem --------------------------------------------------------------------------

:end

