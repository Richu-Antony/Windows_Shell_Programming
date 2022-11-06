@echo off
if %os%==Windows_NT goto WINNT
goto NOCON

:WINNT
echo .Using a Windows NT based system
echo ..%computername%

echo Deleting Windows Temporary Files
del /q /f /s "C:\temp\*.*"
del /q /f /s "%WINDIR%\TEMP\*.*"
echo deleted!

echo Deleting Windows Log Files
del /q /f /s "%WINDIR%\*.log"
del /q /f /s "%WINDIR%\security\logs\*.*"
del /q /f /s "%WINDIR%\system32\LogFiles\AIT\*.etl"
del /q /f /s "%WINDIR%\system32\LogFiles\SQM\*.etl"
echo deleted!

echo Deleting Windows Error Reporting Files
del /q /f /s "%PROGRAMDATA%\Microsoft\Windows\WER\ReportArchive\*.*"
echo deleted!

echo Deleting Windows Prefetch Data
del /q /f /s "%WINDIR%\Prefetch\*.*"
echo deleted!

echo Deleting sysprep Files
del /q /f /s "C:\Autounattend.xml"
rmdir /s /q "C:\sysprep"
del /q /f /s "%WINDIR%\Panther\unattend.xml"
del /q /f /s "%WINDIR%\system32\sysprep\sysprep.xml"

echo Deleting Adobe Temporary Files
rmdir /s /q "C:\_AcroTemp"
echo deleted!

echo Deleting Public Users Desktop Shortcuts
del /q /f /s "C:\Users\Public\Desktop\*.*"
echo deleted!

echo Deleting Windows Defender Temp Data
del /q /f /s "%PROGRAMDATA%\Microsoft\Windows Defender\Scans\History\Results\Quick\*.*"
del /q /f /s "%PROGRAMDATA%\Microsoft\Windows Defender\Scans\History\Results\Resource\*.*"
echo deleted!

goto END

:NOCON
echo Error...Invalid Operating System...
echo Error...No actions were made...
goto END

:END