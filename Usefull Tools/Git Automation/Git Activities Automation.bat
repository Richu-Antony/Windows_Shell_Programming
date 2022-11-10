@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\richu\OneDrive\Desktop\Git Activities Automation.exe
REM BFCPEICON=C:\Users\richu\Downloads\git_93585.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=1
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=6.11.22.0
REM BFCPEVERPRODUCT=Git Activities Automation
REM BFCPEVERDESC=Git Activities Automation
REM BFCPEVERCOMPANY=Rica
REM BFCPEVERCOPYRIGHT=@Rica inc
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=0
REM BFCPEWINDOWWIDTH=0
REM BFCPEWTITLE=Window Title
REM BFCPEOPTIONEND
@echo off 
@REM mode con cols=50 lines=50
setlocal enableextensions enabledelayedexpansion
title Git Activities - Automation V6.11.22


:Main
	cls

	echo.
	echo Copyright(C) 2022 By Rica Inc.
	echo #
	echo  Tool        : Git Activities - Automation V6.11.22                                    
	echo  Author      : Richu Antony                                 
	echo  Description : Git Activities Easy Maintain Tool               
	echo #
	echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
	echo.
	echo.


:loop
	echo.
	echo.
	echo 1. Pull						11. Pull (all projects)
	echo 2. Status						22. Status (all projects)
	echo 3. Add .						33. Add . (all projects)
	echo 4. Commit -m"Automated commit"		44. Commit -m"Automated commit" (all projects)
	echo 5. Push						55. Push (all projects)
	echo 0. Exit
	echo.
	echo.

	set /p j=Enter The Choice: 
	@REM cd ..

	for %%p in (0) do if %j% == %%p goto exit
	for %%p in (1 2 3 4 5) do if %j% == %%p (goto selective) else (goto Main)
	for %%p in (11 22 33 44 55) do if %j% == %%p (goto all) else (goto Main)


:selective
	If %j%==1 (set command=git pull)
	If %j%==2 (set command=git status)
	If %j%==3 (set command=git add .)
	If %j%==4 (set command=git commit -m "automated push")
	If %j%==5 (set command=git push)
	echo.
	echo select one of the projects:
	set /a count = 1
	for /d %%i in (*.*) do ( 
		echo !count! . %%i
		set /a count += 1
	)
	set /p project=
	set /a count = 1
	for /d %%i in (*.*) do ( 
		if !project! == !count! (
			@echo on
			cd %%i & %command% & cd..
			@echo off
		)
		set /a count += 1
	)
	cd git-automation
	pause
	goto Main

:all
	If %j%==11 (set command=git pull)
	If %j%==12 (set command=git status)
	If %j%==13 (set command=git add .)
	If %j%==14 (set command=git commit -m "automated push")
	If %j%==15 (set command=git push)
	@echo on
	for /d %%i in (*.*) do ( cd %%i & %command% & cd.. )
	@echo off
	cd git-automation
	pause
	goto Main

:exit

::Verified and Tested