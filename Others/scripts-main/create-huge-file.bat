@echo off
@REM This script creates a dummy (empty) file of any specific size.
@REM Useful for testing purposes when you need your disk to have few or no empty space available.
@REM The dummy file will be named "delete.me" and be created at the same directory where the script exists.

@REM Please note that the "file createnew" command needs the filesize inserted in bytes.
@REM Due to the 32bit limitation of CMD (-2,147,483,648 through 2,147,483,647) the last 3 digits are inserted as text (string).
@REM The actual file size will be close enough but not exactly at the file size requested.
@REM For the same reason, the maximum value that can be insered is 2TB (about 2147).

@REM Author: https://github.com/ckaridis

set /p size=Please enter the file size in GB: 
set /a res="size * 1024 * 1024"
set filename=delete.me

fsutil file createnew delete %res%000