@echo off & title Aria2 Start
@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

call cscript start.vbs > nul 2> nul
rem wait for aria2 to start rpc server process
timeout /t 0 > nul
tasklist /fi "imagename eq aria2c.exe"

if not -%1-==-/nopause- pause