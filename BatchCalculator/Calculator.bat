@echo off
title Calculator
:START
cls
choice /C 123456789A /M "Choose your first number"
set nb=%ERRORLEVEL%
if %ERRORLEVEL% == 10 set nb=%RANDOM%
choice /C 123456789A /M "Choose your second number"
set nb2=%ERRORLEVEL%
if %ERRORLEVEL% == 10 set nb2=%RANDOM%
echo Key list
echo =================
echo A : Addition
echo S : Subtraction
echo M : Multiplication
echo D : Division
choice /C ASMD /M ""
set operation=%ERRORLEVEL%
if %ERRORLEVEL% == 10 set nb2=%RANDOM%
if %operation% == 1 set /A result=%nb%+%nb2%
if %operation% == 1 set operation=+
if %operation% == 2 set /A result=%nb%-%nb2%
if %operation% == 2 set operation=-
if %operation% == 3 set /A result=%nb%*%nb2%
if %operation% == 3 set operation=*
if %operation% == 4 set /A result=%nb%/%nb2%
if %operation% == 4 set operation=/
echo result : %nb% %operation% %nb2% = %result%
choice /C YN /M "Y to restart, N to quit"
if %ERRORLEVEL% == 1 goto START
timeout 0.1