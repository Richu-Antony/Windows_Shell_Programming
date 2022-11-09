@echo off
echo off
color 17
title Network Investigator v1.0	
REM ***************************************
REM ** NW Investigator v1.0				      	
REM ** Revised by Jeffrey Cayao   
REM ** contact: 		              
REM *************************************** 
REM ** UPDATED FOR SEADRILL NETWORK by Patrik Kollar
REM ** ChangeLog: v1.1 - May/2016
REM ** 1. Updated Yes/No to accept any Inputs similar to yes/no (yes,YES,Yes,y,Y / no,NO,No,n,N)
REM ** 2. User input on Top. Only first part possible (repetitions are still down at bottom) 
REM ** 3. Preparations for additional functionality   (Jump created not active Yet )
REM ** 4. AudioAlert prepared for use (Code added commented)
REM ** 5. ChangeLog added to keep track of changes and updates
REM ***************************************
REM ** ChangeLog: v1.2 - Jun/2016
REM ** 1. Added Wireless section 
REM ** 2. Commented Windows 10 Wireless report
REM ** 3. Status Report Echo added 
REM ** 4. Clean up of unnecessary code
REM ***************************************
mode con:cols=125 lines=40
cls

echo:
echo Please enter problematic destination IP, server name or URL.
echo e.g. your mail server, file server, intranet/internet web page.
echo if entering URL, please enter without 'http://' e.g. google.com 
set /p host="destination url/ip/server:"
echo:
cls
echo Script is gathering necessary information. 
echo It will not take more than 10 minutes, please wait...
echo:

echo %date%, %time%: basic check > "%userprofile%\nw_report.txt"
echo: >>"%userprofile%\nw_report.txt"
echo Gathering ip information ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			IPCONFIG >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ipconfig.exe /all >> "%userprofile%\nw_report.txt"
echo: >>"%userprofile%\nw_report.txt"
echo Done

echo Gathering open ports ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			OPEN PORTS >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
netstat.exe /na >> "%userprofile%\nw_report.txt"
echo: >>"%userprofile%\nw_report.txt"
echo Done
 
echo Gathering routing information ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			ROUTING TABLE >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
route.exe print >> "%userprofile%\nw_report.txt"
echo: >>"%userprofile%\nw_report.txt"
echo Done

echo Gathering arp entries ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			ARP >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
arp.exe /a >> "%userprofile%\nw_report.txt"
echo Done

echo Gathering wireless information ... 
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			WIRELESS  >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
netsh wlan show all >> "%userprofile%\nw_report.txt"
echo Done

REM echo Generating wireless connection report ... 
REM #####################################################################################
REM ## WIRELESS REPORT GENERATION AND MOVE TO THE DESTINATION
REM #####################################################################################
REM netsh wlan show wlanreport
REM echo Moving report to Output location ...
REM move /Y C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html %userprofile%
REM rename %userprofile%\wlan-report-latest.html wlan-report.html
REM echo Done

echo Gathering proxy server information ...
echo: >>"%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			PROXY SERVER CURRENT USER >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"


set /a proxyAuto=NUL
set /a proxyManual=NUL
set /a proxyManualEnabled=NUL

@For /f "tokens=3" %%* in (
    'reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<ProxyServer\>"'
) Do @Set "proxyManual=%%*"


@For /f "tokens=3" %%* in (
    'reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<ProxyEnable\>"'
) Do @Set "proxyManualEnabled=%%*"


@For /f "tokens=3" %%* in (
    'reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<AutoConfigURL\>"'
) Do @Set "proxyAuto=%%*"

if not %proxyManual% == 0 (echo Manual configured proxy: %proxyManual% >> "%userprofile%\nw_report.txt")   else (echo Manual configured proxy:  not configured) >> "%userprofile%\nw_report.txt"

echo Manual proxy enabled status %proxyManualEnabled% >> "%userprofile%\nw_report.txt"

if not %proxyAuto% == 0 (echo Automatic configuration script: %proxyAuto% >> "%userprofile%\nw_report.txt") else (echo Automatic configuration script:  not configured) >> "%userprofile%\nw_report.txt"

echo: >>"%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			PROXY SERVER LOCAL MACHINE >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"

set /a proxyAuto=NUL
set /a proxyManual=NUL
set /a proxyManualEnabled=NUL

@For /f "tokens=3" %%* in (
    'reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<ProxyServer\>"'
) Do @Set "proxyManual=%%*"


@For /f "tokens=3" %%* in (
    'reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<ProxyEnable\>"'
) Do @Set "proxyManualEnabled=%%*"


@For /f "tokens=3" %%* in (
    'reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^|findstr 

"\<AutoConfigURL\>"'
) Do @Set "proxyAuto=%%*"

if not %proxyManual% == 0 (echo Manual configured proxy: %proxyManual% >> "%userprofile%\nw_report.txt")   else (echo Manual configured proxy:  not configured) >> "%userprofile%\nw_report.txt"

echo Manual proxy enabled status %proxyManualEnabled% >> "%userprofile%\nw_report.txt"

if not %proxyAuto% == 0 (echo Automatic configuration script: %proxyAuto% >> "%userprofile%\nw_report.txt") else (echo Automatic configuration script:  not configured) >> "%userprofile%\nw_report.txt"

echo Done

echo Testing LAN network ...
@For /f "tokens=3" %%* in (
    'route.exe print ^|findstr "\<0.0.0.0\>"'
) Do @Set "DefaultGateway=%%*"


echo: >>"%userprofile%\nw_report.txt"
echo: >>"%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		PING to DG	 >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
rem echo %date%, %time%: Ping of DG "%DefaultGateway%" >> "%userprofile%\nw_report.txt"
ping -n 30 "%DefaultGateway%" >> "%userprofile%\nw_report.txt"
echo Done

echo Testing network to Internet ...
echo: >>"%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 PING TO Google public DNS >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 30 8.8.8.8 >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 TRACEROUTE TO Google public DNS >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
tracert -w 300 8.8.8.8 >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 PATHPING TO Google public DNS >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
pathping -w 300 -q 100 -p 10 8.8.8.8 >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo Done

echo Testing network to Internal SEADRILL ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 PING TO SEADRILL's Internal via HOSTNAME >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 30 seadrillintranet >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 PING TO SEADRILL's Internal via IP  >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 30 10.150.1.17 >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 TRACEROUTE TO SEADRILL's Internal via HOSTNAME >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
tracert -w 300 seadrillintranet >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 TRACEROUTE TO SEADRILL's Internal via IP>> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
tracert -w 300 10.150.1.17  >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		 PATHPING TO ERICSSON's internal >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
pathping -w 300 -q 100 -p 10 seadrillintranet >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo Done

echo Testing network to problematic destination ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			TEST of PROBLEMATIC URL/IP/SERVER  >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		PING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 30 %host% >> "%userprofile%\nw_report.txt""
echo: >> "%userprofile%\nw_report.txt"

set /a bad=0
for /f "tokens=* delims= " %%i in ('ping %host% ^| find /i "Request timed out" ') do (
set /a bad+= 1 )
if %bad% == 4 (goto pathpingFirstTest)

set /a bad=0
for /f "tokens=* delims= " %%i in ('ping %host% ^| find /i "Destination host unreachable." ') do (
set /a bad+= 1 )
if %bad% == 4 (goto pathpingFirstTest)

echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		BIG PING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 50 -l 1460 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
:pathpingFirstTest
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 	PATHPING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
pathping -w 300 -q 100 -p 10 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 	TRACEROUTE TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt" 
tracert -w 300 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo Done

goto:yesno

:slowness
echo:
echo Please enter problematic destination IP, server name or URL.
echo e.g. your mail server, file server, intranet/internet web page.
echo if entering URL, please enter without 'http://' e.g. google.com 
echo:
set /p host="destination url/ip/server:"
echo: 
echo Testing problematic destination ...
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 			TEST of PROBLEMATIC URL/IP/SERVER  >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		PING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 30 %host% >> "%userprofile%\nw_report.txt""
echo: >> "%userprofile%\nw_report.txt"

set /a bad=0
for /f "tokens=* delims= " %%i in ('ping %host% ^| find /i "Request timed out" ') do (
set /a bad+= 1 )
if %bad% == 4 (goto pathping)

set /a bad=0
for /f "tokens=* delims= " %%i in ('ping %host% ^| find /i "Destination host unreachable." ') do (
set /a bad+= 1 )
if %bad% == 4 (goto pathping)

echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 		BIG PING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
ping -n 50 -l 1460 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
:pathping
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 	PATHPING TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt"
pathping -w 300 -q 100 -p 10 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/>> "%userprofile%\nw_report.txt"
echo 	TRACEROUTE TO SERVER %host% >> "%userprofile%\nw_report.txt"
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/ >> "%userprofile%\nw_report.txt" 
tracert -w 300 %host% >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo: >> "%userprofile%\nw_report.txt"
echo Done

:yesno
rem echo • <---- Cause to sound defaul WINDOWS sound
echo:
echo Would you like test connection to some another server/URL ? 
echo: Note, tests on more servers will help us to clarify problem faster
set /p choise="yes/no:"

:testAgain
if "%choise%"=="yes" goto:slowness
if "%choise%"=="YES" goto:slowness
if "%choise%"=="Yes" goto:slowness
if "%choise%"=="y" goto:slowness
if "%choise%"=="Y" goto:slowness
if "%choise%"=="no" goto:exit
if "%choise%"=="NO" goto:exit
if "%choise%"=="No" goto:exit
if "%choise%"=="n" goto:exit
if "%choise%"=="N" goto:exit

echo Not valid option. Type only "yes" or "no"!
pause
goto:yesno


:exit
cls
echo:
echo Script has finished testing. 
echo Thank you for your patience 
echo:
echo "%userprofile%\nw_report.txt"
REM echo "%userprofile%\wlan-report.html" 
echo: 
%SystemRoot%\explorer.exe "C:\Users\%username%\nw_report.txt" 
echo We will attach this logs to the ticket for reference. 
echo Have a nice day.
echo:
pause

exit






