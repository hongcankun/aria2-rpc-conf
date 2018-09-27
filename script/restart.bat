@echo off & title Aria2 Restart & setlocal

set dir=%~dp0
taskkill /f /im aria2c.exe
call cscript %dir%\start.vbs > nul 2> nul
rem waitting for aria2 to start rpc server process
timeout /t 0 > nul
tasklist /fi "imagename eq aria2c.exe"
pause