@REM This script deletes all files from a specific folder.
@REM Can also be used as template to clear several folders at once.
@REM Please note that it only deletes files and not folders/directories.
@REM USE WITH CAUTION!

@REM Author: https://github.com/ckaridis

set /p dir=Please enter the path where all files will be deleted: 

call :deleteAllFiles "%dir%\*"

@echo DONE!
@echo off
pause
EXIT /B 0

:deleteAllFiles
for %%i in (%~1) do (
        del /s /q "%%i"
        echo "%%i" was deleted. 
        echo off
)
EXIT /B 0