:: This batch script will print the SID (Security Identifier) for all Accounts.

WMIC useraccount get name,sid
pause