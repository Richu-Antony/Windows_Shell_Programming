@echo off

REM 0.Set file location and name, if notifications are on
SET "user=\Users\user\Desktop"
SET "file=current_file.pdf"
SET "notif=off"

REM 0.Get current datetime
FOR /f "tokens=2-4 delims=/ " %%a IN ('date /t') DO (SET "mydate=%%c-%%a-%%b")
FOR /f "tokens=1-2 delims=/:" %%a IN ('time /t') DO (SET "mytime=%%a%%b")

REM 0.IF today's "completed" folder doesn't exist THEN create
IF NOT EXIST "%user%\completed\%mydate%\NUL" (
	MKDIR "%user%\completed\%mydate%"
)

REM 1.Load the "current" folder
cd%user%\current

REM 2.IF file exists THEN close/rename/move to "completed" folder; display balloon notification IF on
SET "title=%file% was moved"
SET "text=%file% has been renamed to %mytime% and moved to completed\%mydate%"
SET "icon=Information"

IF EXIST %file% (
	TASKKILL /IM Acrobat.exe
	START /HIGH Acrobat.exe
	REN %file% "%mytime%.pdf"
	MOVE "%mytime%.pdf" "%user%\completed\%mydate%"
	IF %notif%==off GOTO silent
	powershell -Command "[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); $objNotifyIcon=New-Object System.Windows.Forms.NotifyIcon; $objNotifyIcon.BalloonTipText='%text%'; $objNotifyIcon.Icon=[system.drawing.systemicons]::%icon%; $objNotifyIcon.BalloonTipTitle='%title%'; $objNotifyIcon.BalloonTipIcon='None'; $objNotifyIcon.Visible=$True; $objNotifyIcon.ShowBalloonTip(5000);"
)
:silent

REM 3.IF there are 0 files THEN open general directory for more files ELSE rename first file and open
SET /a "count=0" & FOR %%f IN (*.pdf) DO @(SET /a "count+=1" > NUL)

IF %count%==0 (
	START %SystemRoot%\explorer.exe
	GOTO empty
)

FOR %%F IN (*.pdf) DO (
	SET "first=%%F"
	GOTO end
)
:end

REN "%first%" %file%
START /HIGH %file%

:empty
