@echo off

rem Wrapper script for running WinGAMESS
rem
rem Written by Stig Rune Sellevag <stig-rune.sellevag@ffi.no>
rem No warranty offered.
rem
rem Modification Log:
rem -----------------
rem 2011-04-30 SRS> Original code.

setlocal enableextensions

set CYGWIN=nodosfilewarning

if [%NUMBER_OF_PROCESSORS%] == [] set NUMBER_OF_PROCESSORS=1
if [%COMPUTERNAME%] == [] set COMPUTERNAME=localhost

rem --------------------------------------------------------------------------

if [%1] == [] goto usage

set jobdir=%~dp1
set jobname=%~n1
set jobext=%~x1
set ncpus=%2

if [%jobext%] == [] goto no_ext
if not [%jobext%] == [.inp] goto bad_ext
if [%ncpus%] == [] set ncpus=1
if %ncpus% gtr %NUMBER_OF_PROCESSORS% set ncpus=%NUMBER_OF_PROCESSORS%

goto run

rem --------------------------------------------------------------------------

:run

set base="C:\WinGamess"
set sck="%base%\temp"
set scr="%base%\scratch"
set ver=10

del /q "%sck%\%jobname%.*" > nul 2>&1

%base%\dos2unix "%jobdir%%jobname%.inp" > nul 2>&1

copy "%jobdir%%jobname%.inp" "%scr%\%jobname%.F05" > nul 2>&1

echo Running %jobname%.inp ...

%base%\csh -f %base%\runscript.csh %jobname% %ver% %ncpus% %base% %COMPUTERNAME% > %jobname%.log 2>&1

if %ERRORLEVEL% neq 0 (
        echo Job %jobname%.inp has a problem! 
        taskkill /f /im gamess.%ver%.exe > nul 2>&1
        goto cleanup
)

echo Job %jobname%.inp finished

goto cleanup

rem --------------------------------------------------------------------------

:cleanup

if exist "%sck%\%jobname%.dat" copy /y "%sck%\%jobname%.dat" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.efp" copy /y "%scr%\%jobname%.efp" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.gamma" copy /y "%scr%\%jobname%.gamma" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.trj" copy /y "%scr%\%jobname%.trj" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.rst" copy /y "%scr%\%jobname%.rst" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.cosmo" copy /y "%scr%\%jobname%.cosmo" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.pot" copy /y "%scr%\%jobname%.pot" "%jobdir%\" > nul 2>&1
if exist "%scr%\%jobname%.ldos" copy /y "%scr%\%jobname%.ldos" "%jobdir%\" > nul 2>&1

del /q "%sck%\*.*" > nul 2>&1
del /q "%scr%\*.*" > nul 2>&1

goto end

rem --------------------------------------------------------------------------

:no_ext
echo Invalid input file extension: No extension
set ERRORLEVEL=1
goto end

rem --------------------------------------------------------------------------

:bad_ext
echo Bad input file extension: %jobext%
set ERRORLEVEL=1
goto end

rem --------------------------------------------------------------------------

:usage

echo Usage: %0 input_file [ncpus]

rem --------------------------------------------------------------------------

:end

