:: How to run ?
:: Double add your <MachineName>, <Domain\UserName>, <password> below
:: Double click to run this file.

TIMEOUT /T 10 

cmdkey /add:<MachineName> /user:<Domain\UserName> /pass:<password>

:: Example
:: cmdkey /add:MyMachine /user:Domain\root /pass:Superuser

pause