@echo off

set /p serverip="Enter IP of Server: "

REM Check if Chocolatey is installed
if not exist "%ProgramData%\Chocolatey\bin\choco.exe" (
    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

)

curl https://raw.githubusercontent.com/xfmxx/toolbox/main/install2.cmd --output install2.cmd
start install2.cmd