@echo off 
@REM mode con cols=50 lines=50
title Calculator V6.11.22

cls

:START
    cls

    echo.
    echo Copyright(C) 2022 By Rica Inc.
    echo #
    echo  Tool        : Calculator V6.11.22                                 
    echo  Author      : Richu Antony                                 
    echo  Description : Arithematic and Scentific Calculator                  
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.

    choice /C 123456789 /M "Choose your first number "
    set nb=%ERRORLEVEL%
    echo.
    
    if %ERRORLEVEL% == 10 set nb=%RANDOM% 
    choice /C 123456789 /M "Choose your second number "
    set nb2=%ERRORLEVEL%
    echo.

    if %ERRORLEVEL% == 10 set nb2=%RANDOM% 
    echo Key list
    echo =================
    echo 1 : Addition
    echo 2 : Subtraction
    echo 3 : Multiplication
    echo 4 : Division
    echo 5 : Remainder 
    echo =================
    choice /C 12345 /M " "
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
    if %operation% == 5 set /A result=%nb%%%nb2%
    if %operation% == 5 set operation=%
    echo.
    echo Result : %nb% %operation% %nb2% = %result%
    echo.
    choice /C YN /M "Y to restart, N to quit "
    if choice == Y cls

    echo.
    if %ERRORLEVEL% == 1 goto START
    if %ERRORLEVEL% == 0 goto EXIT
    
:EXIT
    exit
    @REM timeout 0.1

::Verified and Tested