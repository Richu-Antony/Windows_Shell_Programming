@echo off
rem number-guess.bat - A number guess game in Batch script.
rem Copyright (c) 2020 Michelle Chen.
rem Licensed under MIT.


rem Set initial game state.
set /A min=1
set /A max=100
set /A answer=%min% + %RANDOM% %% (%max% - %min% + 1)

rem Enter the game loop.
:game_loop
rem Receive a guess from user input.
call :prompt %min%, %max%, guess

if %guess% equ %answer% (
  echo You guess right
  goto game_over
)

if %guess% lss %answer% (
  echo Too small
  set min=%guess%
  goto game_loop
)

if %guess% gtr %answer% (
  echo Too large
  set max=%guess%
  goto game_loop
)  

rem Quit the game.
:game_over
exit /B %ERRORLEVEL%

rem Function to prompt for user input
:prompt
set /P in=Input a number between %~1 and %~2: 

rem Check whether %in% is a valid number
echo %in% | findstr "\<[1-9][0-9]*\>">nul
if %ERRORLEVEL% neq 0 (
  echo Invalid number %in% >&2
  call :prompt %~1, %~2, out
)

rem Check whether %in% is within the range.
if %in% lss %~1 (
  echo Number out of range >&2
  call :prompt %~1, %~2, out
)

if %in% gtr %~2 (
  echo Number out of range >&2
  call :prompt %~1, %~2, out
)

rem Set return value.
set %~3=%in%
exit /B 0