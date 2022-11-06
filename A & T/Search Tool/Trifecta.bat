@echo off
chcp 65001
:trifectastart
cls
title TRIFECTA
color 0b
echo.
echo.
echo 	████████╗██████╗ ██╗███████╗███████╗ ██████╗████████╗ █████╗ 
echo 	╚══██╔══╝██╔══██╗██║██╔════╝██╔════╝██╔════╝╚══██╔══╝██╔══██╗
echo 	   ██║   ██████╔╝██║█████╗  █████╗  ██║        ██║   ███████║
echo 	   ██║   ██╔══██╗██║██╔══╝  ██╔══╝  ██║        ██║   ██╔══██║
echo 	   ██║   ██║  ██║██║██║     ███████╗╚██████╗   ██║   ██║  ██║
echo 	   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝   ╚═╝  ╚═╝
echo.                                                             
echo.
echo.
echo 	TRIFECTA Search Tool by V1XX
echo.
echo.
echo.
echo.
echo 	         XX                                    
echo 	        XX..X                                  
echo 	      XX.....X                                
echo 	 XXXXX.....XX                                  
echo 	X ......XX%,.@                            
echo 	X \.....X  @#%,.@                         
echo 	X  \...X     @#%,.@                     
echo 	 X# \.X        @#%,.@                
echo 	  ##  X          @#%,.@             
echo 	, "# #X            @#%,.@          
echo 	   `###X             @#%,.@     
echo 	  . ' ###              @#%.,@  
echo  	   . ";"                @#@.@
echo  	     '                    @#%.@                   
echo  	     ` ,                    @#%.@                
echo  	                             @#%#@                
echo 	                              @@@@
echo.
@echo off
pause
cls
:start
cls
COLOR %color%
title Trifecta Search Tool
echo 
echo.
echo Please choose from one of the options.
echo.
echo 1. Yahoo
echo 2. Google
echo 3. DuckDuckGo
echo 4. Shodan
echo 5. Swisscows
echo 6. Bing
echo 7. Carrot2
echo 8. Thingful
echo 9. Google Scholar
echo 10. Wolfram Alpha
echo 11. Metacrawler
echo 12. Yandex
echo 13. All Of The Above
echo.
echo.
echo.
echo.
set /p ch="Enter your option here> "
echo.
pause
if %ch%==1 goto TrifectaA if NOT goto Start2
if %ch%==2 goto TrifectaB if NOT goto Start2
if %ch%==3 goto TrifectaC if NOT goto Start2
if %ch%==4 goto TrifectaD if NOT goto Start2
if %ch%==5 goto TrifectaE if NOT goto Start2
if %ch%==6 goto TrifectaF if NOT goto Start2
if %ch%==7 goto TrifectaG if NOT goto Start2
if %ch%==8 goto TrifectaH if NOT goto Start2
if %ch%==9 goto TrifectaI if NOT goto Start2
if %ch%==10 goto TrifectaJ if NOT goto Start2
if %ch%==11 goto TrifectaK if NOT goto Start2
if %ch%==12 goto TrifectaL if NOT goto Start2
if %ch%==13 goto TrifectaM if NOT goto Start2
goto trifectastart
exit
:TrifectaA
cls
:start
set st="var"
echo Yahoo search engine for simple searches. 
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.yahoo.com/search?q="%st%"
cls 
goto trifectastart

:TrifectaB
cls
:start
set st="var"
echo Google search engine for simple searches.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.google.com/search?q="%st%"
cls
goto trifectastart

:TrifectaC
cls
:start
set st="var"
echo DuckDuckGo, more privacy oriented search engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://duckduckgo.com/?q="%st%"
cls
goto trifectastart

:TrifectaD
cls
:start
set st="var"
echo Shodan search engine to search for numerous types of servers.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.shodan.io/search?query="%st%"
cls
goto trifectastart

:TrifectaE
cls
:start
set st="var"
echo Swisscows is a Swiss privacy oriented search engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://swisscows.com/web?culture=en&query="%st%"&region=en-US
cls
goto trifectastart

:TrifectaF
cls
:start
set st="var"
echo Bing is Microsoft's search engine. I do not like it.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.bing.com/search?q="%st%"&form=QBLH&sp=-1&pq=a&sc=8-1&qs=n&sk=&cvid=964DCC37CA0543809FD5D3A64106835F
cls
goto trifectastart

:TrifectaG
cls
:start
set st="var"
echo Carrot2 organizes your search results into various topics.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://search.carrot2.org/#/search/web/"%st%"/folders
cls
goto trifectastart

:TrifectaH
cls
:start
set st="var"
echo Thingful is a real-time data search engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.thingful.net/?what="%st%"&lat=20.05593126519445&lng=-27.94921875&z=3
cls
goto trifectastart

:TrifectaI
cls
:start
set st="var"
echo Google scholar is Google's search engine for specific scholarly articles, documents, and papers.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://scholar.google.com/scholar?hl=en&as_sdt=0%2C22&q="%st%"&btnG=
cls
goto trifectastart

:TrifectaJ
cls
:start
set st="var"
echo Wolfram Alpha is a computational data search engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.wolframalpha.com/input/?i="%st%"
cls
goto trifectastart

:TrifectaK
cls
:start
set st="var"
echo Metacrawler is a search engine that was initially created as a metasearch engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://www.metacrawler.com/serp?q="%st%"&sc=ESnQ21Bx9v6Y10
cls
goto trifectastart

:TrifectaL 
cls
:start
set st="var"
echo Yandex is a powerful russian search engine.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://yandex.com/search/?text="%st%"&lr=110248
cls
goto trifectastart

:TrifectaM
cls
:start
set st="var"
echo All search options.
echo.
echo Please enter your search terms below.
echo.
echo.
echo.
@echo off
set /p st="Search> "
start "" https://yandex.com/search/?text="%st%"&lr=110248
start "" https://www.metacrawler.com/serp?q="%st%"&sc=ESnQ21Bx9v6Y10
start "" https://www.wolframalpha.com/input/?i="%st%"
start "" https://scholar.google.com/scholar?hl=en&as_sdt=0%2C22&q="%st%"&btnG=
start "" https://www.thingful.net/?what="%st%"&lat=20.05593126519445&lng=-27.94921875&z=3
start "" https://search.carrot2.org/#/search/web/"%st%"/folders
start "" https://www.bing.com/search?q="%st%"&form=QBLH&sp=-1&pq=a&sc=8-1&qs=n&sk=&cvid=964DCC37CA0543809FD5D3A64106835F
start "" https://swisscows.com/web?culture=en&query="%st%"&region=en-US
start "" https://www.google.com/search?q="%st%"
start "" https://www.shodan.io/search?query="%st%"
start "" https://duckduckgo.com/?q="%st%"
start "" https://www.yahoo.com/search?q="%st%"
cls
goto trifectastart
