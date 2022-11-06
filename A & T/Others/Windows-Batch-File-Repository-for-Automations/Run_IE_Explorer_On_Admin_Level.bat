title IE on Admin mode
color 1f
mode con:cols=125 lines=40
@echo off
ECHO ---------------------------------------------------------------------------------------------------------------------
ECHO 					Copyright (C) 2016 Jeffrey Cayao  All rights reserved.
Echo THIS PROGRAM IS CONFIDENTIAL AND AN UNPUBLISHED WORK AND TRADE SECRET OF THE COPYRIGHT HOLDER, AND DISTRIBUTED ONLY 
Echo UNDER RESTRICTION. EXCEPT AS EXPLICITLY STATED IN A WRITTEN AGREEMENT BETWEEN THE PARTIES, THE SOFTWARE IS PROVIDED
echo AS-IS, WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
echo MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, PERFORMANCE, AND QUALITY.
echo ---------------------------------------------------------------------------------------------------------------------
ECHO Version:        0.1
ECHO Date Created:   8:19 AM 6/29/2016
ECHO User:           Jeffrey Cayao
@echo off
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:gotPrivileges
setlocal & pushd .


start iexplore.exe
pause:>nul