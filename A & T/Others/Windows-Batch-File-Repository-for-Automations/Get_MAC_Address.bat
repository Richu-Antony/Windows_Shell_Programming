@echo off
rem -----------------------------------------------------------------------------------------------------
rem - 			Logmein Rescue Sample Scripts							-
rem - 				MAC Address list							-
rem -													-
rem - 		This script will upload a small script command file,					-
rem - 	investigate local network adapters, and will relay information 					-
rem -	back to the Chat area about Network Adapters and their MAC addresses.				-
rem -----------------------------------------------------------------------------------------------------

echo PREPARING INSTALLED NETWORK ADAPTERS LIST:
echo --------------------------------------------

getmac /FO LIST /v

echo --------------------------------------------

exit

rem -----------------------------------------------------------------------------------------------------
rem -				Copyright (C) 2003-2007 LogMeIn, Inc. US patents pending.		-
rem -			This script can be re-distributed for demonstration purposes only.		-
rem -		Use of this script is subject to general Logmein Terms and Conditions found here:	-
rem -				https://secure.logmein.com/termsandconditions.asp			-
rem -----------------------------------------------------------------------------------------------------

pause