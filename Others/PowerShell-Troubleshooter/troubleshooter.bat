timeout 1
@echo off
Title *FBE Troubleshooter*
rem if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

rem setlocal ENABLEDELAYEDEXPANSION & set "_FilePath=%~1"
rem   if NOT EXIST "!_FilePath!" (echo/Starting AdminElevation)
rem   set "_FN=_%~ns1" & echo/%TEMP%| findstr /C:"(" >nul && (echo/ERROR: %%TEMP%% path can not contain parenthesis &pause &endlocal &fc;: 2>nul & goto:eof)
rem   set _FN=%_FN:(=%
rem   set _vbspath="%temp:~%\%_FN:)=%.vbs" & set "_batpath=%temp:~%\%_FN:)=%.bat"
rem   >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem   if "%errorlevel%" NEQ "0" goto :_getElevation
rem   (if exist %_vbspath% ( del %_vbspath% )) & (if exist %_batpath% ( del %_batpath% )) 
rem   endlocal & CD /D "%~dp1" & ver >nul & goto:eof
rem   :_getElevation
rem   echo/Requesting elevation...
rem   echo/Set UAC = CreateObject^("Shell.Application"^) > %_vbspath% || (echo/&echo/Unable to create %_vbspath% & endlocal &md; 2>nul &goto:eof) 
rem   echo/UAC.ShellExecute "%_batpath%", "", "", "runas", 1 >> %_vbspath% & echo/wscript.Quit(1)>> %_vbspath%
rem   echo/@%* > "%_batpath%" || (echo/&echo/Unable to create %_batpath% & endlocal &md; 2>nul &goto:eof)
rem   echo/@if %%errorlevel%%==9009 (echo/Admin user could not read the batch file. If running from a mapped drive or UNC path, check if Admin user can read it.) ^& @if %%errorlevel%% NEQ 0 pause >> "%_batpath%"
rem   %_vbspath% && (echo/&echo/Failed to run VBscript %_vbspath% &endlocal &md; 2>nul & goto:Ask)
rem   echo/&echo/Elevation was requested on a new CMD window &endlocal &fc;: 2>nul & goto:Ask



if %1=="" (
	GOTO Ask
	)
if %1==network (
	set "connection=network"
	)
if %1==local (
	set "connection=local"
	)
if %2==auto (
	set "run1=False"
	set "mode=auto"
	)
if %2==manual (
	set "mode=manual"
	set "run1=False"
	if %3==1 (
		set "run1=True"
		echo Executing network drive fix.
		timeout 1
		GOTO networkDrive
	)
	if %3==2 (
		set "run1=True"
		echo Executing RDP fix.
		timeout 1
		GOTO rdp
	)
	if %3==3 (
		set "run1=True"
		echo Executing Domain Check.
		timeout 1
		GOTO domainCheck
	)
	if %3==4 (
		set "run1=True"
		echo Executing Domain Check.
		timeout 1
		GOTO return
	)
	if %3==5 (
		set "run1=True"
		echo Executing Domain Check.
		timeout 1
		GOTO serviceCheck
	)
	if %3==6 (
		set "run1=True"
		echo Executing Domain Check.
		timeout 1
		GOTO uninstallProgram
	)
	GOTO return
)
if %mode%==auto (
	GOTO Automatic
	)
timeout 5
goto:Ask
:Ask
cls
color B
echo                             FBE Troubleshooter
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [                 We will find and hopefully fix common issues                ]
echo [                         Options selected: %1 %2 %3                          ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
timeout 3

:isNetwork
cls
echo                               FBE Troubleshooter
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [                      Are you connected to the network?                      ]
echo [                            (Can access X drive)                             ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
set INPUT=
set /P INPUT= Ready? (Y/N): %=%
If /I "%INPUT%"=="y" goto network 
If /I "%INPUT%"=="n" goto local
If /I "%INPUT%"=="Y" goto network
If /I "%INPUT%"=="N" goto local
echo Incorrect input & timeout 2 & goto yes


:network
cls
echo                               FBE Troubleshooter
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [                     You will connect through the network                    ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
set "connection=network"
timeout 5
GOTO return


:local
cls
echo                             FBE Troubleshooter
echo [-----------------------------------------------------------------------------]
echo [                                                                             ]
echo [                        You will connect locally                             ]
echo [                                                                             ]
echo [-----------------------------------------------------------------------------]
echo.
set "connection=local"
timeout 5
GOTO return


cls
title FBE Troubleshooter

::------Return To Menu------
SET RETURN=Return
:Return
::------Return To Menu------


::===============================Main Menu==========================================
title *FBE Troubleshooter*
cls
color B
echo                             Main Menu
echo *******************************************************************************
echo *                                                                             *
echo *  What problem are you experiencing?                                         *
echo *                                                                             *
echo *  Enter [1] To fix network drives (X, Y, Z, and J)                           *
echo *  Enter [2] To check remote desktop connection                               *
echo *  Enter [3] To check domain status                                           *
echo *  Enter [4] To uninstall microsoft office completely (non-functional)        *
echo *  Enter [5] Check running services (printe spooler)                          *
echo *  Enter [6] to uninstall a program                                           *
echo *  Enter [7] to go innactive (non-functional)                                 *
echo *                                                                             *
echo *                                                                             *
echo *  Enter 9 To Exit                                                            *
echo *  Connection Type: %connection%                                                   *
echo *******************************************************************************
set input=
set /p input= Enter Option %=%
if "%input%"=="1" goto networkDrive
if "%input%"=="2" goto rdp
if "%input%"=="3" goto domainCheck
if "%input%"=="4" goto return
if "%input%"=="5" goto serviceCheck
if "%input%"=="6" goto uninstallProgram
if "%input%"=="7" goto goInnactive
if "%input%"=="9" goto z
echo Incorrect input & timeout 2 & goto Return


:Automatic
if %2==auto (
	GOTO networkDrive
)

:rdp
cls
echo [=       ]
echo [==      ]
echo [===     ]
echo [====    ]
echo [=====   ]
echo [======  ]
echo [======= ]
echo [========]
if %connection%==local (
	echo Runing script locally
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\RDP.ps1"
)
if %connection%==network (
	echo Runing script on the network
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\RDP.ps1"
)
timeout 3
if %mode%==auto (
	Echo loading domain check
	GOTO domainCheck
)
if %run1%==True (
	GOTO z
	)
GOTO Return


:domainCheck
rem cd scripts
cls
echo Starting script
if %connection%==local (
	echo Runing script locally
	timeout 1
	cls
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\domain-checker.ps1"
)
if %connection%==network (
	echo Loading from network
	timeout 1
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\domain-checker.ps1"
)
timeout 3
if %mode%==auto (
	cls
	GOTO serviceCheck
)
if %run1%==False (
GOTO Return
)
if %run1%==True (
	GOTO z
)

:networkDrive
cls
echo checking if mapped drives exists..
if exist X:\ (
	echo drive X does exists
	) else (
		net use X: \\FBESERVER\data2 /Persistent:Yes
		echo X drive was created
)
if exist Y:\ (
	echo drive Y does exists
	) else (
		net use Y: \\FBESERVER\data2 /Persistent:Yes
		echo Y drive was created
)
if exist Z:\ (
	echo drive Z does exists
	) else (
		net use Z: \\FBESERVER\data2 /Persistent:Yes
		echo Z drive was created
)
if exist J:\ (
	echo drive J does exists
	) else (
		net use J: \\FBESERVER\Jonas /Persistent:Yes
		echo J drive was created
)
timeout 5
if %mode%==manual (
	GOTO Return
)
if %mode%==auto (
	if %run1%==True (
	GOTO z
		)
	GOTO rdp
) 


:serviceCheck
cls
if %connection%==local (
	echo Runing script locally
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\service-checker.ps1 Spooler"
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\service-checker.ps1 TermService"
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\service-checker.ps1 SsPaAdm"
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\service-checker.ps1 ssSpnAv"
)
if %connection%==network (
	echo Runing script locally
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\service-checker.ps1 Spooler"
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\service-checker.ps1 TermService"
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\service-checker.ps1 SsPaAdm"
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\service-checker.ps1 ssSpnAv"
)
echo "Finished executing service checkers"
timeout 3
if %mode%==manual (
	cls
	TIMEOUT 3
	GOTO Return
	)
if %mode%==auto (
	cls
	echo Automatic completed.
	TIMEOUT 5
	GOTO z
)
if %run1%==True (
	timeout 3
	GOTO z
)



:goInnactive
cls
Echo Starting execution
if %connection%==local (
	echo Runing script locally
	timeout 1
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\change-status.ps1"
)
if %connection%==network (
	echo Runing script on network
	timeout 1
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\change-status.ps1"
)
echo Done!
TIMEOUT 5
GOTO return

:uninstallProgram
cls
echo Does this program require administrator elevation? - Most programs require 'True'
set /p isElevation=True or False: 
echo you typed %isElevation%
timeout 3
cls

if %isElevation%==True (
	echo You will now be prompted to enter administrator credentials.
	set "ProgramName=UnnamedProgram"
	goto uninstallProgram3
)
if %isElevation%==False (
	echo What program should we uninstall?
	set /p ProgramName=Enter program name:
	timeout 3
	goto uninstallProgram3
)
:uninstallProgram3
echo Uninstalling %ProgramName%
if %connection%==local (
	echo Runing script locally
	powershell.exe -ExecutionPolicy Bypass -Command ".\scripts\uninstall.ps1 %ProgramName% %isElevation%"
)
if %connection%==network (
	echo Runing script on network
	powershell.exe -ExecutionPolicy Bypass -Command "\\FBESERVER\data2\royce\scripts\uninstall.ps1 %ProgramName% %isElevation%"
)
echo "Finished executing uninstall program script"
timeout 10
if %mode%==manual (
	TIMEOUT 3
	GOTO Return
	)
if %mode%==auto (
	cls
	echo Automatic completed.
	TIMEOUT 5
	GOTO z
)
if %run1%==True (
	timeout 3
	GOTO z
)

:z
cls
echo                            Closing Application
echo *******************************************************************************
TIMEOUT /T 2
exit