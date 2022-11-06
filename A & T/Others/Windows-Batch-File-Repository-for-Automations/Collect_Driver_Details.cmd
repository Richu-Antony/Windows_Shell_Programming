@echo off
rem -----------------------------------------------------------------------------------------------------
rem - 			Logmein Rescue Sample Scripts							-
rem - 			Detailed System Drivers information						-
rem -													-
rem - 		This script will upload a small script command file,					-
rem -	 	analize device drivers on the customer's PC, and will relay information 		-
rem -		back to the Chat area. Result output can be very long and detailed.			-
rem -----------------------------------------------------------------------------------------------------


echo STARTING DRIVER QUERY, PLEASE WAIT:
echo --------------------------------------------
driverquery /v /FO LIST
echo --------------------------------------------

exit

rem -----------------------------------------------------------------------------------------------------
rem -				Copyright (C) 2003-2007 LogMeIn, Inc. US patents pending.		-
rem -			This script can be re-distributed for demonstration purposes only.		-
rem -		Use of this script is subject to general Logmein Terms and Conditions found here:	-
rem -				https://secure.logmein.com/termsandconditions.asp			-
rem -----------------------------------------------------------------------------------------------------