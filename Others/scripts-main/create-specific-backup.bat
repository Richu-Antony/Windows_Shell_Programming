@echo off
@REM This script can be used as template to create backup scripts. 
@REM It will be useful if you have some filed (ex. some server settings) which need to be replaced regularly. 
@REM You need to provide the variables as described bellow. 
@REM A folder will be created for each backup using current date and time (ex. 2020-12-08_18-49-12).
@REM A counter is also used to display how many files coppied for each backup task.

@REM source: The source file dir (ex. The directory where you keep the original settings files).
@REM destination: The destination file dir (ex. The directory where your server keeps its settings files).
@REM backupsParent: The backup parent dit (ex. The directory where you want to keep all your settings files).
@REM backuFolder: The folder name of this backup (ex. "Apache" if this backup is for your apache's settings files).
@REM fileType: The file types to copy and backup (ex. *.properties in order to copy and backup all files with .properties extension).
@REM You can edit this file to call this function as many times you like with any parameters.

@REM Author: https://github.com/ckaridis

set /p source=Please enter the source folder path: 
set /p destination=Please enter the destination folder path: 
set /p backupsParent=Please enter the backups parent folder path: 
set /p backuFolder=Please enter the backup folder name: 
set /p fileType=Please enter extension of the files to backup (or *.* for all files):   

call :copyFiles "%source%", "%destination%" "%fileType%" "%backuFolder%"

@set totalCount=0

::::::::::: Get timestamp for backup folder naming  :::::::::::::
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
@set backupFolderName=%fullstamp%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

:::::::::::::::::::::::::   Functions   ::::::::::::::::::::::::::  
:: Copy files creating backup dir. 
:: %~1 source folder
:: %~2 destination folder
:: %~3 file type
:: %~4 backup folder name
:copyFiles
@set count=0
@set backupFolder="%backupsParent%\%~4\%backupFolderName%"
mkdir %backupFolder%
move "%~2\%~3" "%backupFolder%" >nul
for %%x in (%~1\%~3) do set /a count+=1
copy "%~1\%~3" "%~2" /Y /V >nul
@echo ************************************************
@echo *** Copy from: "%~1"
@echo *** Copy to: "%~2"
@echo *** %count% %3 files copied.
@echo ************************************************
@echo off
@set /a "totalCount=(%totalcount%+%count%)"
EXIT /B 0