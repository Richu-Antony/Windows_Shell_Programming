@echo off
@REM mode con cols=50 lines=50
title Auto Repair Windows V29.10.22 9.56

:: Green
color A 

cls

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : Repair Windows V29.10.22 9.56                                     
echo  Author      : Richu Antony                                 
echo  Description : Repair Windows                  
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

:message
    echo Please Connect to the internet For further Execution.
    echo.

:connection
    PING google.com | FIND "time=" > NUL
    IF ERRORLEVEL 1 goto connection & message
    echo Connection established......
    echo.
    echo.

:mainmenu
    :: White
    color F
    echo.
    echo.

    echo DO NOT POWER OFF THE COMPUTER DURING THE PROCESS AND REQUIRES INTERNET CONNECTION.
    echo.
    echo This program runs Listing all files in c and followed by SFC and DISM scan and reboots automatically
    echo  0.  Exit
    echo  1.  System File Checker
    echo  2.  Restore System Health 
    echo  3.  Scheduled Disk Checkup
    echo  4.  List All The Files and Folders In The C Drive
    echo  5.  Repair Windows (No Reset)
    echo  6.  Factory Reset
    echo.
    set /p choice="Choice: "

    if %choice% == 0 (
        Exit
    )

    if %choice% == 1 (
        goto:System_File_Checker
    )

    if %choice% == 2 (
        goto:Restore_System_Health
    )
    
    if %choice% == 3 (
        goto:Scheduled_Disk_Checkup
    )

    if %choice% == 4 (
        goto:List_All
    )

    if %choice% == 5 (
        goto:All_task
    )

    if %choice% == 6 (
        goto:Reset
    )


:System_File_Checker
    echo.
    echo Now running: System File Checker tool
    sfc /scannow
    echo.
    echo.
    cls
    goto:mainmenu

:Restore_System_Health
    echo Now running: Deployment Image Servicing and Management
    DISM.exe /Online /Cleanup-image /Restorehealth
    echo.
    echo.

:Scheduled_Disk_Checkup
    echo Now running: Scheduled Disk Checkup
    chkdsk /f /r
    echo.
    echo.

:List_All
    echo Now running: List All The Files and Folders In The C Drive
    echo.
    tree C:// 
    echo Now running: Exporting All The Files and Folders List Into C Drive, This May Take a while.
    echo.
    tree c:\ /a /f > c:\Files and folders list.txt
    echo.
    echo.

:All_task
    echo.
    echo Now running: System File Checker tool
    sfc /scannow
    echo.
    echo.
    echo Now running: Deployment Image Servicing and Management
    DISM.exe /Online /Cleanup-image /Restorehealth
    echo.
    echo.
    echo Now running: Scheduled Disk Checkup
    chkdsk /f /r
    echo.
    echo.
    echo Now running: List All The Files and Folders In The C Drive
    echo.
    tree C:// 
    echo Now running: Exporting All The Files and Folders List Into C Drive, This May Take a while.
    echo.
    tree c:\ /a /f > c:\Files and folders list.txt
    echo.
    echo.
    goto:End

:Reset
    systemreset --factoryreset

:End
    echo Reboot PC? Save the tasks The system is going to reboot
    echo.
    pause
    shutdown /r