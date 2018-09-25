@echo off & title Aria2 Stop
@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

taskkill /f /im aria2c.exe
pause