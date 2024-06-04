@echo off
cls
:::       ______                         _    
:::      / / ___|  __ _ _   _  ___  __ _| | __
:::     / /\___ \ / _` | | | |/ _ \/ _` | |/ /
:::  _ / /  ___) | (_| | |_| |  __/ (_| |   < 
::: (_)_/  |____/ \__, |\__,_|\___|\__,_|_|\_\
:::                  |_|                        
:::Antivirus Removal Tool
:::Version: 1.0.0 BETA
:::Developed by: Matt Waldeck
:::Last update: 2024.06.04

:: Logo display.
:: Artwork: https://patorjk.com/software/taag/#p=display&f=Standard&t=.%2FSqueak
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo %%A
echo.

:: REMOVE THIS BLOCK ONCE TESTING IS COMPLETE.
pause
goto eof

set "remove_av="

:: AVG
if exist "%PROGRAMFILES%\AVG" (
    set /p "remove_av=AVG has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing AVG...
        start ".\av_removal\avgclear.exe"
    )
    goto eof
)
:: Bitdefeoer
if exist "%PROGRAMFILES%\Bitdefender" (
    set /p "remove_av=Bitdefender has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing Bitdefender
er...
        start ".\av_removal\Bitdefender
er.exe"
    )
    goto eof
)
:: Kaspersky
if exist "%PROGRAMFILES%\Kaspersky Lab"(
    set /p "remove_av=Kaspersky has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing Bitdefeof
er...
        start ".\av_removal\kavremvr.exe"
        :: setup_kes.exe /s /x
    )
    goto eof
)
:: McAfee
if exist "%PROGRAMFILES(X86)%\McAfee" (
    set /p "remove_av=McAfee has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing McAfee...
        start ".\av_removal\MCPR.exe"
    )
    goto eof
)
:: Norton (all versions)
if exist "%PROGRAMFILES(X86)%\Norton*" (
    set /p "remove_av=Norton has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing Norton...
        start ".\av_removal\NRnR.exe"
    )
    goto eof
)
:: Spybot
if exist "%PROGRAMFILES%\Spybot - Search & Destroy 2" (
    set /p "remove_av=Spybot - S&D2 has been detected. Would you like to remove it? "
    if "%remove_av%"=="y" (
        echo Removing Spybot - Search & Destroy 2...
        start "%PROGRAMFILES%\Spybot - Search & Destroy 2\unins000.exe"
    )
    goto eof
)
else (
    echo No supported antivirus found. Returning to main menu...
     timeout 3
)
:eof
exit