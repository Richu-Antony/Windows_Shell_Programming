@echo off

::
:: (c) Elias Bachaalany <lallousz-x86@yahoo.com>
:: Batchography: The Art of Batch Files Programming
::
:: Reveal all saved WiFi passwords Batch file script v1.0 (c) lallouslab.net
:: Inspired by the book "Batchography: The Art of Batch Files Programming"
::
:: Modified version of https://github.com/PassingTheKnowledge/Batchography/blob/master/WifiPasswordReveal.bat
::
:: Dump WiFi SSIDs and Passwords to wifi_networks.txt in AppData
::

SET file_name=%appdata%\wifi_networks.txt

echo. >> %file_name%
echo PC Name: %ComputerName% >> %file_name%
echo --------------------------------------------------------------------- >> %file_name%

setlocal enabledelayedexpansion

:main
    title WiFiPasswordReveal v1.1

    :: Get all the profiles
    call :get-profiles r

    :: For each profile, try to get the password
    :main-next-profile
        for /f "tokens=1* delims=," %%a in ("%r%") do (
            call :get-profile-key "%%a" key
            if "!key!" NEQ "" (
                REM echo WiFi: [%%a] Password: [!key!]
                REM echo WiFi: [%%a] Password: [!key!] >> wifi_networks.txt
                echo SSID: %%a
                echo Key: !key!
                echo.

                echo SSID: %%a >> %file_name%
                echo Key: !key! >> %file_name%
                echo. >> %file_name%

            )
            set r=%%b
        )
        if "%r%" NEQ "" goto main-next-profile

    echo.

    goto :eof

::
:: Get the WiFi key of a given profile
:get-profile-key <1=profile-name> <2=out-profile-key>
    setlocal

    set result=

    FOR /F "usebackq tokens=2 delims=:" %%a in (
        `netsh wlan show profile name^="%~1" key^=clear ^| findstr /C:"Key Content"`) DO (
        set result=%%a
        set result=!result:~1!
    )
    (
        endlocal
        set %2=%result%
    )

    goto :eof

::
:: Get all network profiles (comma separated) into the result result-variable
:get-profiles <1=result-variable>
    setlocal

    set result=

   
    FOR /F "usebackq tokens=2 delims=:" %%a in (
        `netsh wlan show profiles ^| findstr /C:"All User Profile"`) DO (
        set val=%%a
        set val=!val:~1!

        set result=%!val!,!result!
    )
    (
        endlocal
        set %1=%result:~0,-1%
    )

goto :eof
