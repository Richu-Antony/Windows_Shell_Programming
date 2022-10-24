@echo off

mode con cols=50 lines=50

title control panel
color a
cls

start speech.vbs

echo.
echo 1.  add languages
echo 2.  environment variables
echo 3.  system properties
echo 4.  programs and features
echo 5.  services
echo 6.  device manager
echo 7.  windows defender antivirus
echo 8.  windows firewall with advanced security
echo 9.  windows features
echo 10. windows smartscreen
echo 11. mouse properties
echo 12. keyboard properties
echo 13. system configuration
echo 14. directx diagnostic tool
echo 15. system information
echo 16. file explorer options
echo 17. registry editor
echo 18. computer management
echo 19. disk management
echo 20. local group policy editor
echo 21. user accounts
echo 22. print management
echo 23. network connections
echo 24. user account control settings
echo 25. shared folders
echo 26. sound
echo 27. task scheduler
echo 28. windows firewall
echo 29. windows update
echo 30. wmi control
echo 31. performance monitor
echo 32. local security policy
echo 33. taskbar
echo 34. network and sharing center
echo 35. background
echo 36. display
echo 37. region
echo 38. power options
echo 39. internet properties
echo 40. computer defaults
echo 41. default programs
echo 42. credential manager
echo 43. customer experience improvement program
echo 44. add network location
echo 45. safely remove hardware
echo.
echo x. exit
echo.

set /p choice=choice: 

goto %choice%

:1
start control input.dll
exit /b

:2
start rundll32 sysdm.cpl,EditEnvironmentVariables
exit /b

:3
start control sysdm.cpl
exit /b

:4
start control appwiz.cpl
exit /b

:5
start mmc services.msc
exit /b

:6
start mmc devmgmt.msc
rem hdwwiz.cpl
exit /b

:7
start "" "c:\program files\windows defender"\msascui.exe
exit /b

:8
start mmc wf.msc
exit /b

:9
rem control appwiz.cpl,,2
start optionalfeatures
exit /b

:10
start smartscreensettings
exit /b

:11
start main.cpl
exit /b

:12
start main.cpl keyboard
exit /b

:13
start msconfig
exit /b

:14
start dxdiag /dontskip /whql:on
exit /b

:15
start msinfo32
exit /b

:16
rem rundll32 shell32.dll,Options_RunDLL
start control folders
exit /b

:17
start regedit
exit /b

:18
start mmc compmgmt.msc
exit /b

:19
start mmc diskmgmt.msc
exit /b

:20
start mmc gpedit.msc
exit /b

:21
rem control /name microsoft.useraccounts
rem start control userpasswords
rem ---
rem start control userpasswords2
start netplwiz
exit /b

:22
start mmc printmanagement.msc
exit /b

:23
rem control netconnections
start control ncpa.cpl
exit /b

:24
start useraccountcontrolsettings
exit /b

:25
start mmc fsmgmt.msc
exit /b

:26
start control mmsys.cpl
exit /b

:27
start mmc taskschd.msc
exit /b

:28
rem control /name microsoft.windowsfirewall
start control firewall.cpl
exit /b

:29
start control /name microsoft.windowsupdate
exit /b

:30
start mmc wmimgmt.msc
exit /b

:31
start mmc perfmon.msc
exit /b

:32
start mmc secpol.msc
exit /b

:33
start control /name microsoft.taskbarandstartmenu
exit /b

:34
start control /name microsoft.networkandsharingcenter
exit /b

:35
start control desktop
exit /b

:36
start dpiscaling
exit /b

:37
start control intl.cpl
exit /b

:38
start control powercfg.cpl
exit /b

:39
start control inetcpl.cpl
exit /b

:40
rem start control appwiz.cpl,,3
start computerdefaults
exit /b

:41
start control.exe /name microsoft.defaultprograms
exit /b

:42
start control.exe /name microsoft.credentialmanager
exit /b

:43
rem https://msdn.microsoft.com/en-us/library/dn449424%28v=winembedded.82%29.aspx?f=255&MSPPError=-2147217396
rem HKLM\Software\Microsoft\SQMClient\Windows\CEIPEnable
start rundll32 werconcpl.dll,ShowCEIPDialog
exit /b

:44
start rundll32 %systemroot%\system32\shwebsvc.dll,AddNetPlaceRunDll
rem windows share, ftp
exit /b

:45
start control hotplug.dll
exit /b

:x
exit /b
