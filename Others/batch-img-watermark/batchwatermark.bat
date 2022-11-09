@echo off
:start
type splash.txt
set /p Location="Enter address of images: "
set /p Outputs="Enter address for the new images: "
set /p Watermark="Enter watermark address with filename (and filetype): "
cls
echo Found %Location%!
echo Found %Outputs%!
echo Please wait for batch generation...
magick mogrify -path "%Outputs%" -format jpg -gravity southeast -draw "image over 50,50,0,0 '%Watermark%'" "%Location%/*"
set /p Opera="Redo operation? (Y/N): "
if /I %Opera%== Y goto start
if /I not %Opera%== Y exit
pause
echo byeee
pause