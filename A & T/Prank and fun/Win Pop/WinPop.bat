@echo off
REM By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@setlocal enableextensions
@cd /d "%~dp0"

color 0a
title Windows Pop-up MSG V1.0

:: Information About The Product
echo ----------------------------------------------------------
echo / Tool : Windows Pop-up MSG V1.0                         \
echo \ Version : 1.0                                          /  
echo / Author : Richu Antony                                  \
echo \ Description : Pop Up                                   /
echo / GitHub : https://www.github.com/Richu-Antony           \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it
:: Take Inputs
:re-run
set /p ttl="Enter Title: "
set /p txt="Enter a Message: "

:: Show Msg Types
echo ------------------------------------
echo Message Types :-
echo [0] Normal Msg - Ok button Only
echo [1] OK and Cancel buttons
echo [2] Abort, Retry, and Ignore buttons
echo [3] Yes, No, and Cancel buttons
echo [4] Yes and No buttons
echo [5] Retry and Cancel buttons
echo [16] Critical Message icon
echo [32] Warning Query icon
echo [48] Warning Message icon
echo [64] Information Message icon
echo ------------------------------------

:: Set Msg Type
set /p typ="Select Message Type: "

REM Show Message
cscript MsgBx.vbs "%txt%" "%ttl%" %typ%

set /p inp=" Use Again ? ( Y/N ) : "
if %inp%==N (goto end)
if %inp%==n (goto end)
echo -
goto re-run

:end