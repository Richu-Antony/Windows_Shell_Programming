@echo off
@REM This script uses powershell to open hosts file using notepad as administrator.
@REM It is not required to run this script as administrator, however, you should have 
@REM administrator rights in order to open notepad.

@REM Author: https://github.com/ckaridis

powershell -c start -verb runas notepad.exe %WINDIR%\System32\drivers\etc\hosts