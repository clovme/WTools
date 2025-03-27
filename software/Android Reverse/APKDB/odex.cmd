@echo off
set "bit=32"
::这里更改APKTOOL版本，直接把apktoolsk.jar名称改成 ./apktool/ 目录里的就行了
set "apktooljar=apktoolsk.jar"
if not %PROCESSOR_ARCHITECTURE%==x86 set bit=64
set ZIP="%~dp0tools\7zip\%bit%\7z"
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
ECHO.
ECHO.
ECHO  _______________________________________________________
color 40
if /i exist "%~p1odex.cmd" ECHO. && ECHO. && ECHO. %apkd037% && ECHO. && ECHO.   && pause>nul && exit
color 1f
if /i exist "%cd%\framework" goto itself
cd ..
if /i exist "%cd%\app\%~n1%~x1" goto app
if /i exist "%cd%\priv-app\%~n1%~x1" goto papp
if /i exist "%cd%\framework\%~n1%~x1" goto itself2
goto :itself
:app
set fr="%cd%\framework"
cd /d %cd%\app\
goto :start
::
:papp
set fr="%cd%\framework"
cd /d %cd%\priv-app\
goto :start
::
:itself
set fr="%cd%\framework"
goto :start
::
:itself2
cd /d %~p1
set fr=%cd%
goto :start
::
::
:start
title %odex001%[%~n1%~x1]
color 50
rd /s /q "out" >nul 2>NUL
rd /s /q "smali_%~n1" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
cls
ECHO.
ECHO.   %odex002%
ECHO. ================================================================
ECHO.
ECHO.   %odex003%
ECHO.   %odex004%
ECHO.   %odex005%
ECHO.   %odex006%
ECHO.   %odex008%
ECHO.   %odex009%
ECHO.   
ECHO.   %odex010%
ECHO.   
ECHO. ================================================================
ECHO. %odex011%
ECHO.
ECHO.    %odex012% (API Level)
ECHO.    [27]-8.1   [26]-8.0   [25]-7.1   [24]-7.0
ECHO.    [23]-6.0   [22]-5.1   [21]-5.0   [20]-4.4W.2 [19]-4.4.2
ECHO.    [18]-4.3.1 [17]-4.2.2 [16]-4.1.2 [15]-4.0.3  [11]-3.0
ECHO.    [10]-2.3.3 [ 9]-2.3   [ 8]-2.2   [ 7]-2.1    [ 6]-2.0.1
ECHO.    [ 5]-2.0   [ 4]-1.6   [ 3]-1.5   [ 2]-1.1    [ 1]-1.0
ECHO.
ECHO.   PS:可以随意手动自定义输入API级别:
ECHO. ____________________________________________ [%odex013%]
ECHO. 
set ID=15
set /p ID=^>Any API Level(%odex015%=15)_^>^>%=%
::
if /i "%id%"=="27" goto A81
if /i "%id%"=="26" goto A8
if /i "%id%"=="25" goto A71
if /i "%id%"=="24" goto A70
if /i "%id%"=="23" goto A60
if /i "%id%"=="22" goto A51
if /i "%id%"=="21" goto A50
if /i "%id%"=="20" goto A44W2
if /i "%id%"=="19" goto A442
if /i "%id%"=="18" goto A431
if /i "%id%"=="17" goto A422
if /i "%id%"=="16" goto A412
if /i "%id%"=="15" goto A403
if /i "%id%"=="11" goto A30
if /i "%id%"=="10" goto A233
if /i "%id%"=="9" goto A23
if /i "%id%"=="8" goto A22
if /i "%id%"=="7" goto A21
if /i "%id%"=="6" goto A201
if /i "%id%"=="5" goto A20
if /i "%id%"=="4" goto A16
if /i "%id%"=="3" goto A15
if /i "%id%"=="2" goto A11
if /i "%id%"=="1" goto A10
cls
ECHO. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.  %odex016%
ECHO. =========================================================
ECHO.
ECHO.  %odex017% %~n1%~x1 %odex018% classes.dex ...
goto any
::
::
::
::
:A10
:1
ECHO. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.  %odex016%
ECHO. =========================================================
ECHO.
ECHO.  %odex017% %~n1%~x1 %odex018% classes.dex ...
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 1 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :2
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
ECHO.
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
cls
exit
::
::
:2
ECHO.
ECHO. [%odex022% API-2 (Android1.1)]
ping 127.1 -n 2 >NUL
:A11
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 2 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :3
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
ECHO.
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
cls
exit
::
::
:3
ECHO.
ECHO. [%odex022% API-3 (Android1.5)]
ping 127.1 -n 2 >NUL
:A15
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 3 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :4
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
ECHO.
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
cls
exit
::
::
color 10
:4
ECHO.
ECHO. [%odex022% API-4 (Android1.6)]
ping 127.1 -n 2 >NUL
A16
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 4 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :5
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
:5
ECHO.
ECHO. [%odex022% API-5 (Android2.0)]
ping 127.1 -n 2 >NUL
:A20
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 5 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :6
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:6
ECHO.
ECHO. [%odex022% API-6 (Android2.01)]
ping 127.1 -n 2 >NUL
:A201
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 6 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :7
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
:7
ECHO.
ECHO. [%odex022% API-7 (Android2.1)]
ping 127.1 -n 2 >NUL
ECHO.
:A21
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 7 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :8
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:8
ECHO.
ECHO. [%odex022% API-8 (Android2.2)]
ping 127.1 -n 2 >NUL
:A22
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 8 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :9
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:9
ECHO.
ECHO. [%odex022% API-9 (Android2.3)]
ping 127.1 -n 2 >NUL
:A23
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 9 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :10
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:10
ECHO.
ECHO. [%odex022% API-10 (Android2.3.3)]
ping 127.1 -n 2 >NUL
:A233
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 10 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :11
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:11
ECHO.
ECHO. [%odex022% API-11 (Android3.0)]
ping 127.1 -n 2 >NUL
:A30
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 11 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :12
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:12
ECHO.
ECHO. [%odex022% API-12 (Android3.1)]
ping 127.1 -n 2 >NUL
:A31
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 12 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :13
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:13
ECHO.
ECHO. [%odex022% API-13 (Android3.2)]
ping 127.1 -n 2 >NUL
:A32
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 13 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :14
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
:14
ECHO.
ECHO. [%odex022% API-14 (Android4.0)]
ping 127.1 -n 2 >NUL
:A40
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 14 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :15
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:15
ECHO.
ECHO. [%odex022% API-15 (Android4.0.3)]
ping 127.1 -n 2 >NUL
:A403
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 15 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :16
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
:16
ECHO.
ECHO. [%odex022% API-16 (Android4.1.2)]
ping 127.1 -n 2 >NUL
:A412
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 16 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :17
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
:17
ECHO.
ECHO. [%odex022% API-17 (Android4.2.2)]
ping 127.1 -n 2 >NUL
:A422
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 17 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :18
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:18
ECHO.
ECHO. [%odex022% API-18 (Android4.3.1)]
ping 127.1 -n 2 >NUL
:A431
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 18 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :19
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:19
ECHO.
ECHO. [%odex022% API-19 (Android4.4.2)]
ping 127.1 -n 2 >NUL
:A442
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 19 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :20
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:20
ECHO.
ECHO. [%odex022% API-20 (Android4.4W.2)]
ping 127.1 -n 2 >NUL
:A44W2
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 20 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :21
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:21
ECHO.
ECHO. [%odex022% API-21 (Android5.0.x)]
ping 127.1 -n 2 >NUL
:A50
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 21 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :22
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:22
ECHO.
ECHO. [%odex022% API-22 (Android5.1)]
ping 127.1 -n 2 >NUL
:A51
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 22 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :23
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:23
ECHO.
ECHO. [%odex022% API-23 (Android6.x)]
ping 127.1 -n 2 >NUL
:A60
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 23 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :24
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:24
ECHO.
ECHO. [%odex022% API-24 (Android7.0.x)]
ping 127.1 -n 2 >NUL
:A70
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 24 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :25
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:25
ECHO.
ECHO. [%odex022% API-25 (Android7.1.x)]
ping 127.1 -n 2 >NUL
:A71
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 25 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :25
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:26
ECHO.
ECHO. [%odex022% API-26 (Android8.0)]
ping 127.1 -n 2 >NUL
:A8
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 26 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :25
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
:27
ECHO.
ECHO. [%odex022% API-27 (Android8.1)]
ping 127.1 -n 2 >NUL
:A81
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a 27 %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :ERROR
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:any
ECHO.
ECHO. [%odex022% API-%id%)]
ping 127.1 -n 2 >NUL
:A71
color 21
ECHO.
java -jar "%~dp0apktool\%apktooljar%" bs -x -a %ID% %1 -d "%fr%" -o ".\%~n1\smali_%~n1"
IF %ERRORLEVEL% == 1 GOTO :ERROR
java -jar "%~dp0apktool\smali.jar" assemble ".\%~n1\smali_%~n1" -o ".\%~n1\classes.dex"
ECHO.__________________________________________________________
ECHO. 
rename "%~n1.apk" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :JAR
ECHO.  %odex019% classes.dex %odex020% %~n1.apk ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.apk" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
ECHO.
cls
exit
::
::
::
:JAR
rename "%~n1.jar" "%~n1.zip" >nul 2>NUL
IF %ERRORLEVEL% == 1 GOTO :ERROR
ECHO.  %odex019% classes.dex %odex020% %~n1.jar ...
%ZIP% a "%~n1.zip" ".\%~n1\classes.dex" >nul 2>NUL
rename "%~n1.zip" "%~n1.jar" >nul 2>NUL
rd /s /q "%~n1" >nul 2>NUL
ECHO. 
ECHO. =========================================================
ECHO. 
ECHO. ....%odex021%
ECHO.
DEL /F /Q /A +S +R +H +A %1 >nul 2>NUL
cls
exit
::
::
:ERROR
ECHO. _________________________
ECHO. 
ECHO.   :( :( :( :( :( :( 
ECHO.  
ECHO.  O_o !! %odex023%
ECHO.  
ECHO.  %odex024%
ECHO.
ECHO.
ECHO.
ECHO. ....%odex025%
pause>nul
goto :start
