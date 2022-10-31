@echo off
@REM mode con cols=50 lines=50
title Toolkit Collection V29.10.22 2.38

:: Green
color A 

cls

:intro
    echo.
    echo By Rica Inc.
    echo #
    echo  Tool   : Toolkit V29.10.22 9.56                                     
    echo  Author : Richu Antony                                 
    echo  Description : Toolkit Collection                  
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.

:mainmenu
    echo.
    echo.
    echo  Select Your options
    echo  0.  Exit
    echo  1.  Battery Report
    echo.
    set /p choice="Choice: "

    if %choice% == 0 (
        Exit
    )

    if %choice% == 1 (
        goto Battery_report
    )else (
         echo.
         echo Wrong Choice, Select a valid one.
         echo.
         start Message.vbs & Speech.vbs
         pause
         cls
         goto intro & mainmenu 
    )
       

:Battery_report
    echo.
    del battery-report.html
    WMIC PATH Win32_Battery Get EstimatedChargeRemaining
    echo.
    powercfg /batteryreport 
    ::powercfg /energy /output "c:\energy_report.html"
    goto End

:End
    pause