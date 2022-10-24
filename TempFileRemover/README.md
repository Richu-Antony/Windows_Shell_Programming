### About 
TempFileRemover Will help you remove temp files in your pc.If you want to make your own version then check out <a href="https://github.com/shourgamer2/TempFileRemover#copyright">Copyright</a> , <a href="https://github.com/shourgamer2/TempFileRemover#how-to-see-the-code">How to see the code </a> and <a href="https://github.com/shourgamer2/TempFileRemover#modify">Modify</a>
### Download
<a href="https://github.com/shourgamer2/TempFileRemover/releases/download/ver1.1.0/TempFileDeleter.bat">Download</a> <br>
Run the batch file as administrator  <br>
![image](https://user-images.githubusercontent.com/90188229/155931898-04e7e5bf-b9ba-45c6-b158-927a6f1ef9b0.png) <br>
Click yes in the prompt <br>
It should open  <br>
After a few seconds the temp files will be removed<br>
![image](https://user-images.githubusercontent.com/90188229/155932065-177d5c4b-0362-4ee3-85fb-385256dfd6ba.png)
### How to see the code
To modify right click and click edit <br>
![image](https://user-images.githubusercontent.com/90188229/155932452-e48fc8ec-1be1-4e13-87a7-3b55e65c591c.png)
it should open in notepad <br>
![image](https://user-images.githubusercontent.com/90188229/155932521-ea8ff701-7f60-46a1-a350-56d9ef89c946.png)
### Modify
**Modify the color of the text**
```batch
@echo off
color 3
```
 0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White  <br>
 **Modify the app version**
```batch
echo version 1.1.0
```
**modify the app repo**
```batch 
echo please visit our repo https://www.github.com/shourgamer2/TempFileRemover
start https://www.github.com/shourgamer2/TempFileRemover
```
**modify the title,the text at the start and the main code**
```batch
echo Temp File deleter
title Temp File deleter
cd /D %temp%
for /d %%D in (*) do rd /s /q "%%D"
del /f /q *
echo Temp Files Have Been Deleted
```
### Copyright
  Copyright (c) 2022 Shourjjo Majumder
If you copy this app please mention my github profile and repo.
