@echo off
REM Install Chrome browser and curl
choco install -y googlechrome
choco install -y curl

REM Generate random name for screen folder
set name=screen-%RANDOM%%RANDOM%%RANDOM%

REM Call add.php API to add the folder to the server
curl %serverip%/add.php?folder=%name%

REM Create a new scheduled task to run Chrome in kiosk mode on startup
schtasks /create /tn "Chromium Kiosk" /tr "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --disable-infobars --kiosk %serverip%/%name%" /sc onstart /ru %USERNAME%

REM Reboot the system to start Chrome in kiosk mode
shutdown /r /t 0
