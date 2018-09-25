@echo off & title Aria2 Status
@echo | call check
if errorlevel 1 pause && exit /b %errorlevel%

tasklist /fi "imagename eq aria2c.exe"
pause