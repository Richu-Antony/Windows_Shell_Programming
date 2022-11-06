@echo off
rem By DUORL PRODUCTION
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
@setlocal enableextensions
@cd /d "%~dp0"

color 0a 
title Network Info Tool V1.0

:re-run
:: Information About The Product
echo -----------------------------------------------------------
echo / Tool : Network Info Tool V1.0                           \
echo \ Version : 1.0                                           /  
echo / Author : Richu Antony                                   \
echo \ Description : Network Information                       /
echo / GitHub : https://www.github.com/Richu-Antony            \
echo -----------------------------------------------------------
echo.

:: Main Code Start Here - Do not edit the code unless you don't know it

echo ---------------------------------------------------------------
echo --     1 -  Show all Networks names                          --
echo --     2 -  Show Password of Specific Network                --
echo --     3 -  Show Wireless Adapter Settings                   --
echo --     4 -  Export Network Profiles (All or Specific)        --
echo --     5 -  Import Network Profiles (Exports or Specific)    --
echo --     6 -  Connect to a Network (Beta)                      --
echo --     7 -  Update WinNet Tool                               --
echo --     8 -  About The Tool                                   --
echo --     9 -  Exit The Program                                 --
echo ---------------------------------------------------------------
echo.

REM set choice=9
set /p choice="Enter The Choice: "
echo.
if %choice%==1 goto All_network_names
if %choice%==2 goto Password_of_specific_network
if %choice%==3 goto Wireless_adapter_settings
if %choice%==4 goto Export_network_profiles
if %choice%==5 goto Import_network_profiles
if %choice%==6 goto Connect_to_a_network
if %choice%==7 goto Update_WinNet_Tool
if %choice%==8 goto About_the_tool 
if %choice%==9 || %choice%>9 || %choice%!=9 goto eof

:All_network_names
    rem 1. Show all Networks names 
    netsh wlan show profiles
    echo. 
    pause
    cls
    goto re-run

:Password_of_specific_network
    rem 2. Show Password of Specific Network 
    echo.
    set /p n="Enter the Network Name: "
    echo Network : %n%
    netsh wlan show profile %n% key=clear | findstr "Key Content"
    echo.
    pause
    cls
    goto re-run

:Wireless_adapter_settings
    rem 3. Show Wireless Adapter Settings  
    netsh wlan show interfaces
    echo.
    pause
    cls
    goto re-run

:Export_network_profiles
    rem  4. Export Network Profiles (All or Specific)
    set /p ex="All or Specific (a/s) : "
    if %ex%==a (echo Exporting All Network Including Passwords ........ && goto all)
    if %ex%==s (goto specific)

    :all
    if exist mkdir All_Networks_Passwords goto this
    mkdir All_Networks_Passwords

    :this
    netsh wlan export profile key=clear folder=All_Networks_Passwords
    goto end

    :specific
    set /p exn="Name : "
    netsh wlan export profile name=%exn% key=clear folder=All_Networks_Passwords

    :end
    echo.
    pause
    cls
    goto re-run

:Import_network_profiles
    rem 5. Import Network Profiles (Exports or Specific)
    set /p iprt="Specific or From All_Networks_Passwords/ (s/e) : "
    if %iprt%==e (goto exports)
    if %iprt%==s (goto specific)

    :exports
    netsh wlan add profile filename=All_Networks_Passwords/Wi-Fi-*
    goto end

    :specific
    set /p fn="File Location/Name : "
    netsh wlan add profile filename=%fn%

    :end
    echo.
    pause
    cls
    goto re-run

:Connect_to_a_network
    rem 6. Connect to The Network (Beta)
    echo.
    set /p ssid="Name : "
    set ./p pwd="Password : "
    netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%pwd%
    echo.
    pause
    cls
    goto re-run

:Update_WinNet_Tool
    rem 7. Update WinNet Tool
    echo.
    powershell -Command Invoke-WebRequest https://github.com/Richu-Antony/Richus-Automation-Program/archive/refs/heads/main.zip -OutFile C:\Users\%USERNAME%\Downloads\WinNet.zip
    echo Download Successfull..
    pause
    cls
    goto re-run

:About_the_tool
    rem 8. About The Tool
    echo.
    echo  ----------------------------------------------------
    echo [ Tool : WinNet                                      ]
    echo [ Version : 1                                        ]
    echo [ Creator : Richu Antony                             ]
    echo [ GitHub :  https://www.github.com/Richu-Antony      ]
    echo  ----------------------------------------------------
    echo.
    pause
    cls
    goto re-run

:eof 
    rem 9. Exit The Program   
    exit