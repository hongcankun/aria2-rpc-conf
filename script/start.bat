@echo off & title Aria2 Start & setlocal EnableDelayedExpansion

tasklist /nh /fi "imagename eq aria2c.exe" 2> nul | find /i "aria2c.exe" > nul 2> nul
if %errorlevel%==0 (
    :option
    echo Aria2c is already running, do you want to start a new process?
    choice /c YNS /m "[Y:Yes; N:No; P:Print aria2 processes]"
    if !errorlevel!==2 pause && exit /b
    if !errorlevel!==3 tasklist /fi "imagename eq aria2c.exe" & echo. & goto option
)

set dir=%~dp0
call cscript %dir%\start.vbs > nul 2> nul
rem waitting for aria2 to start rpc server process
timeout /t 0 > nul
tasklist /fi "imagename eq aria2c.exe"
pause