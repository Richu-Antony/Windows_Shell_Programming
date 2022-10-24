@echo off
@REM A simple script to view your windows' serial code.

@REM Author: https://github.com/ckaridis

wmic path softwarelicensingservice get OA3xOriginalProductKey
pause