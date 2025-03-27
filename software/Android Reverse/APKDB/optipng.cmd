@echo off
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
REM APK图片优化压缩工具
REM 本工具使用 OptiPNG 0.7.5版，优化相对于 rOptiPNG 0.6.3 较好！
REM 压缩工具使用7-zip 15.14，自动判别系统位数
REM 优化压缩后使用基础签名signer工具签名
REM
set apk=%1
set bit=32
if not %PROCESSOR_ARCHITECTURE%==x86 set bit=64
if not exist "%~dp0Tools\signer\signapk.bat" echo set key=testkey>>"%~dp0Tools\signer\signapk.bat"
call "%~dp0Tools\signer\signapk.bat"
color 5a
set parent="%~dp0Tools"
set signer=%~dp0Tools\signer
set szip="%parent%\7zip\%bit%\7z.exe"
set optipng="%parent%\optipng.exe"
md %1\01%optipng04% >NUL 2>NUL
md %1\02%optipng06% >NUL 2>NUL
::
FOR %%F IN (%1\"*.apk") DO (call :optipng "%%F")
:optipng
IF %1 == () goto end
title %optipng01% %~n1.apk
cls
ECHO. 
ECHO.__________________________________________________________
ECHO. 
ECHO.  %optipng02% %~n1.apk
rd /s /q "%apk%\temp_%~n1" >NUL 2>NUL
%szip% x -o"%apk%\temp_%~n1" "%apk%\%~n1.apk" >NUL 2>NUL
ECHO. 
::
FOR /r "%apk%\temp_%~n1\" %%F IN ("*.png") DO (call "%parent%\optipng.bat" "%%F")
move /y "%apk%\%~n1.apk" "%apk%\02%optipng06%" >NUL 2>NUL
cls
ECHO. 
ECHO.__________________________________________________________
ECHO. 
ECHO.  %optipng03% %~n1.apk
del /q "%apk%\01%optipng04%\%~n1.apk" >NUL 2>NUL
%szip% a -tzip "%apk%\%~n1_s.apk" "%apk%\temp_%~n1\*" -mx9 -mmt >NUL 2>NUL
rd /s /q "%apk%\temp_%~n1" >NUL 2>NUL
%ZIP% d "%apk%\%~n1_s.apk" META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL
java -jar "%~dp0Tools\signer\signapk.jar" "%~dp0Tools\signer\%key%.x509.pem" "%~dp0Tools\signer\%key%.pk8" "%apk%\%~n1_s.apk" "%apk%\01%optipng04%\%~n1.apk"
DEL /f /q "%apk%\%~n1_s.apk" >NUL 2>NUL
ECHO. 
ECHO.__________________________________________________________
ping 127.1 -n 2 >NUL 2>NUL
