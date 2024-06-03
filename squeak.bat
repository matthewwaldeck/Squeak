@echo off
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Version: 0.0.1
:::Developed by: Matt Waldeck
:::Last update: 2024.06.03

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.
pause

:: Begin Setup


:: Remove preinstalled AV software.
if exist "%PROGRAMFILES(X86)%\Norton*" (
    start "./av_removal/NRnR.exe" /norestart /noreboot > NUL 2>&1
)
if exist "%PROGRAMFILES(X86)%\McAfee" (
    start "./av_removal/MCPR.exe" > NUL 2>&1
)
if exist "%PROGRAMFILES%\Spybot - Search & Destroy 2" (
    start "%PROGRAMFILES%\Spybot - Search & Destroy 2\unins000.exe" > NUL 2>&1
)