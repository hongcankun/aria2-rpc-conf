@echo off & title Aria2 Restart
@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

taskkill /f /im aria2c.exe
call cscript start.vbs > nul 2> nul
rem wait for aria2 to start rpc server process
timeout /t 0 > nul
tasklist /fi "imagename eq aria2c.exe"
pause