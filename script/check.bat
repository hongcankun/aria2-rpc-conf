@echo off
where aria2c > nul 2> nul
if %errorlevel% neq 0 (
    echo aria2 is not installed, please install aria2 and add it to path
    pause
    exit /b %errorlevel%
)