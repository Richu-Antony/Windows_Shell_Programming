@echo off
@REM mode con cols=50 lines=50
title Steganocet V6.11.22

:: Green
color A 

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Steganocet V6.11.22                          
echo  Author      : Richu Antony                                 
echo  Description : Steganocet       
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.


echo.
echo What is the name of the image file inside the image folder in which you want to hide information?
echo e.g. cool_sunset.png  cake.jpg (typing image extension is important)
echo.
echo There should be no spaces in the name of image file.
echo e.g. cool image.jpg  aesthetic photo.png type of names are not allowed.
echo.
set /p imgfile=">> "
CScript zip.vbs hidefile confidential.zip
copy /b .\image\%imgfile%+confidential.zip %imgfile%
del /f/Q confidential.zip

::Verified and Tested