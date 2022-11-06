@echo off
@REM mode con cols=50 lines=50
title Windows Pop-up MSG V6.11.22

@REM if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@REM @setlocal enableextensions
@REM @cd /d "%~dp0"

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Windows Pop-up MSG V6.11.22                         
echo  Author      : Richu Antony                                 
echo  Description : Windows Pop-up Message
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


:: Main Code Start Here - Do not edit the code unless you don't know it
:re-run
set /p ttl="Enter Title: "
set /p txt="Enter a Message: "


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

::Verified and Tested