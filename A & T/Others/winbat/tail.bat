@echo off

rem A DOS version of tail
rem
rem Written by Stig Rune Sellevag <stig-rune.sellevag@ffi.no>
rem No warranty offered.
rem
rem Modification Log:
rem -----------------
rem 2011-04-30 SRS> Original code.

setlocal enableextensions

if [%1] == [] goto usage

rem ---------------------------------------------------------------------------

:parse_input

set switch=%1

if [%switch%] == [] goto end_parse_input

set token=
set value=

for /f "tokens=1,2 delims=:" %%a in ("%switch%") do set token=%%a & set value=%%b

if [%token:~,-1%] == [/lines] goto get_lines
if [%token:~,-1%] == [/n] goto get_lines
if [%token:~,-1%] == [/file] goto get_file
if [%token:~,-1%] == [/f] goto get_file
if [%token:~,-1%] == [/help] goto usage
if [%token:~,-1%] == [/h] goto usage
if [%token:~,-1%] == [/?] goto usage

rem ---------------------------------------------------------------------------

:get_lines
set lines=%value%
shift
goto parse_input

rem ---------------------------------------------------------------------------

:get_file
set file=%value%
shift
goto parse_input

rem ---------------------------------------------------------------------------

:end_parse_input

if [%lines%] == [] set lines=10
if [%file%] == [] goto usage

for /f "usebackq tokens=3,3 delims= " %%i in (`find /c /v "" %file%`) do (call set totlines=%%i) 

set /a skip=%totlines%-%lines%

if %skip% lss 1 (
        more +0 %file%
) else (
        more +%skip% %file%
)

goto end

rem ---------------------------------------------------------------------------

:usage
echo Usage: tail [OPTIONS]
echo.
echo Options:
echo   /lines:K, /n:K        output the last K lines (default is 10)
echo   /file:NAME, /f:NAME   NAME of file (mandatory)

rem ---------------------------------------------------------------------------

:end

