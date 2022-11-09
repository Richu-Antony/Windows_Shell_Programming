:: How to run?
:: Double click this file to run.

TIMEOUT /T 120

cmdkey /add:<MachineName1> /user:<Domain\UserName1> /pass:<Password1>
cmdkey /add:<MachineName2> /user:<Domain\UserName2> /pass:<Password2>
cmdkey /add:<MachineName3> /user:<Domain\UserName3> /pass:<Password3>

start mstsc /w:1920 /h:1080 /v:<MachineName1>
start mstsc /w:1920 /h:1080 /v:<MachineName2>
start mstsc /w:1920 /h:1080 /v:<MachineName3>