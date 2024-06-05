@echo off
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Antivirus Removal Tool
:::Version: 1.1.0 BETA
:::Developed by: Matt Waldeck
:::Last update: 2024.06.05

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.

:: AVG
if exist "%PROGRAMFILES%\AVG" (
    echo AVG Detected!
    start ".\av_removal\avgclear.exe"
    goto eof
)
if exist "%PROGRAMFILES(X86)%\AVG" (
    echo AVG Detected!
    start ".\av_removal\avgclear.exe"
    goto eof
)

:: Bitdefender
if exist "%PROGRAMFILES%\Bitdefender" (
    echo Bitdefender Detected!
    start ".\av_removal\Bitdefender.exe"
    goto eof
)
if exist "%PROGRAMFILES(X86)%\Bitdefender" (
    echo Bitdefender Detected!
    start ".\av_removal\Bitdefender.exe"
    goto eof
)

:: Kaspersky
if exist "%PROGRAMFILES%\Kaspersky Lab" (
    echo Kaspersky Detected!
    :: start ".\av_removal\kavremvr.exe"
    setup_kes.exe /s /x
    goto eof
)
if exist "%PROGRAMFILES(X86)%\Kaspersky Lab" (
    echo Kaspersky Detected!
    :: start ".\av_removal\kavremvr.exe"
    setup_kes.exe /s /x
    goto eof
)

:: McAfee
if exist "%PROGRAMFILES%\McAfee" (
    echo McAfee Detected!
    start ".\av_removal\MCPR.exe"
    goto eof
)
if exist "%PROGRAMFILES(X86)%\McAfee" (
    echo McAfee Detected!
    start ".\av_removal\MCPR.exe"
    goto eof
)

:: Norton (all versions)
if exist "%PROGRAMFILES%\McAfee" (
    echo Norton Detected!
    start ".\av_removal\NRnR.exe"
    goto eof
)
if exist "%PROGRAMFILES(X86)%\McAfee" (
    echo Norton Detected!
    start ".\av_removal\NRnR.exe"
    goto eof
)

:: Spybot
if exist "%PROGRAMFILES%\McAfee" (
    echo Spybot S&D2 Detected!
    start "%PROGRAMFILES%\Spybot - Search & Destroy 2\unins000.exe"
    goto eof
)
if exist "%PROGRAMFILES(X86)%\McAfee" (
    echo Spybot S&D2 Detected!
    start "%PROGRAMFILES%\Spybot - Search & Destroy 2\unins000.exe"
    goto eof
)

echo No supported antivirus found. Returning to main menu...
timeout 3 > NUL

:eof
exit