
@echo off 
@REM mode con cols=50 lines=50
setlocal enableextensions enabledelayedexpansion
title Git Activity - Automation V2.11.22

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Git Activity - Automation V2.11.22                                    
echo  Author      : Richu Antony                                 
echo  Description : Git Activity - Automation               
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


:loop
	echo.
	echo.
	echo 1  . Pull
	echo 2  . Status
	echo 3  . Add .
	echo 4  . Commit -m "automated commit"
	echo 5  . Push
	echo.
	echo 11 . Pull (all projects)
	echo 12 . Status (all projects)
	echo 13 . Add . (all projects)
	echo 14 . Commit -m "automated commit" (all projects)
	echo 15 . Push (all projects)
	echo.
	echo 0  . exit
	echo.

	set /p j=
	cd ..

	for %%p in (0) do if %j% == %%p goto exit
	for %%p in (1 2 3 4 5) do if %j% == %%p goto selective
	for %%p in (11 12 13 14 15) do if %j% == %%p goto all


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
	goto loop

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
	goto loop

:exit

::Verified and Tested