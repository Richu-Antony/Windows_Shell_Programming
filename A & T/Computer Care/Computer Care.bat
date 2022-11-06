@echo off 
@REM mode con cols=50 lines=50
title Computer Care V2.11.22

cls

:CCare
  echo.
  echo Copyright(C) 2022 By Rica Inc.
  echo #
  echo  Tool        : Computer Care V2.11.22                                 
  echo  Author      : Richu Antony                                 
  echo  Description : Computer Care with toolkit               
  echo #
  echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
  echo.
  echo.

  echo 1. Clean Junk file
  echo 2. Disk Format
  echo 3. File Search
  echo 4. Disk Optimization
  echo 5. Fix logical error and Repair disk bad sector
  echo 6. Data Delete permanetly Data cannot be RECOVERED
  echo.                                                      
  echo 7. Background process            8. System Information
  echo 9. Protect File and Folder       10. Data Recovery
  echo 11. Computer Activity View       12. Create Hostpot in your Computer
  echo 13. Create Bootable pendrive     14. Test Internet Speed
  echo 15. View USB Activity            16. Clean RAM
  echo 17. More Options
  echo h. Help
  echo 0. Exit
  echo.
  echo.
  set /p var="What you want chosse => " 
  echo.

  if %var% == 1 goto Clean_junk
  if %var% == 2 goto Disk_format
  if %var% == 3 goto File_search
  if %var% == 4 goto Disk_optimization
  if %var% == 5 goto Repair_disk
  if %var% == 6 goto Delete_data_permanetly
  if %var% == 7 goto Background_process 
  if %var% == 8 goto System_Info
  if %var% == 9 goto Protect_File_Folder 
  if %var% == 10 goto Data_Recovery
  if %var% == 11 goto Activity_View
  if %var% == 12 goto Hostpot
  if %var% == 13 goto Bootable_pendrive
  if %var% == 14 goto Internet_speed
  if %var% == 15 goto USB_activity
  if %var% == 16 goto Clean_ram
  if %var% == 17 goto More_options
  if %var% == h goto Main_help
  if %var% == H goto Main_help
  if %var% == 0 goto Exit
  cls
  goto CCare


:Clean_junk
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
  echo.
  pause
  cls
  goto CCare


:Disk_format
  set /p disk="Enter Drive letter =>"
  format /q /x %disk%:
  echo.
  pause
  cls
  goto CCare


:File_search
  cls
  echo.
  echo   Press [1] to Search...
  echo   Write [2] to Help...
  echo   Write [3] to Back...
  echo.
  set /p n="What you want chosse => "
  if %n% == 1 goto f_specific
  if %n% == 2 goto f_help
  if %n% == 3 goto f_back
  pause

  :f_specific
    echo.
    set /p drive="Enter drive letter => "
    echo.
    set /p file="Enter file or folder name => "
    where /r %drive%: *%file%*
    echo.
    pause
    goto File_search

  :f_help
    echo.
    echo First you have to type the drive letter in the drive that will search the file and After that you have to give the file or folder name..
    echo.
    echo Example :-
    echo          Enter drive letter = D
    echo          Enter file or folder name = help.txt or .txt
    echo.            
    pause
    cls
    goto File_search

  :f_back
    cls
    goto CCare


:Disk_optimization
  echo.
  set /p disk3="Enter drive letter => "
  defrag %disk3%: /u
  pause
  cls
  goto CCare


:Repair_disk
  echo.
  set /p disk2="Enter dirve letter => "
  chkdsk /f /r %disk2%:
  echo.
  pause
  cls
  goto CCare


:Delete_data_permanetly
  cls
  echo.
  echo Warning!!!
  echo.
  echo Data cannot be RECOVERED###...
  echo.
  set /p disk4="Enter drive letter => "
  echo.
  set /p disk5="Enter file system => "
  echo.
  format %disk4%: /fs:%disk5% /p:1
  echo.
  pause
  cls
  goto CCare


:Background_process
  cls
  netstat -ao
  netstat -f
  echo.
  pause
  cls
  goto CCare

  
:System_Info
  echo.
  systeminfo
  echo.
  pause
  cls 
  goto CCare

:Protect_File_Folder
  cls
  echo  Press [1] ON File or Folder Protection...
  echo  Press [2] OFF File or Folder Protection...
  echo  Press [3] to Back...
  echo.
  set /p x="What you want chosse => "
  if %x% == 1 goto P_protect
  if %x% == 2 goto P_unprotect
  if %x% == 3 goto P_back
  cls

  :P_protect
    echo. 
    set /p file="Enter drive letter => "
    echo.
    set /p file2="Enter File or Folder name => "
    %file%:
    cacls "%file2%" /p everyone:n
    pause
    cls
    goto Protect_File_Folder

  :P_unprotect
    echo.
    set /p file="Enter drive letter => "
    echo.
    set /p file2="Enter File or Folder name => "
    %file%:
    cacls "%file2%" /p everyone:f
    pause
    cls
    goto Protect_File_Folder

  :P_back
    cls
    goto CCare


:Data_Recovery
cd "Data Recover"
START DataRecover.exe
  echo.
  pause
  cls
  goto CCare


:Activity_View
cd "Computer Activity"
START ComputerActivity.exe
  echo.
  pause
  cls
  goto CCare


:Hostpot
  cls
  echo.
  echo  Press [1] On Hostpot...
  echo  Press [2] OFF Hostpot...
  echo  Press [3] to Help...
  echo  Press [4] to Back...
  echo.
  set /p a="What Want do Chosse => "
  if %a% == 1 goto hostpot_on
  if %a% == 2 goto hostpot_off
  if %a% == 3 goto hotspot_help
  if %a% == 4 goto hostpot_back

  :hostpot_on
    echo.
    set /p net="Enter SSID => "
    echo.
    set /p net2="Enter Password => "
    netsh wlan set hostednetwork mode=allow ssid="%net%" key="%net2%"
    netsh wlan start hostednetwork
    pause
    cls
    goto Hostpot

  :hostpot_off
    netsh wlan stop hostednetwork
    pause
    cls
    goto Hostpot

  :hotspot_help
    echo.
    echo Must be run the Run as administrator
    echo.
    echo.
    echo First you need to use it to check if your computer has facility to Open cmd and type it :- netsh wlan show driver 
    echo.
    echo Hosted Network Supported : Yes If Yes then you can use this feature and
    echo.
    echo Hosted Supported : No If no then wifi adapter needs to be upgraded...
    echo. 
    pause
    cls
    goto Hostpot

  :hostpot_back
    cls
    goto CCare


:Bootable_pendrive 
cd "Bootable pendrive"
START rufus.exe
  echo.
  pause
  cls
  goto CCare


:Internet_speed
cd SpeedTest
START speedtest.exe
  echo.
  pause
  cls
  goto CCare

  
:USB_activity
cd Usb 
START USBDeview.exe 
  echo.
  pause
  cls
  goto CCare


:Clean_ram
cd RAM_C
START RAMMap.exe
  echo.
  pause
  cls
  goto CCare


:More_options
  cls
  echo.
  echo  16. Create virtual drive
  echo  17. Comprase Image Size
  echo  18. Image to pdf Convert
  echo  B.  Back
  echo.

  set /p more="What you want chosse => "
  echo.
  if %more% == 16 goto More_virtual
  if %more% == 17 goto More_size
  if %more% == 18 goto More_pdf
  if %more% == b goto More_ack
  echo.
  goto CCare

  :More_virtual
    cls
    echo.
    echo.
    echo Create Folder to virtual Dirve
    echo [1] to Creat virtual drive..
    echo [2] to Delete virtual drive..
    echo [3] to Back...
    echo.
    set /p drive="What you want choose => "
    if %drive% == 1 goto mv_create
    if %drive% == 2 goto mv_delete
    if %drive% == 3 goto mv_back
    goto More_virtual

    :mv_create
      echo.
      set /p dev="Enter the drive Letter => "
      echo.
      set /p dev1="Enter the folder full path => "
      subst %dev%: "%dev1%"
      echo.
      pause
      goto More_virtual

    :mv_delete
      echo.
      set /p dev2="Enter the drive Letter => "
      subst %dev2%: /d
      echo.
      pause
      goto More_virtual

    :mv_back
      goto More_options

  :More_size
    cls
    echo.
    echo  1.56 MB Image Comprase:
    echo.
    echo  "5%% = 151 KB | 10%% = 214 KB | 20%% = 332 KB | 30%% = 450 KB | 40%% = 565 KB | 50%% = 668 KB"
    echo.  
    echo  "60%% = 790 KB | 70%% = 0.98 MB | 80%% = 1.32 MB | 90%% = 1.87 MB | 100%% = 5.27 MB"        
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
    goto More_options
  
  :More_pdf
    cls
    echo.
    echo Image to PDF Convert
    echo.
    set /p pdf="Enter First File path : "
    echo.
    echo Single Image to pdf convert: image_name.jpg / All Images to pdf conver : *.jpg 
    echo.
    set /p pdf2="Enter File Name: "
    echo.
    set /p pdf3="Enter Output File name : "
    echo.
    magick "%pdf%\%pdf2%" "%pdf%\%pdf3%.pdf"
    echo.
    pause
    goto More_options

  :More_ack
    cls
    goto CCare

 
:Main_help
  cls
  echo.
  echo.
  echo   #     #   #######   #          #########    
  echo   #     #   #         #          #       #
  echo   #     #   #         #          #       #
  echo   #######   #######   #          #########
  echo   #     #   #         #          #
  echo   #     #   #         #          #
  echo   #     #   #######   #########  #   
  echo.
  echo  This application will must be run the Run as administrator
  echo.
  echo  But when recovering data,viewing computer activity,Create Bootable pendrive, 
  echo.
  echo  View USB Activity, Create vritual drive and Clean RAM Thear is no need to run as administrator for them.
  echo. 
  echo  Thank You For Download :)
  echo.
  pause
  cls
  goto CCare

:Exit
  exit /b

::Verified and Tested