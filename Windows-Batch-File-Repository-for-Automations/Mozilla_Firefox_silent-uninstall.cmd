@echo off
set sw=HKLM\SOFTWARE
set u=Microsoft\Windows\CurrentVersion\Uninstall

rem if not 64-bit windows then go directly for native check
if "%ProgramFiles(x86)%"=="" goto native

:only64bit
rem on 64-bit windows this will check for 32-bit Firefox
for /f "tokens=8 delims=\" %%a in ('
reg query "%sw%\Wow6432Node\%u%" /s ^|
find "Mozilla Firefox" ^|
find "HKEY_LOCAL_MACHINE"') do if not "%%a"=="" (
for /f delims^=^"^ tokens^=2 %%b in ('^
reg query "%sw%\Wow6432Node\%u%\%%a" /v UninstallString ^|
find "UninstallString"') do (
echo %%a found!
echo Removing 32-bit Firefox from 64-bit system..
"%%b" /SILENT
)
)

:native
rem look for native version of firefox
rem on 64-bit windows this will check for 64-bit Firefox
rem on 32-bit windows this will check for 32-bit Firefox 
for /f "tokens=7 delims=\" %%a in ('
reg query "%sw%\%u%" /s ^|
find "Mozilla Firefox" ^|
find "HKEY_LOCAL_MACHINE"') do if not "%%a"=="" (
for /f delims^=^"^ tokens^=2 %%b in ('^
reg query "%sw%\%u%\%%a" /v UninstallString ^|
find "UninstallString"') do (
echo %%a found!
if "%ProgramFiles(x86)%"=="" echo Removing 32-bit Firefox from 32-bit system..
if not "%ProgramFiles(x86)%"=="" echo Removing 64-bit Firefox from 64-bit system..
"%%b" /SILENT
)
)

Echo Mozilla Firefox Installation Not found! Exiting now...

Pause