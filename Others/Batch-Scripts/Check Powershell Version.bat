:: Prints the installed powershell version.

@echo off
echo Checking powershell version...
del "%temp%\PSVers.txt" 2>nul
powershell -command "[string]$PSVersionTable.PSVersion.Major +'.'+ [string]$PSVersionTable.PSVersion.Minor | Out-File ([string](cat env:\temp) + '\PSVers.txt')" 2>nul
if errorlevel 1 (
 echo Powershell is not installed.
) else (
 echo You have version:
 type "%temp%\PSVers.txt"
 del "%temp%\PSVers.txt" 2>nul
)
pause > nul
