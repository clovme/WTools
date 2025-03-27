@ECHO OFF
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
title %uninstapkico01%
cls
color 31
ECHO.
ECHO.
ECHO. %uninstapkico02%
ECHO.
ECHO.
REM SYSTEMINFO | FIND /i "x64-based pc"
echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"

set FRAMEWORK=%windir%\Microsoft.NET\Framework
set DOTNETVERSION=v4.0.30319
IF %ERRORLEVEL%==1 (
  set FRAMEWORK=%FRAMEWORK%64
)
set REGASM="%FRAMEWORK%\%DOTNETVERSION%\regasm.exe"
if not exist "%windir%\Boot" Goto apkshellextXP
%REGASM% /unregister "%~dp0Tools\apkshellext2\ApkShellext2.dll"
ECHO.
goto :EX
::
::
:apkshellextXP
%REGASM% /unregister "%~dp0Tools\apkshellext.dll"
ECHO.
::
::
:ex
regedit /s "%~dp0Temp\unapk.reg" >nul 2>nul
reg delete "HKEY_CLASSES_ROOT\.apk" /f >nul 2>nul
reg add "HKCR\.apk" /f /ve /t REG_SZ /d "Apkdb.apk" >nul 2>nul
reg add "HKCR\Apkdb.apk" /f /ve /t REG_SZ /d "%Setup009%" >nul 2>nul
reg add "HKCR\Apkdb.apk\DefaultIcon" /f /ve /t REG_SZ /d "\"%~dp0Icon\apk.ico\"" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell" /f /ve /t REG_SZ /d "open" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open" /f /ve /t REG_SZ /d "%Setup010%" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open" /f /v Icon /t REG_SZ /d "\"%~dp0Icon\apk.ico"\" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open\command" /f /ve /t REG_SZ /d "\"%~dp0tools\ApkTool\ApkTool.exe\" \"%%1\"" >nul 2>nul
TASKKILL /F /IM explorer.exe >nul 2>NUL
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db" >nul 2>NUL
del /f /q "%userprofile%\AppData\Local\iconcache.db" >nul 2>NUL
START "" "%windir%\explorer.exe" >nul 2>NUL
exit