@ECHO OFF
@title DLES

:: dles.bat
:: Michael McMahon

:: github.com/BlueHillBGCB/BAT/dles.bat

:: To run this script, right click on the file and choose "Run as administrator" to start.  You should read all bat files before giving them admin rights.

:: Based off of OSACS by agent-squirrel
:: https://www.reddit.com/r/commandline/comments/2sm2lc/osacs_officeworks_setup_and_cleaning_system/

REM ######################################################
REM #The Digital Learning Environment Setup (DLES) script
REM #creates useful scheduled tasks and helps automate
REM #Windows systems in educational environments.
REM ######################################################

:: TODO
:: The system is circumvented from Friday history in cache by doing a special maneuver in the browser.
:: Rename history with hostname and today's date.
:: Copy history to a remote machine.
:: Clear browsing history.
:: This also solves the problem of not logging out of accounts.

CLS
mode con: cols=92 lines=20

:: First lets check what mode we are running in.
:: Failure to check what mode we are in will result in the admin check failing
:: in safe mode.
if /i "%SAFEBOOT_OPTION%"=="MINIMAL" goto progstart
if /i "%SAFEBOOT_OPTION%"=="NETWORK" goto progstart

:MENU
CLS


goto check_Permissions

:: Attempts to run the 'net session' command and if it fails, assumes we are not
:: running with elevated permissions.
:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        GOTO progstart
    ) else (
        echo.
        echo.
        echo.
        echo Current permissions inadequate.
        echo Please re-run as admin by right clicking the program and choosing
        echo 'Run as Administrator'
        echo Press Enter to quit.
    )

    pause>nul
    EXIT

:progstart


mode con: cols=74 lines=20

:: Spawn the batch file used to generate the ASCII art at the top of the menu.
:: The ASCII script is pretty hefty and as a wonderful side effect, it tends to
:: load in line by line on slower machines.
:: ECHO out the menu then pause.
ECHO.
ECHO.
ECHO ================= Digital Learning Environment Setup (DLES) =============
ECHO ======================= What would you like to do? ======================
ECHO -------------------------------------------------------------------------
ECHO 1. Setup automatic school year shutdown (Sep-Jun)
ECHO 2. Setup automatic summer shutdown (Jul-Aug)
ECHO 3. Setup automatic summer shutdown TC (Jul-Aug)
ECHO 4. Setup HOSTS file rotation (games only on Fridays)
ECHO 5. Setup updating HOSTS file (most games any day)
ECHO 6. Setup school year HOSTS file rotation (local web Server redirect)
ECHO C. Reverse changes to scheduled tasks.
ECHO ============================PRESS 'Q' TO QUIT============================
ECHO.

SET INPUT=
SET /P INPUT=Please select a number:

IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='3' GOTO Selection3
IF /I '%INPUT%'=='4' GOTO Selection4
IF /I '%INPUT%'=='5' GOTO Selection5
IF /I '%INPUT%'=='6' GOTO Selection6
IF /I '%INPUT%'=='C' GOTO Selection9
IF /I '%INPUT%'=='Q' GOTO EXITMSG

CLS

ECHO.
ECHO.
ECHO.
ECHO Whatever you just pressed probably wasn't between 1 and 5.
ECHO -------------------------------------
ECHO Please select a number from the Main Menu
ECHO  [1-4] or select 'Q' to quit.
ECHO -------------------------------------
ECHO.
ECHO Press enter to have another go.

PAUSE > NUL
GOTO MENU

:Selection1

CLS

ECHO 1. Setup automatic school year shutdown (Sep-Jun)
ECHO =============================Installing...===============================

schtasks /delete /tn "DailySchoolShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown2" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown3" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "DailySchoolShutdown" /xml %~dp0\dlesXML\DailySchoolShutdown.xml /f 1>NUL
GOTO progstart


:Selection2

CLS

ECHO 2. Setup automatic summer shutdown (Jul-Aug)
ECHO =============================Installing...===============================

schtasks /delete /tn "DailySchoolShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown2" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown3" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "DailySummerShutdown" /xml %~dp0\dlesXML\DailySchoolShutdown.xml /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "DailySummerShutdown2" /xml %~dp0\dlesXML\DailySchoolShutdown2.xml /f 1>NUL
GOTO progstart


:Selection3

CLS

ECHO 3. Setup automatic summer shutdown TC (Jul-Aug)
ECHO =============================Installing...===============================

schtasks /delete /tn "DailySchoolShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown2" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown3" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "DailySummerShutdown3" /xml %~dp0\dlesXML\DailySchoolShutdown3.xml /f 1>NUL
GOTO progstart


:Selection4

mode con: cols=80 lines=25
CLS

ECHO 4. Setup HOSTS file rotation (games only on Fridays)
ECHO =============================Installing...===============================

:: Create a directory on disk.
if not exist C:\hosts mkdir C:\hosts

:: MUST BE RUN WITH ADMIN CMD
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwin.txt'; $path = 'c:\hosts\HOSTSFwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwin.txt'; $path = 'c:\hosts\HOSTSMTWRwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/BAT/master/updatehosts.bat'; $path = 'c:\hosts\updatehosts.bat'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
:: Formatting from ::http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate

:: Create bat files
:: Build updatehosts.bat
:: http://stackoverflow.com/questions/11364147/setting-a-windows-batch-file-variable-to-the-day-of-the-week
@echo :: undatehosts.bat> c:\hosts\updatehosts.bat
@echo :: Michael McMahon>> c:\hosts\updatehosts.bat
@echo :: This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on Windows systems.>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: MUST BE RUN WITH ADMIN CMD>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo @ECHO OFF>> c:\hosts\updatehosts.bat
@echo :: Create a directory on disk.>> c:\hosts\updatehosts.bat
@echo if not exist C:\hosts mkdir C:\hosts>> c:\hosts\updatehosts.bat
@echo powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwin.txt'; $path = 'c:\hosts\HOSTSFwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL>> c:\hosts\updatehosts.bat
@echo powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwin.txt'; $path = 'c:\hosts\HOSTSMTWRwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL>> c:\hosts\updatehosts.bat
@echo :: Formatting from http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: This copies the hosts file depending on the day>> c:\hosts\updatehosts.bat
@echo setlocal 1>NUL>> c:\hosts\updatehosts.bat
@echo for /f "delims=" %%%%a in ('wmic path win32_localtime get dayofweek /format:list ') do for /f "delims=" %%%%d in ("%%%%a") do set %%%%d 1>NUL>> c:\hosts\updatehosts.bat
@echo IF %%dayofweek%%==5 (copy /Y C:\hosts\HOSTSFwin.txt C:\windows\system32\drivers\etc\hosts) ELSE (copy /Y C:\hosts\HOSTSMTWRwin.txt C:\windows\system32\drivers\etc\hosts) 1>NUL>> c:\hosts\updatehosts.bat
@echo endlocal 1>NUL>> c:\hosts\updatehosts.bat
@echo :: Formatting from http://stackoverflow.com/questions/11364147/setting-a-windows-batch-file-variable-to-the-day-of-the-week 1>NUL>> c:\hosts\updatehosts.bat

:: Create a task that runs every time the computer starts
schtasks /delete /tn "UpdateHosts" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "UpdateHosts" /xml %~dp0\dlesXML\UpdateHosts.xml /f 1>NUL

GOTO progstart



:Selection5

mode con: cols=80 lines=25
CLS

ECHO 5. Setup updating HOSTS file (most games any day)
ECHO =============================Installing...===============================

:: Create some directories on disk.
if not exist C:\hosts mkdir C:\hosts

:: MUST BE RUN WITH ADMIN CMD
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwin.txt'; $path = 'c:\hosts\HOSTSFwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwin.txt'; $path = 'c:\hosts\HOSTSMTWRwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
:: Formatting from ::http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate

:: Create bat files

:: Build updatehosts.bat
@echo :: undatehosts.bat> c:\hosts\updatehosts.bat
@echo :: Michael McMahon>> c:\hosts\updatehosts.bat
@echo :: This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on Windows systems.>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: MUST BE RUN WITH ADMIN CMD>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo @ECHO OFF>> c:\hosts\updatehosts.bat
@echo :: Create a directory on disk.>> c:\hosts\updatehosts.bat
@echo if not exist C:\hosts mkdir C:\hosts>> c:\hosts\updatehosts.bat
@echo powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwin.txt'; $path = 'c:\hosts\HOSTSFwin.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL>> c:\hosts\updatehosts.bat
@echo :: Formatting from ::http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: This copies the hosts file>> c:\hosts\updatehosts.bat
@echo copy /Y C:\hosts\HOSTSFwin.txt C:\windows\system32\drivers\etc\hosts 1>NUL>> c:\hosts\updatehosts.bat

:: Create a task that runs every time the computer starts
schtasks /delete /tn "UpdateHosts" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "UpdateHosts" /xml %~dp0\dlesXML\UpdateHosts.xml /f 1>NUL

GOTO progstart


:Selection6

mode con: cols=80 lines=25
CLS

ECHO 6. Setup HOSTS file rotation (local web Server redirect)
ECHO =============================Installing...===============================

:: Create a directory on disk.
if not exist C:\hosts mkdir C:\hosts

:: MUST BE RUN WITH ADMIN CMD
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwinLS.txt'; $path = 'c:\hosts\HOSTSFwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwinLS.txt'; $path = 'c:\hosts\HOSTSMTWRwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL
:: Formatting from ::http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate

:: Create bat files
:: Build updatehosts.bat
@echo :: undatehosts.bat> c:\hosts\updatehosts.bat
@echo :: Michael McMahon>> c:\hosts\updatehosts.bat
@echo :: This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on Windows systems.>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: MUST BE RUN WITH ADMIN CMD>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo @ECHO OFF>> c:\hosts\updatehosts.bat
@echo :: Create a directory on disk.>> c:\hosts\updatehosts.bat
@echo if not exist C:\hosts mkdir C:\hosts>> c:\hosts\updatehosts.bat
@echo powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwinLS.txt'; $path = 'c:\hosts\HOSTSFwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL>> c:\hosts\updatehosts.bat
@echo powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwinLS.txt'; $path = 'c:\hosts\HOSTSMTWRwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 1>NUL>> c:\hosts\updatehosts.bat
@echo :: Formatting from http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate>> c:\hosts\updatehosts.bat
@echo. >> c:\hosts\updatehosts.bat
@echo :: This copies the hosts file depending on the day>> c:\hosts\updatehosts.bat
@echo setlocal 1>NUL>> c:\hosts\updatehosts.bat
@echo for /f "delims=" %%%%a in ('wmic path win32_localtime get dayofweek /format:list ') do for /f "delims=" %%%%d in ("%%%%a") do set %%%%d 1>NUL>> c:\hosts\updatehosts.bat
@echo IF %%dayofweek%%==5 (copy /Y C:\hosts\HOSTSFwinLS.txt C:\windows\system32\drivers\etc\hosts) ELSE (copy /Y C:\hosts\HOSTSMTWRwinLS.txt C:\windows\system32\drivers\etc\hosts) 1>NUL>> c:\hosts\updatehosts.bat
@echo endlocal 1>NUL>> c:\hosts\updatehosts.bat
@echo :: Formatting from http://stackoverflow.com/questions/11364147/setting-a-windows-batch-file-variable-to-the-day-of-the-week 1>NUL>> c:\hosts\updatehosts.bat




:: Create a task that runs every time the computer starts
SCHTASKS /delete /tn "UpdateHosts" /f 1>NUL
SCHTASKS /Create /RU "SYSTEM" /TN "UpdateHosts" /xml %~dp0\dlesXML\UpdateHosts.xml /f 1>NUL

GOTO progstart



:Selection9

mode con: cols=80 lines=25
CLS

ECHO C. Reverse changes to scheduled tasks.
ECHO =============================Installing...===============================

schtasks /delete /tn "Summer Computer Shutdown" /f 1>NUL
schtasks /delete /tn "Yearly Computer Shutdown" /f 1>NUL
schtasks /delete /tn "HostRotateYearFriMorn" /f 1>NUL
schtasks /delete /tn "HostRotateSumFriMorn" /f 1>NUL
schtasks /delete /tn "HostRotateYearFriEven" /f 1>NUL
schtasks /delete /tn "HostRotateSumFriEven" /f 1>NUL
schtasks /delete /tn "HostRotateonlogon" /f 1>NUL
schtasks /delete /tn "HostRotateonstart" /f 1>NUL
schtasks /delete /tn "UpdateHosts" /f 1>NUL

schtasks /delete /tn "DailySchoolShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown2" /f 1>NUL
schtasks /delete /tn "DailySummerShutdown3" /f 1>NUL
schtasks /delete /tn "HostRotateSchoolFriMorn" /f 1>NUL
schtasks /delete /tn "HostRotateSummerFriMorn" /f 1>NUL
schtasks /delete /tn "HostRotateSchoolFriEven" /f 1>NUL
schtasks /delete /tn "HostRotateSummerFriEven" /f 1>NUL
schtasks /delete /tn "HostRotateSchoolFriMornLS" /f 1>NUL
schtasks /delete /tn "HostRotateSummerFriMornLS" /f 1>NUL
schtasks /delete /tn "HostRotateSchoolFriEvenLS" /f 1>NUL
schtasks /delete /tn "HostRotateSummerFriEvenLS" /f 1>NUL
schtasks /delete /tn "HostRotateonlogonLS" /f 1>NUL
schtasks /delete /tn "HostRotateonstartLS" /f 1>NUL

GOTO progstart


:Quit
EXIT


:EXITMSG

ECHO ================================Goodbye==================================
ECHO -------------------------------------------------------------------------
ECHO =========================PRESS ANY KEY TO QUIT===========================

PAUSE>NUL
EXIT
