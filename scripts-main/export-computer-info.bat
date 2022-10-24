@echo off
@REM This script exports some information about your computer.
@REM Useful when you want to change/format your computer and you want to remember your old configuration.

@REM Author: https://github.com/ckaridis

set fileName="computer-info.txt"

call :echoTitle "COMPUTER BASIC INFORMATION"
systeminfo >> %fileName%
call :echoTitle "LIST OF INSTALLED DRIVERS"
driverquery /v >> %fileName%
call :echoTitle "NETWORK CONFIGURATIONS"
ipconfig/all >> %fileName%

:echoTitle
@echo ============================================================ >> %fileName%
@echo ============================================================ >> %fileName%
@echo %~1 >> %fileName%
@echo ============================================================ >> %fileName%