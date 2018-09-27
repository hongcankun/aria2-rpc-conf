@echo off & title Aria2 Status & setlocal

where aria2c > nul 2> nul
if %errorlevel% neq 0 (
    echo Aria2 is not installed, please install aria2 and add it to path
    pause
    exit /b %errorlevel%
) else (
    echo Aria2 is installed at following location:
    where aria2c
    echo.
    tasklist /fi "imagename eq aria2c.exe"
    pause
)