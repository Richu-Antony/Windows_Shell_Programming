@echo off
@REM This script deletes some temporary files and registry entries in order to reset Intellij's trial counter.
@REM Change the PRODUCT variable to reflect the version of Intellij that you're currently using.
@REM For educational purposes only, please support JetBrains and purchase a subscription.

@REM Author: https://github.com/ckaridis

set PRODUCT=IntelliJIdea2020.3

set JETBRAINSDIR=%USERPROFILE%\AppData\Roaming\JetBrains
rmdir /S /Q %JETBRAINSDIR%\%PRODUCT%\eval
del %JETBRAINSDIR%\%PRODUCT%\options\other.xml
reg delete HKEY_CURRENT_USER\Software\JavaSoft /f

pause