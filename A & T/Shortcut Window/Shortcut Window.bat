@echo off 
mode con: cols=106
title Shortcut Window - for Windows 7, 8, 10 and 11  V2.11.22



:menu
    cls
    echo.
    echo Copyright(C) 2022 By Rica Inc.
    echo #
    echo  Tool        : Shortcut Window V2.11.22                                   
    echo  Author      : Richu Antony                                 
    echo  Description : Shortcut Window for Windows 7, 8, 10 and 11             
    echo #
    echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
    echo.
    echo.

    @REM color 1f

    echo.
    echo 1.  Add Hardware Wizard             2.  Adding a new Device              3.  Advanced User Accounts
    echo 4.  Advanced User Accounts          5.  Backup and Restore               6.  Calculator
    echo 7.  Certificates                    8.  Character Map                    9.  ClearType Tuner
    echo 10. Color Management                11. Command Prompt                   12. Component Services
    echo 13. Component Services              14. Computer Management              15. Computer Management
    echo 16. Connect to a Projector          17. Control Panel                    18. Credential Backup Restore
    echo 19. Data Execution Prevention       20. Date and Time                    21. Device Manager
    echo 22. Diagnostics Troubleshooting     23. Digitizer Calibration Tool       24. DirectX Diagnostic Tool
    echo 25. Disk Cleanup                    26. Disk Defragmenter                27. Disk Management
    echo 28. Display                         29. Display Color Calibrat           30. DPAPI Key Migration Wizard
    echo 31. Driver Verifier Manager         32. Ease of Access Center            33. Event Viewer
    echo 34. Fax Cover Page Editor           35. Game Controllers                 36. Getting Started
    echo 37. IExpress Wizard                 38. Internet Explorer                39. Internet Options
    echo 40. Language Pack Installer         41. Local Users and Groups           42. Magnifier
    echo 43. Malicious Software Removal      44. Math Input Panel                 45. Microsoft Management Console
    echo 46. Mouse                           47. NAP Client Configuration         48. Narrator
    echo 49. Network Connections             50. New Scan Wizard                  51. Notepad
    echo 52. ODBC Data Source Administrator  53. On-Screen Keyboard               54. Open Documents Folder
    echo 55. Open Downloads Folder           56. Open Favorites Folder            57. Open Pictures Folder
    echo 58. Open Recent Folder              59. Open Videos folder               60. Paint
    echo 61. Pen and Touch                   62. People Near Me                   63. Performance Monitor
    echo 64. Performance Options             65. Phone and Modem                  66. Phone Dialer
    echo 67. Power Options                   68. Printer User Interface           69. Private Character Editor
    echo 70. Problem Steps Recorder          71. Programs and Features            72. Region and Language
    echo 73. Registry Editor                 74. Remote Access Phonebook          75. Remote Desktop Connection
    echo 76. Resource Monitor                77. SAM Lock Tool                    78. Screen Resolution
    echo.
    echo 79. Services                      80. Set Program Access Computers Default    81. Share Creation Wizard
    echo 82. Shared Folder Wizard          83. Shared Folders                          84. Snipping Tool
    echo 85. Sound                         86. Sound recorder                          87. SQL Server Client Network Utilites
    echo 88. Sticky Notes                  89. Sync Center                             90. System Configuration
    echo 91. System Configuration Editor   92. System Information                      93. System Properties
    echo.
    echo 94. System Properties(Advanced Tab)            95. System Properties(Hardware Tab)     96. System Properties(Remote Tab)
    echo 97. System Properties(System Protection Tab)   98. System Restore                      99. Task Manager
    echo.
    echo 100. Task Scheduler                         101. Taskbar and Start Menu                102. Troubleshooting
    echo 103. Trusted Platform Module (TPM)          104. User Account Control Settings         105. User Accounts
    echo 106. Utility Manager                        107. Version Reporter Applet               108. Volume Mixer
    echo 109. Windows Action Center                  110. Windows Activation Client             111. Windows Anytime Upgrade   
    echo 112. Windows Anytime Upgrade Results        113. Windows Disc Image Burning Tool       114. Windows DVD Maker
    echo 115. Windows Easy Transfer                  116. Windows Explorer                      117. Windows Fax and Scan
    echo 118. Windows Features                       119. Windows Firewall                      120. Windows Journal
    echo 121. Windows Media Player                   122. Windows Memory Diagnostic Scheduler   123. Windows Mobility Center
    echo 124. Windows PowerShell                     125. Windows PowerShell ISE                126. Windows Remote Assistance
    echo 127. Windows Repair Disc                    128. Windows Script Host                   129. Windows Update
    echo 130. Windows Update Standalone Installer    131. WMI Management                        132. WordPad
    echo 133. XPS Viewer                               0. Exit This Program
    echo.

    set /p run-cmd=Type option: 
    if "%run-cmd%"=="1" hdwwiz
    if "%run-cmd%"=="2" devicepairingwizard
    if "%run-cmd%"=="3" azman.msc
    if "%run-cmd%"=="4" netplwiz
    if "%run-cmd%"=="5" sdclt
    if "%run-cmd%"=="6" calc
    if "%run-cmd%"=="7" certmgr.msc
    if "%run-cmd%"=="8" charmap
    if "%run-cmd%"=="9" cttune
    if "%run-cmd%"=="10" colorcpl
    if "%run-cmd%"=="11" cmd
    if "%run-cmd%"=="12" comexp.msc
    if "%run-cmd%"=="13" dcomcnfg
    if "%run-cmd%"=="14" compmgmt.msc
    if "%run-cmd%"=="15" compmgmtlauncher
    if "%run-cmd%"=="16" displayswitch
    if "%run-cmd%"=="17" control
    if "%run-cmd%"=="18" credwiz
    if "%run-cmd%"=="19" systempropertiesdataexecutionprevention
    if "%run-cmd%"=="20" timedate.cpl
    if "%run-cmd%"=="21" hdwwiz.cpl
    if "%run-cmd%"=="22" msdt
    if "%run-cmd%"=="23" tabcal
    if "%run-cmd%"=="24" dxdiag
    if "%run-cmd%"=="25" cleanmgr
    if "%run-cmd%"=="26" dfrgui
    if "%run-cmd%"=="27" diskmgmt.msc
    if "%run-cmd%"=="28" dpiscaling
    if "%run-cmd%"=="29" dccw
    if "%run-cmd%"=="30" dpapimig
    if "%run-cmd%"=="31" verifier
    if "%run-cmd%"=="32" utilman
    if "%run-cmd%"=="33" eventvwr.msc
    if "%run-cmd%"=="34" fxscover
    if "%run-cmd%"=="35" joy.cpl
    if "%run-cmd%"=="36" irprops.cpl
    if "%run-cmd%"=="37" iexpress
    if "%run-cmd%"=="38" iexplore
    if "%run-cmd%"=="39" inetcpl.cpl
    if "%run-cmd%"=="40" lpksetup
    if "%run-cmd%"=="41" lusrmgr.msc
    if "%run-cmd%"=="42" magnify
    if "%run-cmd%"=="43" mrt
    if "%run-cmd%"=="44" mip
    if "%run-cmd%"=="45" mmc
    if "%run-cmd%"=="46" main.cpl
    if "%run-cmd%"=="47" napclcfg.msc
    if "%run-cmd%"=="48" narrator
    if "%run-cmd%"=="49" ncpa.cpl
    if "%run-cmd%"=="50" wiaacmgr
    if "%run-cmd%"=="51" notepad
    if "%run-cmd%"=="52" odbcad32
    if "%run-cmd%"=="53" osk
    if "%run-cmd%"=="54" documents
    if "%run-cmd%"=="55" downloads
    if "%run-cmd%"=="56" favorites
    if "%run-cmd%"=="57" pictures
    if "%run-cmd%"=="58" recent
    if "%run-cmd%"=="59" videos
    if "%run-cmd%"=="60" mspaint
    if "%run-cmd%"=="61" tabletpc.cpl
    if "%run-cmd%"=="62" collab.cpl
    if "%run-cmd%"=="63" perfmon.msc
    if "%run-cmd%"=="64" systempropertiesperformance
    if "%run-cmd%"=="65" telephon.cpl
    if "%run-cmd%"=="66" dialer
    if "%run-cmd%"=="67" powercfg.cpl
    if "%run-cmd%"=="68" printui
    if "%run-cmd%"=="69" eudcedit
    if "%run-cmd%"=="70" psr
    if "%run-cmd%"=="71" appwiz.cpl
    if "%run-cmd%"=="72" intl.cpl
    if "%run-cmd%"=="73" regedit
    if "%run-cmd%"=="74" rasphone
    if "%run-cmd%"=="75" mstsc
    if "%run-cmd%"=="76" resmon
    if "%run-cmd%"=="77" syskey
    if "%run-cmd%"=="78" desk.cpl
    if "%run-cmd%"=="79" services.msc
    if "%run-cmd%"=="80" computerdefaults
    if "%run-cmd%"=="81" shrpubw
    if "%run-cmd%"=="82" shrpubw
    if "%run-cmd%"=="83" fsmgmt.msc
    if "%run-cmd%"=="84" snippingtool
    if "%run-cmd%"=="85" mmsys.cpl
    if "%run-cmd%"=="86" soundrecorder
    if "%run-cmd%"=="87" cliconfg
    if "%run-cmd%"=="88" stikynot
    if "%run-cmd%"=="89" mobsync
    if "%run-cmd%"=="90" msconfig
    if "%run-cmd%"=="91" sysedit
    if "%run-cmd%"=="92" msinfo32
    if "%run-cmd%"=="93" sysdm.cpl
    if "%run-cmd%"=="94" systempropertiesadvanced
    if "%run-cmd%"=="95" systempropertieshardware
    if "%run-cmd%"=="96" systempropertiesremote
    if "%run-cmd%"=="97" systempropertiesprotection
    if "%run-cmd%"=="98" rstrui
    if "%run-cmd%"=="99" taskmgr
    if "%run-cmd%"=="100" taskschd.msc
    if "%run-cmd%"=="101" control.exe /name Microsoft.TaskbarandStartMenu
    if "%run-cmd%"=="102" control.exe /name Microsoft.Troubleshooting
    if "%run-cmd%"=="103" tpm.msc
    if "%run-cmd%"=="104" useraccountcontrolsettings
    if "%run-cmd%"=="105" control.exe /name Microsoft.UserAccounts
    if "%run-cmd%"=="106" utilman
    if "%run-cmd%"=="107" winver
    if "%run-cmd%"=="108" sndvol
    if "%run-cmd%"=="109" wscui.cpl
    if "%run-cmd%"=="110" slui
    if "%run-cmd%"=="111" WindowsAnytimeUpgradeui
    if "%run-cmd%"=="112" windowsanytimeupgraderesults
    if "%run-cmd%"=="113" isoburn
    if "%run-cmd%"=="114" dvdmaker
    if "%run-cmd%"=="115" migwiz
    if "%run-cmd%"=="116" explorer
    if "%run-cmd%"=="117" wfs
    if "%run-cmd%"=="118" optionalfeatures
    if "%run-cmd%"=="119" firewall.cpl
    if "%run-cmd%"=="120" journal
    if "%run-cmd%"=="121" wmplayer
    if "%run-cmd%"=="122" mdsched
    if "%run-cmd%"=="123" mblctr
    if "%run-cmd%"=="124" powershell
    if "%run-cmd%"=="125" powershell_ise
    if "%run-cmd%"=="126" msra
    if "%run-cmd%"=="127" recdisc
    if "%run-cmd%"=="128" wscript
    if "%run-cmd%"=="129" wuapp
    if "%run-cmd%"=="130" wusa
    if "%run-cmd%"=="131" wmimgmt.msc
    if "%run-cmd%"=="132" write
    if "%run-cmd%"=="133" xpsrchvwr
    if "%run-cmd%"=="0" exit
    goto menu
    
Pause
goto menu

::Verified and Tested