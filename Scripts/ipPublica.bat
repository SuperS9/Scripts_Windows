@echo off
setlocal EnableDelayedExpansion

set "url=ifconfig.me"

for /f "delims=" %%a in ('curl -s "%url%"') do (
    set "response=!response!%%a"
)

set "internet=0"

ping -n 1 -w 2000 www.google.com >nul 2>&1

if %errorlevel% == 0 (
   set "internet=1"
)

if %internet% == 1 (
    echo Tu IP Publica es: %response%
    echo %response% | clip
    echo Te la he copiado en el portapapeles
) else (
    echo No tienes acceso a internet
)
