@echo off
@REM mode con cols=50 lines=50
title Auto Repair Windows V2.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Repair Windows V2.11.22                                    
echo  Author      : Richu Antony                                 
echo  Description : Repair Windows and fix windows           
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

    echo DO NOT POWER OFF THE COMPUTER DURING THE PROCESS AND INTERNET CONNECTION REQUIRED.
    echo.
    echo  0.  Exit
    echo  1.  System File Checker
    echo  2.  Restore System Health 
    echo  3.  Scheduled Disk Checkup
    echo  4.  List All The Files and Folders In The C Drive
    echo  5.  Repair Windows (No Reset)
    echo.
    echo  6.  Factory reset
    echo  7.  Advance restart
    echo  8.  Restart to Safe Mode No Networking (Run as Admin)
    echo  9.  Restart to Safe Mode With Networking (Run as Admin)
    echo  10. Restart to Test Mode (Run as Admin)

    echo.
    set /p choice="Choice: "

    if %choice% == 0 (
        Exit
    )

    if %choice% == 1 (
        goto System_File_Checker
    )

    if %choice% == 2 (
        goto Restore_System_Health
    )
    
    if %choice% == 3 (
        goto Scheduled_Disk_Checkup
    )

    if %choice% == 4 (
        goto List_All
    )

    if %choice% == 5 (
        goto All_task
    )

    if %choice% == 6 (
        goto Reset
    )

    if %choice% == 7 (
        goto Advance_restart
    )

    if %choice% == 8 (
        goto Safeboot_without_network
    )

     if %choice% == 9 (
        goto Safeboot_with_network
    )

     if %choice% == 10 (
        goto Testmode
    ) else ( echo Please select a valid choice
        pause
         cls
        goto mainmenu)

:System_File_Checker
    echo.
    echo Now running: System File Checker tool
    sfc /scannow
    echo.
    echo.
    pause
    cls
    goto mainmenu

:Restore_System_Health
    echo Now running: Deployment Image Servicing and Management
    DISM.exe /Online /Cleanup-image /Restorehealth
    echo.
    echo.
    pause
    cls
    goto mainmenu

:Scheduled_Disk_Checkup
    echo Now running: Scheduled Disk Checkup
    chkdsk /f /r
    echo.
    echo.
    pause
    cls
    goto mainmenu

:List_All
    echo Now running: List All The Files and Folders In The C Drive
    echo.
    tree C:// 
    echo Now running: Exporting All The Files and Folders List Into C Drive, This May Take a while.
    echo.
    tree c:\ /a /f > c:\Files and folders list.txt
    echo.
    echo.
    pause
    cls
    goto mainmenu

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
    pause
    cls
    goto End

:Reset
    systemreset --factoryreset
    
:Advance_restart
    shutdown /o /r /t 00

:Safeboot_without_network
    :: Boots to Safe mode without network immediately.
    :: Must be ran as administrator or will restart to normal mode instead.
    bcdedit /set {current} safeboot minimal
    REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} safeboot"
    SHUTDOWN -r -f -t 07

:Safeboot_with_network
    :: Boots to Safe mode with network immediately.
    :: Must be ran as administrator or will restart to normal mode instead.
    bcdedit /set {current} safeboot network
    REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} safeboot"
    SHUTDOWN -r -f -t 07

:Testmode
    :: Boots to Test Mode.
    :: The test mode is just like regular mode, but it has driver signature enforcement disabled.
    :: That way, unsigned hardware drivers can be installed in this mode.
    :: Must be ran as administrator or will restart to normal mode instead.
    bcdedit /set {current} testsigning on
    REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} testsigning"
    SHUTDOWN -r -f -t 07


:End
    echo Reboot PC? Save the tasks The system is going to reboot
    echo.
    pause
    shutdown /r

::Verified and Tested