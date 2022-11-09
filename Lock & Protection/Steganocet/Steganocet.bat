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



@REM # Steganocet
@REM Hide any secret information or files inside an image without anyone knowing.<br>

@REM Copy everything you want to hide inside the `hidefile` folder.

@REM Run `steganocet.bat` file and type the name of the image file in the `image` folder inside which you want to store information (with extension, case sensitive) and press enter.
@REM >Type .jpg instead of .jpeg in image name extension if you are using image of that format.

@REM An identical image with same name and format will be generated with your confidential files.

@REM If you compare both images, you can't differentiate between them. They are similar and identical, but the new one contains everything you wanted to hide. Even the image properties remain same.

@REM No one will ever know that it's not just an ordinary image.
@REM > Note that the image size will increase by some ratio depending on the information you hide.

@REM ## How to access/extract the hidden information?
@REM You can access the information using any zip extractor. The most popular ones are [WinRAR](https://www.win-rar.com/) and [7zip](https://www.7-zip.org/).

@REM Right click on the new image file created and then select **Open with WinRAR** or **Open with 7 zip** or any other zip extracting program on your system.

@REM If you can't find the option then go to your zip extractor program and open the image manually inside it.

::Verified and Tested