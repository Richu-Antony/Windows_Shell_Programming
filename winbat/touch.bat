@echo off

if %1.==. goto end
if not exist %1 goto end

copy /b %1 +,, > nul

:end

