:: Script to delete all creadentials from credential manager

:: Uncomment the below commands to delete all creadentials from credential manager
:: --------------------------------------------------------------------------------

TIMEOUT /T 120
CMDKEY.exe /list > "%TEMP%\List.txt"
FINDSTR.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO CMDKEY.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

pause