:: Author Jan Wądołowski
:: 2021-02-09

@echo off

::----------------------- ADJUST PATHS BELOW  -------------------------------
:: Script makes backup copy of source_folder. Set path to folder below:
set "source_folder=D:\Desktop\example"
:: Backups of source_folder will be kept in target_folder. Set path to folder below:
:: set target_folder = "%UserProfile%\Documents\backup"
set "target_folder=D:\Desktop\backup"

::----------------------- NO NEED TO ADJUUST THE REST -----------------------
:: Getting current date
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "datestamp=%YYYY%-%MM%-%DD%"

if not exist %target_folder%\ (
    mkdir %target_folder%
)

:: If source_folder exists make copy and add YYYY-MM-DD to foldername
if exist %source_folder%\ (
    mkdir %target_folder%\backup_%datestamp%
    robocopy %source_folder% %target_folder%\backup_%datestamp% /e /j /np /eta /njh

    echo Successfull backup of %source_folder%.
    echo Stored in %target_folder%\backup_%datestamp%
    echo Returning...
    exit 0
) else (
    echo Folder to backup: %source_folder% doesn't exist.
    exit 3
)
