@echo off
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
if exist %~p1seesource.bat color 40 && ECHO. && ECHO. && ECHO. %apkd037% && ECHO. && ECHO.  %apkd005% && pause>nul && exit
title %seesource01%
mode con cols=55 lines=12
color 5a
echo.   %seesource02% Jadx 0.6.1
echo.
echo.    %seesource03%
echo.
echo.
echo.  %seesource04% %~n1%~x1 ...
echo.
"%~dp0Jadx\bin\jadx-gui.bat" %*