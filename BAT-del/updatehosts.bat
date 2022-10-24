:: updatehosts.bat
:: Michael McMahon
:: This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on Windows systems.
 
:: MUST BE RUN WITH ADMIN CMD
 
@ECHO OFF

:: Copy a file and append the date.  Then, delete the history.
set backupFilename=_%date:~-4,4%%date:~-10,2%%date:~-7,2%-%time:~-10,1%%time:~-8,2%
copy "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\History" "C:\hosts\history%backupFilename%" && del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\History"
:: Formatting from https://community.tableau.com/thread/172730
:: Formatting from Bernhard Hofmann on http://stackoverflow.com/questions/864718/how-to-append-a-date-in-batch-files

:: Delete Chrome history and cache
rmdir /s /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Local Storage"
rmdir /s /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Cache"

:: Delete Chrome history and cache
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Cookies"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Cookies-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Current Session"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Current Tabs"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\History-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Login Data"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Login Data-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Network Action Predictor"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Network Action Predictor-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Network Presistent State"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Origin Bound Certs"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Origin Bound Certs-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\QuotaManager"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\QuotaManager-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Top Sites"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Top Sites-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\TransportSecurity"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Visited Links"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Web Data"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\Web Data-journal"
del /s /f /q "C:\Users\bluehill\AppData\Local\Google\Chrome\User Data\Default\History Provider Cache"

:: Create a directory on disk.
if not exist C:\hosts mkdir C:\hosts
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFwinLS.txt'; $path = 'c:\hosts\HOSTSFwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 
powershell "$url = 'https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRwinLS.txt'; $path = 'c:\hosts\HOSTSMTWRwinLS.txt'; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = new-object System.Net.WebClient; $webClient.DownloadFile( $url, $path )" 
:: Formatting from http://blog.gpunktschmitz.com/504-powershell-download-file-from-server-via-https-which-has-a-self-signed-certificate
 
:: This copies the hosts file depending on the day
setlocal 
for /f "delims=" %%a in ('wmic path win32_localtime get dayofweek /format:list ') do for /f "delims=" %%d in ("%%a") do set %%d 
IF %dayofweek%==5 (copy /Y C:\hosts\HOSTSFwinLS.txt C:\windows\system32\drivers\etc\hosts) ELSE (copy /Y C:\hosts\HOSTSMTWRwinLS.txt C:\windows\system32\drivers\etc\hosts) 
endlocal 
:: Formatting from http://stackoverflow.com/questions/11364147/setting-a-windows-batch-file-variable-to-the-day-of-the-week 
