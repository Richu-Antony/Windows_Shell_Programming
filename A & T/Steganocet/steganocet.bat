:: Copyright 2021 Ayush Shah

:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at

:: http://www.apache.org/licenses/LICENSE-2.0

@echo off
title Steganocet
mode con: cols=100 lines=30
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
