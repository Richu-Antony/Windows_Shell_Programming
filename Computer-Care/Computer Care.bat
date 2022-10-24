
    :: Version - 1.2
    ::Founder - Anindya Ghoshal
    :: Copyright aoneTech.

@echo off 
cls
  title Command Prompt - By Computer
ver
echo.
echo  (C) Copyright aoneTech.
echo.
echo  Founder - Anindya Ghoshal
echo.
:Care
color 70
echo                                            ########################### 
echo                                            #                         #     
echo                                            #   [=Computer Care=]     #   
echo                                            #                         #
echo                                            ###########################
echo.
echo  Press [1] to Clean Junk file                                                  Press [10] to DtatRecover                                              
echo.                                                                                                     
echo  Press [2] to disk Format                                                      Press [11] to Computer Activity View                                                                                   
echo. 
echo  Press [3] to File Search                                                      Press [12] to Create Hostpot in your Computer                                                                                                   
echo.
echo  Press [4] to disk Optimization                                                Press [13] to Create Bootable pendrive                                                                                                     
echo.
echo  Press [5] to Fix logical error [and] Repair disk bad sector                   Press [14] to Test Internet Speed                           
echo.
echo  Press [6] to Data Delete permanetly [Data cannot be RECOVERED]                Press [15] to View USB Activity                                         
echo.      
echo  Press [7] to Background process                                               Press [m] to More Options                                                                                 
echo.
echo  Press [8] to System Information                                               Press [h] to Help / Press [e] to Exit                                                                                                                                  
echo.
echo  Press [9] Protect File and Foleder                                          
echo. 
set /p var="What you want chosse => " 
echo.
if %var% == 1 goto a 
if %var% == 2 goto b
if %var% == 3 goto c
if %var% == 4 goto d
if %var% == 5 goto e
if %var% == 6 goto f
if %var% == 7 goto g
if %var% == 8 goto h
if %var% == 9 goto i
if %var% == 10 goto j
if %var% == 11 goto k
if %var% == 12 goto l
if %var% == 13 goto m 
if %var% == 14 goto n
if %var% == 15 goto p
if %var% == m goto q
if %var% == M goto q
if %var% == h goto mainhelp
if %var% == e goto exit
cls
goto Care
:a
echo.  
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q c:\windows\prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windwos\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\temp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del c:\WIN386.SWP
cls
echo.
pause
cls
goto Care

:b
echo.
set /p disk="Enter Drive letter =>"
format /q /x %disk%:
echo.
echo.
pause
cls
goto Care

:c
:go
cls
echo.
echo   Press [1] to Search...
echo.
echo   Write [2] to Help...
echo.
echo   Write [3] to Back...
echo.
set /p n="What you want chosse => "
if %n% == 1 goto a
if %n% == 2 goto help
if %n% == 3 goto back
pause
:a
echo.
set /p drive="Enter drive letter =>"
echo.
set /p file="Enter file or folder name =>"
where /r %drive%: *%file%*
echo.
pause
goto go
:help
echo.
echo  First you have to type the drive letter in the drive that will search the file and
echo.
echo  After that you have to give the file or folder name..
echo.
echo Example :-
echo                        Enter drive letter = D
echo                        Enter file or folder name = help.txt or .txt
echo.            
pause
cls
goto go
:back
cls
goto Care

:d
echo.
set /p disk3="Enter drive letter =>"
defrag %disk3%: /u
pause
cls
goto Care
exit /d

:e
echo.
set /p disk2="Enter dirve letter =>"
chkdsk /f /r %disk2%:
echo.
pause
cls
goto Care

:f
cls
echo.
echo        Warning!!!
echo.
echo  Data cannot be RECOVERED###...
echo.
set /p disk4="Enter drive letter =>"
echo.
set /p disk5="Enter file system =>"
echo.
format %disk4%: /fs:%disk5% /p:1
cls
pause
goto Care
:g
netstat -ao
netstat -f
pause
cls
goto Care
:h
echo.
systeminfo
echo.
pause
cls 
goto Care

:i
:prot
cls
echo  Press [1] ON File or Folder Protection...
echo.
echo  Press [2] OFF File or Folder Protection...
echo. 
echo  Press [3] to Back...
echo.
set /p x="What you want chosse => "
if %x% == 1 goto on
if %x% == 2 goto off
if %x% == 3 goto back
cls

:on
echo. 
set /p file="Enter drive letter =>"
echo.
set /p file2="Enter File or Folder name =>"
%file%:
cacls "%file2%" /p everyone:n
pause
cls
goto prot  
:off
echo.
set /p file="Enter drive letter =>"
echo.
set /p file2="Enter File or Folder name =>"
%file%:
cacls "%file2%" /p everyone:f
pause
cls
goto prot
:back
cls
goto Care
:j
cd DataRecover
START DataRecover.exe
echo.
pause
exit

:k
cd ComputerActivity
START ComputerActivity.exe
echo.
pause
exit

:l
cls
:HOST
echo.
echo  Press [1] On Hostpot...
echo.
echo  Press [2] OFF Hostpot...
echo.
echo  Press [3] to Help...
echo.
echo  Press [4] to Back...
echo.
set /p a="What Want do Chosse =>"
if %a% == 1 goto on
if %a% == 2 goto off
if %a% == 3 goto he
if %a% == 4 goto e
:on
echo.
set /p net="Enter SSID => "
echo.
set /p net2="Enter Password => "
netsh wlan set hostednetwork mode=allow ssid="%net%" key="%net2%"
netsh wlan start hostednetwork
pause
cls
goto HOST
:off
netsh wlan stop hostednetwork
pause
cls
goto HOST
:he
echo.
echo                           [Must be run the Run as administrator]
echo.
echo.
echo   First you need to use it to check if your computer has facility to Open cmd and type it :- netsh wlan show driver 
echo.
echo   [Hosted Network Supported : Yes] If Yes then you can use this feature and
echo.
echo   [Hosted Supported : No] If no then wifi adapter needs to be upgraded...
echo. 
pause
cls
goto HOST
:e
cls
goto Care

:n
cd speedtest
START speedtest.exe
echo.
pause
exit /b

:m 
cd Bootable pendrive
START rufus.exe
echo.
pause 
exit

:p
cd usb 
START USBDeview.exe 
echo.
pause
exit /b

::More

:q
cls
:main

cls
echo.
echo  Prees [16] to Create virtual drive
echo.
echo  Press [17] to Clean RAM
echo.
echo  Press [18] to Comprase Imagee Size
echo.
echo  Press [19] to Image to pdf Convert
echo.
echo  Press [b] to Back
echo.

set /p more="What you want chosse => "
echo.
if %more% == 16 goto virtual
if %more% == 17 goto ram
if %more% == 18 goto size
if %more% == 19 goto pdf
if %more% == b goto ack
echo.
goto q
:virtual
cls
:vir
cls
echo.
echo.
echo       [ Create Folder to virtual Dirve ]
echo.
echo.
echo Press [1] to Creat virtual drive..
echo.
echo Press [2] to Delete virtual drive..
echo.
echo Press [3] to Back...
echo.
set /p drive="What you want choose => "
if %drive% == 1 goto create
if %drive% == 2 goto delete
if %drive% == 3 goto back
goto vir
:create
echo.
set /p dev="Enter the drive Letter => "
echo.
set /p dev1="Enter the folder full path => "
subst %dev%: "%dev1%"
echo.
pause
goto vir

:delete
echo.
set /p dev2="Enter the drive Letter => "
subst %dev2%: /d
echo.
pause
goto vir

:Back
goto q

:ram
cd RAM_C
START RAMMap.exe
echo.
pause
exit 

:size
cls
echo.
echo   1.56 MB Image Comprase:
echo.
echo   "5%% = 151 KB | 10%% = 214 KB | 20%% = 332 KB | 30%% = 450 KB | 40%% = 565 KB | 50%% = 668 KB"
echo.  
echo   "60%% = 790 KB | 70%% = 0.98 MB | 80%% = 1.32 MB | 90%% = 1.87 MB | 100%% = 5.27 MB"        
echo.
set /p size="Enter image first file path: "
echo.
set /p size2="Enter Image Comprase Percentage (%%): "
echo.
set /p size3="Enter image name (image.png): "
echo.
set /p size4="Enter output iamge name: "
magick convert -strip -interlace plane -gaussian-blur 0.05 -quality %size2% "%size%\%size3%" "%size%\%size4%" 
echo.
pause
goto main

:pdf
cls
echo.
echo        Image to PDF Convert
echo.
set /p pdf="Enter First File path :"
echo.
echo Single Image to pdf convert: image_name.jpg / All Images to pdf conver : *.jpg 
echo.
set /p pdf2="Enter File Name:"
echo.
set /p pdf3="Enter Output File name : "
echo.
magick "%pdf%\%pdf2%" "%pdf%\%pdf3%.pdf"
pause
goto main

:ack
cls
goto Care
 
:mainhelp
cls
echo.
echo.

echo            #     #   #######   #          #########    
echo            #     #   #         #          #       #
echo            #     #   #         #          #       #
echo            #######   #######   #          #########
echo            #     #   #         #          #
echo            #     #   #         #          #
echo            #     #   #######   #########  #   


echo.
echo  [This application will must be run the Run as administrator]
echo.
echo    But when recovering data,viewing computer activity,Create Bootable pendrive, 
echo.
echo    View USB Activity, Create vritual drive and Clean RAM Thear is no need to run as administrator for them.
echo. 
echo      Thank You For Download :)
echo.
pause
cls
goto Care
:exit
exit /b







