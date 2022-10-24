@echo off
setlocal

:autopilotInfoBlock
    :: **POWERSHELL CMDLETS** Creates HWID directory, declares execution policy, defines script path, installs packages, runs autopilot PS script, and creates autopilotInfo.csv to be renamed below.
    Powershell "& {set-executionpolicy -scope Process -executionpolicy remotesigned -force; new-item -type directory -path 'C:\HWID'; set-location -path "C:\HWID"; $env:Path += ';C:\Program Files\WindowsPowerShell\Scripts'; install-packageprovider -name NuGet -requiredversion 2.8.5.201 -force; install-package -name get-windowsautopilotinfo -force; get-windowsautopilotinfo -outputfile autopilotInfo.csv;}"
    goto :autopilotInfoConfirmation

:autopilotInfoConfirmation
    :: Check for pass/fail of the powershell cmdlets.
    if exist C:\HWID\autopilotInfo.csv (
        goto :csvRenameBlock
    ) else (
        goto :autopilotFail
    )

:csvRenameBlock
    :: Pulls serial number from BIOS and creates a temporary variable.
    echo Autopilot marked success, renaming .csv file.
    for /f "usebackq skip=1 tokens=* delims= " %%a in (`wmic bios get serialnumber`) do if not defined tempVar set "tempvar=%%a"

    :: Removes all spaces from temporary variable and creates new variable.
    set serialVar=%tempVar: =%
    echo System Serial Number Acquired.

    :: Renames autopilotInfo.csv to a serial specific .csv file.
    rename C:\HWID\autopilotInfo.csv %serialVar%.csv
    echo Rename Completed.

    :: Check for correct file rename to proceed with copying to removable drive.
    if exist C:\HWID\%serialVar%.csv goto :copyFile

:copyFile
    :: Begins by finding what drive letter is assigned to the removable disk.
    for /f "skip=1 tokens=1-10" %%a in ('wmic logicaldisk get description^, deviceid') do (
        if "%%a %%b"=="Removable Disk" (
            set removableDrive=%%c
        )
    )

    :: Checks for HWID folder in removable drive to copy .csv file to.
    if exist %removableDrive%\HWID (
        echo Copying file to removable drive.
        copy C:\HWID\%serialVar%.csv %removableDrive%\HWID
    ) else (
        echo Creating HWID folder on removable drive.
        md %removableDrive%\HWID
        echo Copying file to removable drive.
        copy C:\HWID\%serialVar%.csv %removableDrive%\HWID
    )
    pause
    goto :eof  

:autopilotFail
    :: Returns error to user and quits session.
    echo .csv file has failed to be created. This is likely due to the script not installing correctly, or not being run as administrator. Try again.
    pause


