@ECHO OFF
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
title %install015%
color a0
xcopy "%~dp0Temp\Signer" "%~dp0Tools\Signer\" /e /g /r /h /a /s /y /c /q >nul 2>nul
:REG
cls
ECHO.
ECHO.
ECHO.
ECHO. ===================================================
ECHO.
ECHO.  %install016%
ECHO.
ECHO.
ECHO.           [Y] %install017%
ECHO.           [N] %install018%
ECHO. ____________________________________________________
set ID=Y
set /p ID= ^>^>%install012%(%apkdb021%=Y):%=% 
if /i "%id%"=="Y" goto new
if /i "%id%"=="N" goto old
goto REG
::
::
:new
regedit /s "%~dp0Temp\unapk.reg" >nul 2>nul
reg delete "HKEY_CLASSES_ROOT\.apk" /f >nul 2>nul
reg add "HKCR\.apk" /f /ve /t REG_SZ /d "Apkdb.apk" >nul 2>nul
reg add "HKCR\Apkdb.apk" /f /ve /t REG_SZ /d "%Setup009%" >nul 2>nul
reg add "HKCR\Apkdb.apk\DefaultIcon" /f /ve /t REG_SZ /d "\"%~dp0Icon\apk.ico\"" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell" /f /ve /t REG_SZ /d "open" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open" /f /ve /t REG_SZ /d "%Setup010%" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open" /f /v Icon /t REG_SZ /d "\"%~dp0Icon\apk.ico"\" >nul 2>nul
reg add "HKCR\Apkdb.apk\shell\open\command" /f /ve /t REG_SZ /d "\"%~dp0tools\ApkTool\ApkTool.exe\" \"%%1\"" >nul 2>nul
goto start
::
:old
regedit /s "%~dp0apk.reg" >nul 2>nul
::
:start
title %install001%
cls
color a0
ECHO.
ECHO.___________________________________________________________________
ECHO.
ECHO.  %install002%
ECHO.
ECHO.  %install003%
ECHO.        %install004%
ECHO.
ECHO.   %install005%
ECHO.
ECHO.   %install006%
ECHO.   %install007%
ECHO.
ECHO.___________________________________________________________________
ECHO.  [1]%install009%  [2]%install010%  [3]%install011%
ECHO.________________
set ID=1
set /p ID= ^>^> %install012%(%apkdb021%=1):%=% 
if /i "%id%"=="1" goto end
if /i "%id%"=="2" goto apkico
if /i "%id%"=="3" start "" "https://www.microsoft.com/en-us/download/details.aspx?id=17718" && goto start
goto start
::
::
:apkico
title %install013%
color a0
if not exist "%windir%\Boot" Goto apkXP
cls
ECHO.
ECHO.
ECHO.
ECHO. %install014%
ECHO.________________________________________________
REM SYSTEMINFO | FIND /i "x64-based pc"
echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"

set FRAMEWORK=%windir%\Microsoft.NET\Framework
set DOTNETVERSION=v4.0.30319
IF %ERRORLEVEL%==1 (
  set FRAMEWORK=%FRAMEWORK%64
)
set REGASM="%FRAMEWORK%\%DOTNETVERSION%\regasm.exe"
%REGASM% /codebase "%~dp0Tools\apkshellext2\ApkShellext2.dll"
goto end
::
:apkXP
cls
ECHO.
ECHO.
ECHO.
ECHO. %install014%
ECHO.________________________________________________
REM SYSTEMINFO | FIND /i "x64-based pc"
echo %PROCESSOR_IDENTIFIER% | FIND /i "x86"
IF %ERRORLEVEL%==1 (
  "%windir%\Microsoft.NET\Framework64\v4.0.30319\regasm.exe" /codebase "%~dp0Tools\apkshellext.dll" >nul 2>nul
) ELSE (
  "%windir%\Microsoft.NET\Framework\v4.0.30319\regasm.exe" /codebase "%~dp0Tools\apkshellext.dll" >nul 2>nul
)
ECHO.
reg delete "HKEY_CLASSES_ROOT\.apk\shellex\ContextMenuHandlers" /f >nul 2>nul
::
::
:end
echo.
color a0
ECHO.
ECHO.
title %install020%
mode con cols=12 lines=12
cls
if /i "%1"=="" mshta VBScript:MsgBox("%install021%   %install022%",64,"")(close) && exit
pause>nul
taskkill /f /im explorer.exe && cd /d "%userprofile%\Local Settings\Application Data" >nul 2>nul && attrib -s -h -R IconCache.db >nul 2>nul && del /f /q IconCache.db >nul 2>nul && START "" "%windir%\explorer.exe" && exit
