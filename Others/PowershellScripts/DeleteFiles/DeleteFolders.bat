:: Purpose:
:: To force delete directories and create new directories.

TIMEOUT /T 120

RD /S /Q "C:\Dev\Project1"
RD /S /Q "C:\Dev\Project2"
RD /S /Q %systemdrive%\$Recycle.bin

MD "C:\Dev\TestDirectory1"
MD "C:\Dev\TestDirectory2\Test1\Test2"

pause
 