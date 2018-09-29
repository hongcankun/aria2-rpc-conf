@echo off & title Aria2 Install & setlocal EnableDelayedExpansion

rem check whether aria2 has been installed
where aria2c.exe > nul 2> nul
if %errorlevel%==0 (
    echo Aria2 has been installed at following position:
    where aria2c.exe
    pause & exit /b
)

rem check whether scoop has been installed
where scoop > nul 2> nul
if errorlevel 1 (
    echo Installing scoop...
    powershell -ExecutionPolicy RemoteSigned -Command "iex (new-object net.webclient).downloadstring('https://get.scoop.sh')"
    if errorlevel 1 (
        echo Installing scoop failed, you have to install aria2 by yourself 
        pause & exit /b %errorlevel%
    ) else (
        echo Installing scoop successfully
        echo.
        set path=%path%;%userprofile%\scoop\shims
    )
)

echo Installing aria2...
cmd /c "scoop install aria2" && echo Installing aria2 successfully || echo Installing aria2 failed, try reopen a new cmd window and then execute "scoop install aria2"

pause exit /b