@echo off
@REM mode con cols=50 lines=50
title Control Panel V28.10.22 8.30 

cls

start C_panel_Speech.vbs


:Mainmenu
:: Green
color A

echo.
echo Copyright(C) By Rica Inc.
echo #
echo  Tool        : Control Panel V28.10.22 8.30                                      
echo  Author      : Richu Antony                                 
echo  Description : MultiFunctional Control Pannel                    
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 2 127.0.0.1 > nul

echo 1.  Add languages                  2.  Environment variables
echo 3.  System properties              4.  Programs and features
echo 5.  Services                       6.  Device manager
echo 7.  Windows defender antivirus     8.  Windows firewall with advanced security
echo 9.  Windows features               10. Windows smartscreen
echo 11. Mouse properties               12. Keyboard properties
echo 13. System configuration           14. Directx diagnostic tool
echo 15. System information             16. File explorer options
echo 17. Registry editor                18. Computer management
echo 19. Disk management                20. Local group policy editor
echo 21. User accounts                  22. Print management
echo 23. Network connections            24. User account control settings
echo 25. Shared folders                 26. Sound
echo 27. Task scheduler                 28. Windows firewall
echo 29. Windows update                 30. wmi control
echo 31. Performance monitor            32. Local security policy
echo 33. Taskbar                        34. Network and sharing center
echo 35. Background                     36. Display
echo 37. Region                         38. Power options
echo 39. Internet properties            40. Computer defaults
echo 41. Default programs               42. Credential manager
echo 43. Customer experience program    44. Add network location
echo 45. Safely remove hardware         0. Exit
echo.
echo.

set /p choice=Choice: 
goto %choice%

:1
    start control input.dll
    @REM exit /b
    cls
    goto Mainmenu

:2
    start rundll32 sysdm.cpl,EditEnvironmentVariables
    @REM exit /b
    cls
    goto Mainmenu

:3
    start control sysdm.cpl
    @REM exit /b
    cls
    goto Mainmenu

:4
    start control appwiz.cpl
    @REM exit /b
    cls
    goto Mainmenu

:5
    start mmc services.msc
    @REM exit /b
    cls
    goto Mainmenu

:6
    start mmc devmgmt.msc
    rem hdwwiz.cpl
    @REM exit /b
    cls
    goto Mainmenu

:7
    start "" "c:\program files\windows defender"\msascui.exe
    @REM exit /b
    cls
    goto Mainmenu
    ::FIX REQUIRED

:8
    start mmc wf.msc
    @REM exit /b
    cls
    goto Mainmenu

:9
    rem control appwiz.cpl,,2
    start optionalfeatures
    @REM exit /b
    cls
    goto Mainmenu

:10
    start smartscreensettings
    @REM exit /b
    cls
    goto Mainmenu
    ::FIX REQUIRED

:11
    start main.cpl
    @REM exit /b
    cls
    goto Mainmenu

:12
    start main.cpl keyboard
    @REM exit /b
    cls
    goto Mainmenu

:13
    start msconfig
    @REM exit /b
    cls
    goto Mainmenu

:14
    start dxdiag /dontskip /whql:on
    @REM exit /b
    cls
    goto Mainmenu

:15
    start msinfo32
    @REM exit /b
    cls
    goto Mainmenu

:16
    rem rundll32 shell32.dll,Options_RunDLL
    start control folders
    @REM exit /b
    cls
    goto Mainmenu

:17
    start regedit
    @REM exit /b
    cls
    goto Mainmenu

:18
    start mmc compmgmt.msc
    @REM exit /b
    cls
    goto Mainmenu

:19
    start mmc diskmgmt.msc
    @REM exit /b
    cls
    goto Mainmenu

:20
    start mmc gpedit.msc
    @REM exit /b
    cls
    goto Mainmenu

:21
    rem control /name microsoft.useraccounts
    rem start control userpasswords
    rem ---
    rem start control userpasswords2
    start netplwiz
    @REM exit /b
    cls
    goto Mainmenu

:22
    start mmc printmanagement.msc
    @REM exit /b
    cls
    goto Mainmenu

:23
    rem control netconnections
    start control ncpa.cpl
    @REM exit /b
    cls
    goto Mainmenu

:24
    start useraccountcontrolsettings
    @REM exit /b
    cls
    goto Mainmenu

:25
    start mmc fsmgmt.msc
    @REM exit /b
    cls
    goto Mainmenu

:26
    start control mmsys.cpl
    @REM exit /b
    cls
    goto Mainmenu

:27
    start mmc taskschd.msc
    @REM exit /b
    cls
    goto Mainmenu

:28
    rem control /name microsoft.windowsfirewall
    start control firewall.cpl
    @REM exit /b
    cls
    goto Mainmenu

:29
    start control /name microsoft.windowsupdate
    @REM exit /b
    cls
    goto Mainmenu

:30
    start mmc wmimgmt.msc
    @REM exit /b
    cls
    goto Mainmenu

:31
    start mmc perfmon.msc
    @REM exit /b
    cls
    goto Mainmenu

:32
    start mmc secpol.msc
    @REM exit /b
    cls
    goto Mainmenu

:33
    start control /name microsoft.taskbarandstartmenu
    @REM exit /b
    cls
    goto Mainmenu

:34
    start control /name microsoft.networkandsharingcenter
    @REM exit /b
    cls
    goto Mainmenu

:35
    start control desktop
    @REM exit /b
    cls
    goto Mainmenu

:36
    start dpiscaling
    @REM exit /b
    cls
    goto Mainmenu

:37
    start control intl.cpl
    @REM exit /b
    cls
    goto Mainmenu

:38
    start control powercfg.cpl
    @REM exit /b
    cls
    goto Mainmenu

:39
    start control inetcpl.cpl
    @REM exit /b
    cls
    goto Mainmenu

:40
    rem start control appwiz.cpl,,3
    start computerdefaults
    @REM exit /b
    cls
    goto Mainmenu

:41
    start control.exe /name microsoft.defaultprograms
    @REM exit /b
    cls
    goto Mainmenu

:42
    start control.exe /name microsoft.credentialmanager
    @REM exit /b
    cls
    goto Mainmenu

:43
    rem https://msdn.microsoft.com/en-us/library/dn449424%28v=winembedded.82%29.aspx?f=255&MSPPError=-2147217396
    rem HKLM\Software\Microsoft\SQMClient\Windows\CEIPEnable
    start rundll32 werconcpl.dll,ShowCEIPDialog
    @REM exit /b
    cls
    goto Mainmenu

:44
    start rundll32 %systemroot%\system32\shwebsvc.dll,AddNetPlaceRunDll
    rem windows share, ftp
    @REM exit /b
    cls
    goto Mainmenu

:45
    start control hotplug.dll
    @REM exit /b
    cls
    goto Mainmenu

:0
    exit /b