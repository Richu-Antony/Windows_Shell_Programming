@echo off
Mode 110,3 & color 0A
Title Downloading Multi-files from web using powershell and batch by Richu Antony
Set "List_Urls_File=Urls.txt"
If not exist "%List_Urls_File%" Call :Create_Urls_File
Setlocal enabledelayedexpansion
@For /f "delims=" %%a in ('Type "%List_Urls_File%"') do (
	Set "URL=%%a"
	Rem we set the Filename from the variable !url!
	@for %%# in (!url!) do ( set "File=%%~#" )
	Rem Check if the file name contains a dot "." 
	Rem If not we increment the counter +1 for file to be download
		ECHO !File! | FIND /I ".">Nul 2>&1
		If "!errorlevel!" NEQ "0" (
			Set /a Count+=1
			cls & echo(
			echo               Downloading file "File-!Count!.bat" from URL : "!URL!"
			Call :BalloonTip 'information' 10 '"Downloading File-!Count!.bat"' "'Please wait... Downloading File-!Count!.bat....'" 'info' 4
			Call :Download "%%a" "File-!Count!.bat"
		) else (
			cls & echo(
			echo    Downloading file "!File!" from URL : "!URL!"
			Call :BalloonTip 'information' 10 '"Downloading !File!"' "'Please wait... Downloading !File!....'" 'info' 4

			Call :Download "%%a" "!File!"
		)
)
Explorer "%~dp0" & exit
::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
::*********************************************************************************
:Create_Urls_File
(
	echo https://github.com/pbatard/rufus/releases/download/v3.19/rufus-3.19.exe
)>"%List_Urls_File%"
exit /b
::*********************************************************************************
:BalloonTip $notifyicon $time $title $text $icon $Timeout
PowerShell  ^
  [reflection.assembly]::loadwithpartialname('System.Windows.Forms') ^| Out-Null; ^
  [reflection.assembly]::loadwithpartialname('System.Drawing') ^| Out-Null; ^
  $notify = new-object system.windows.forms.notifyicon; ^
  $notify.icon = [System.Drawing.SystemIcons]::%1; ^
  $notify.visible = $true; ^
  $notify.showballoontip(%2,%3,%4,%5); ^
  Start-Sleep -s %6; ^
  $notify.Dispose()
%End PowerShell%
exit /B
::*************************************************************************