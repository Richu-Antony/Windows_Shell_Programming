@echo off
Title Logging Info...
color 17
mode con:cols=125 lines=40
goto menu
:menu
echo Please choose one of the following:
echo 1 Running Task List
echo 2 System Information
echo 3 Ipconfig Settings
echo 4 Wireless Network Drivers
echo 5 Wired Network Settings
echo 6 Current Power Settings
echo 7 Current Computer Drivers
echo 8 Move All Logs To a Folder on The Desktop
echo 9 Log a Directory of all current files
echo 10 Log a Tree of all current files
echo 11 Quit

:choice
set /P C=[1,2,3,4,5,6,7,8,9,10,11]?
if '%C%' == '1' goto task
if '%C%' == '2' goto sys
if '%C%' == '3' goto ip
if '%C%' == '4' goto net
if '%C%' == '5' goto wire
if '%C%' == '6' goto power
if '%C%' == '7' goto driver
if '%C%' == '8' goto folder
if '%C%' == '9' goto dir
if '%C%' == '10' goto tree
if '%C%' == '11' goto end
echo Please Choose A Valid Option
goto choice

:task
cmd /c tasklist > %userprofile%\desktop\Tasks.txt
echo Logs has been save on your desktop as Task.txt
Pause
cls
goto menu

:sys
cmd /c systeminfo > %userprofile%\desktop\SysInfo.txt
echo Logs has been save on your desktop as SysInfo.txt
Pause
cls
goto menu

:ip
cmd /c ipconfig /allcompartments /all > %userprofile%\desktop\IPsettings.txt
echo Logs has been save on your desktop as IPsettings.txt
Pause
cls
goto menu

:net
cmd /c netsh wlan show drivers > %userprofile%\desktop\Wirelessdrivers.txt
echo Logs has been save on your desktop as Wirelessdrivers.txt
Pause
cls
goto menu

:wire
cmd /c netsh lan dump > %userprofile%\desktop\Lanconfig.txt
echo Logs has been save on your desktop as Lanconfig.txt
Pause
cls
goto menu

:power
cmd /c powercfg -q > %userprofile%\desktop\PowerSettings.txt
echo Logs has been save on your desktop as PowerSettings.txt
Pause
cls
goto menu

:driver
cmd /c driverquery > %userprofile%\desktop\WindowsDrivers.txt
echo Logs has been save on your desktop as WindowsDrivers.txt
Pause
cls
goto menu

:folder
md "%userprofile%\desktop\Log Files"
cd %userprofile%\desktop\
for %%F in (*.txt) do move /-y %userprofile%\desktop\"%%F" "%userprofile%\desktop\Log Files"
goto menu

:dir
cmd /c dir C:\ /s > %userprofile%\desktop\Directory.txt
goto menu

:tree
cmd /c tree /f /a C:\ > %userprofile%\desktop\Tree.txt
goto menu

:end
exit
