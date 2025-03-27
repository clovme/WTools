@echo off
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
if not %PROCESSOR_ARCHITECTURE%==x86 set bit=64
if /i not exist "%~dp0Tools\Signer\signapk.jar" xcopy "%~dp0Temp\signer" "%~dp0Tools\signer\" /e /g /r /h /a /y >nul 2>nul
if /i not exist "%~dp0Tools\Signer\signapk.bat" echo set key=testkey>>"%~dp0Tools\Signer\signapk.bat"
if /i not exist "%~dp0apktool\default.bat" goto sa230n >NUL 2>NUL
set ZIP="%~dp0tools\7zip\%bit%\7z"
::
color 0e
:one
call "%~dp0Tools\Signer\signapk.bat"
call "%~dp0apktool\default.bat"
cls
set "JAR2=::"
set "apkdbnow="
ECHO.
ECHO.
ECHO  _______________________________________________________
set "ex=%~x1"
if /i "%ex%"==".APK" goto StartAPK
if /i "%ex%"==".DEX" goto dex_d
if /i "%ex%"==".ODEX" start "" "%~dp0odex.cmd" "%1" && exit
if /i "%ex%"==".ZIP" goto Zipbb
if /i "%ex%"==".JAR" set JAR=:: && set JAR2= && goto StartAPK
if /i "%ex%"==".RSA" goto Keytool
if /i "%ex%"==".class" "%~dp0Jadx\bin\jadx-gui.bat" %*
if /i "%ex%"==".IMG" goto bootimg
if /i "%ex%"==".GZ" goto bootimg
if /i "%ex%"==".xml" start "" "%~dp0Tools\AndXml\AndroidRomXmlEdit.exe" "%1" && exit
set "flv=%1"
ECHO.

if /i "%ex%"==".flv" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
if /i "%ex%"==".mp4" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
if /i "%ex%"==".mkv" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
if /i "%ex%"==".avi" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
if /i "%ex%"==".MOV" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
if /i "%ex%"==".wmv" start "" %~dp0Tools\FLV2MP4.bat %flv% && exit
::
:nononono
title %Setup003%
set rem=::
set gototo=H
color 0e
::
::
:StartAPK
%rem%title %apkd007% %~n1%~x1
%rem%color 5a
cls
ECHO. =============================================================================
%rem%ECHO. %apkd008%
%rem%ECHO.
%rem%ECHO.         [1]-v2.5.0                  [2]-v3.0.0(ShakaApktool)
%rem%ECHO.         [3]-v2.0.3                  [4]-v2.0.0
%rem%ECHO.         [5]-自定义Aptoool版本1      [6]-自定义Aptoool版本2
%rem%ECHO.         [0]-ShakaApktool %shakaapktool01% [J]-使用 Jadx 0.7.2 编译
ECHO.
%rem%ECHO.         [P]-^>Apktool 2.5.0 使用APPT2构建(%aapt22%)
%JAR%%rem%ECHO.         [R]-^>%apkd038%(%noresources2%)   ^|   [C]-^>%apkd039%(%nosources2%)
%rem%ECHO.         [L]-^>去除调试信息(%BL2%)
%rem%ECHO.
ECHO.         
ECHO. %apkd009%
%rem%ECHO.         [D]-^>^> %apkd010% (Smali)
ECHO.         [E]-^>^> %seapktool01% =^>[%seapktool00%]
%rem%ECHO.         [S]-^>^> %Setup005%  %keytool18% =^>[%key%]
%JAR%%rem%ECHO.         [Z]-^>^> %apkd020%
%JAR%%rem%ECHO.         [B]-^>^> %optipng0% ^| [G] %optipng00%
%JAR%%rem%ECHO.         [K]-^>^> %keytool07%
ECHO.         [T]-^>^> %keytool01% ^<-
%JAR%ECHO.         [F]-^>^> %fwk012% =^>[%f%]
%Lang2%ECHO.         [H]-^>^> 高级菜单 ^<^<^<^< ^<^<^< ^<^< ^<=
ECHO.
ECHO.         [W]-^>^> %apkd011%    [M]-^>%apkd024%
ECHO.         [U]-^>^> 检测更新    [X]-^>%Exit%
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set ID=%gototo%
%apkdbnow%set /p ID= %apkd014%(%apkd015%=%gototo%)_^>^>%=%
%rem%if /i "%id%"=="1" set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto apktool
%rem%if /i "%id%"=="2" set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && set "aapt2=" && set "name=[%~n1%~x1]" && goto apktool
%rem%if /i "%id%"=="3" set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && set "aapt2=" && goto apktool
%rem%if /i "%id%"=="4" set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && set "aapt2=" && goto apktool
%rem%if /i "%id%"=="5" goto diyapktool
%rem%if /i "%id%"=="6" goto diyapktool2
%rem%if /i "%id%"=="j" "%~dp0Jadx\bin\jadx-gui.bat" %*
::%rem%if /i "%id%"=="1" goto 230
::%rem%if /i "%id%"=="2" goto 300sk
::%rem%if /i "%id%"=="3" goto 203
::%rem%if /i "%id%"=="4" goto 200
%rem%if /i "%id%"=="0" goto ShakaApktool
%rem%if /i "%id%"=="d" goto dex_d
%rem%if /i "%id%"=="B" goto zipalign
%rem%if /i "%id%"=="G" set optipngsignapk=goto optipngsignapk&&goto zipalign
%rem%if /i "%id%"=="Z" goto zipalign2
if /i "%id%"=="F" goto fwk
%rem%if /i "%id%"=="S" goto signer
%rem%if /i "%id%"=="K" goto Keytool
if /i "%id%"=="T" goto Keytool2
if /i "%id%"=="e" goto seapktool
%Lang2%if /i "%id%"=="H" GOTO Sperbox
%Cx%%rem%if /i "%id%"=="C" set "nosources=-s"&set "nosources2=%YES%"& set "Cx=::"&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%rem%if /i "%id%"=="C" set "nosources="&set "nosources2=OFF"&%Lang2%set "nosources2=×"& set "Cx="&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%Rx%%rem%if /i "%id%"=="R" set "noresources=-r"&set "noresources2=%YES%"& set "Rx=::"&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%rem%if /i "%id%"=="R" set "noresources="&set "noresources2=OFF"&%Lang2%set "noresources2=×"& set "Rx="&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%Px%%rem%if /i "%id%"=="P" set "aapt2=--use-aapt2"&set "aapt22=%YES%"& set "Px=::"&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%rem%if /i "%id%"=="P" set "aapt2="&set "aapt22=OFF"&%Lang2%set "aapt22=×"& set "Px="&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK

%Lx%%rem%if /i "%id%"=="L" set "BL=-b"&set "BL2=%YES%"& set "Lx=::"&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%rem%if /i "%id%"=="L" set "BL="&set "BL2=OFF"&%Lang2%set "BL2=×"& set "Px="&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK

if /i "%id%"=="W" start "" "http://idoog.me" && GOTO StartAPK
if /i "%id%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO StartAPK
if /i "%id%"=="X" exit
if /i "%id%"=="U" start "" "%~dp0Update\update.bat" && exit
if /i "%id%"=="33" set "ver1=ApkTool v2.5.0" && set ver2=300skc && set ver3=300sks && set apktooljar=apktool250 && goto apktool

GOTO StartAPK
::
::
::=========================================================================================================
%rem%if /i "%id%"=="1" set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto apktool
%rem%if /i "%id%"=="2" set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && goto apktool
%rem%if /i "%id%"=="3" set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && goto apktool
%rem%if /i "%id%"=="4" set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && goto apktool
::=========================================================================================================

:a230
set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto %goooto%
:a300sk
set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && set "name=[%~n1%~x1]" && goto %goooto%
:a203
set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && goto %goooto%
:a200
set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && goto %goooto%

::
::=========================================================================================================
::
:apktools
ECHO.__________________________________________________________
ECHO.
ECHO.
ECHO. %apkdb008%
ECHO.
ECHO. %apkdb009%
ECHO.
pause>nul
:apktoolc
title %apkd002% %~n1%~x1
color 0e
cls
ECHO.==========================================================
ECHO.
ECHO.
ECHO.
ECHO.  %apkd001% %ver1%
ECHO.
ECHO.
ECHO.
ECHO. _________________________________________[ www.idoog.me ]
ECHO.
ECHO.I: %apkd003%%name%
java -jar "%~dp0apktool\%apktooljar%" d %BL% -f %aapt2% -o "%~p1%~n1" %1 %nosources% %noresources%
IF %ERRORLEVEL% == 1 set goooto=apktoolc && GOTO %ver2% 
ECHO.__________________________________________________________
GOTO QUIT
exit
::
:apktool
title %apkd002% %~n1%~x1
color 0e
cls
if /i not exist "%JAVA_HOME%\bin" ( cls && echo. && echo  未检测到JAVA环境 && echo. && echo  按任意键开始配置 && pause>nul &&  start "" "%~dp0Tools\JavaSet.bat" && exit )
ECHO.==========================================================
ECHO.
ECHO.
ECHO.
ECHO.  %apkd001% %ver1%
ECHO.
ECHO.
ECHO.
ECHO. _________________________________________[ www.idoog.me ]
ECHO.
ECHO.I: %apkd003%%name%
java -jar "%~dp0apktool\%apktooljar%" d %BL% -f %aapt2% -o "%~p1%~n1" %1 %nosources% %noresources%
IF %ERRORLEVEL% == 1 set goooto=apktools && GOTO %ver2% 
ECHO.__________________________________________________________
GOTO QUIT
exit
::
::
::
::
::=========================================================================================================
::=========================================================================================================
::
::
::
::
::
::
:seapktool
call "%~dp0apktool\default.bat"
title %seapktool01%
color 3f
cls
ECHO. =========================================================================
ECHO.
ECHO.                %seapktool01%
ECHO.
ECHO.           [1]-v2.5.0                  [2]-v3.0.0(ShakaApktool)
ECHO.           [3]-v2.0.3                  [4]-v2.0.0
ECHO.           [5]-自定义Aptoool版本1      [6]-自定义Aptoool版本2
ECHO. 
ECHO.           %seapktool03%%seapktool00%
ECHO.           %seapktool02%
ECHO. 
ECHO. ------------------------------------------------------------------------
ECHO.           [D]-开启右键直接编译(跳过主界面) [%KQ%]
ECHO.              -取消方法，任意文件可调出此菜单
ECHO. 
ECHO.           [F]-返回        [X]-^>%Exit%
ECHO. 
ECHO. _____________________________________________________________[ idoog.me ]
ECHO. 
set SE=1
set /p SE= %apkd014%(%apkd015%=1)_^>^>%=%
if /i "%se%"=="1" goto sa230
if /i "%se%"=="2" goto sa300sk
if /i "%se%"=="3" goto sa203
if /i "%se%"=="4" goto sa200
if /i "%se%"=="5" goto diy1
if /i "%se%"=="6" goto diy2
if /i "%se%"=="d" goto apkdbnow
if /i "%se%"=="f" goto one
if /i "%se%"=="x" exit
goto seapktool
::
::
::
:apkdbnow
%KQ1%goto apkdbnow2

:apkdbnow1
(
echo set "apkdbnow=::"
echo set "KQ=已开启"
echo set "KQ1="
)>>"%~dp0apktool\default.bat"
goto seapktool
exit
::
::
:apkdbnow2
(
echo set "apkdbnow="
echo set "KQ=未开启"
echo set "KQ1=::"
)>>"%~dp0apktool\default.bat"
goto seapktool
::
::
:sa230n
(
echo set gototo=1
echo set seapktool00=v2.5.0
echo set apktoolx=apktool250.jar
echo set "KQ=未开启"
echo set "KQ1=::"
)>"%~dp0apktool\default.bat"
goto one
::
::
:sa230
(
echo set gototo=1
echo set seapktool00=v2.5.0
echo set apktoolx=apktool250.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:sa300sk
(
echo set gototo=2
echo set seapktool00=v3.0.0-ShakaApktool
echo set apktoolx=apktoolsk.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:sa203
(
echo set gototo=3
echo set seapktool00=v2.0.3
echo set apktoolx=apktool203.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:sa200
(
echo set gototo=4
echo set seapktool00=v2.0.0
echo set apktoolx=apktool200.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:diy1
(
echo set gototo=5
echo set seapktool00=DIY1
echo set apktoolx=apktool.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:diy2
(
echo set gototo=6
echo set seapktool00=DIY2
echo set apktoolx=apktool2.jar
)>>"%~dp0apktool\default.bat"
goto SETOK
::
::
:SETOK
color 0a
ECHO.
ECHO.  %OK%
ECHO.
call "%~dp0apktool\default.bat"
ping 127.1 -n 1 >NUL 2>NUL
goto seapktool
::
::
::
:ShakaApktool
cls
title %apkd007% %~n1%~x1
ECHO.
ECHO. =========================================================================
ECHO. 
ECHO                 ShakaApktool %shakaapktool01%
ECHO.
ECHO.    %shakaapktool04%
ECHO.    %shakaapktool05%
ECHO.    %shakaapktool06%
ECHO.    %shakaapktool07%
ECHO.    %shakaapktool08%
ECHO.    %shakaapktool10%
ECHO.    %shakaapktool11%
ECHO.    %shakaapktool12%
ECHO.    %shakaapktool13%
ECHO.    %shakaapktool14%
ECHO. 
ECHO.    %shakaapktool02%^>^>-df -ir
ECHO. _____________________________________________________________[ idoog.me ]
set /p SK= ^>^>%=%
ECHO. 
ECHO.I: %apkd003%
java -jar "%~dp0apktool\apktoolsk.jar" d -f -o "%~p1%~n1" %1 %sk%
IF %ERRORLEVEL% == 1 GOTO ERROR
GOTO QUIT

:APKinTool
cls
start "" "%~dp0apktool.exe"
goto StartAPK
::
::
::
::
::
::
::
:QUIT
:: 
ECHO.
ECHO.
ECHO. %apkd004%
ECHO.
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
::
::
rd /s /Q "%~p1%~n1\original" >NUL 2>NUL
%ZIP% e %1 -o"%~p1%~n1\original\META-INF" META-INF\* >NUL 2>NUL
%ZIP% e %1 -o"%~p1%~n1\original" AndroidManifest.xml >NUL 2>NUL
::
::
:zipalign
title %optipng01%: %~n1%~x1
mode con cols=80 lines=8
cls
ECHO _______________________________________________________________________________
ECHO.
ECHO.   %optipng02% %~n1%~x1
rd /s /q "%CD%\temp_%~n1" >NUL 2>NUL
%ZIP% x -o"%CD%\temp_%~n1" %1 -y >NUL 2>NUL
set optipng="%~dp0tools\optipng.exe"
FOR /r "%CD%\temp_%~n1" %%F IN (*.png) DO (call "%~dp0tools\optipng.bat" "%%F")
cls
ECHO _______________________________________________________________________________
ECHO.
%optipngsignapk%
:optipngzip
ECHO.   %optipng03% %~n1%~x1
DEL /f /q "%CD%\%~n1_%optipng04%.apk" >NUL 2>NUL
%ZIP% a -tzip "%CD%\%~n1_%optipng04%.apk" "%CD%\temp_%~n1\*" -mx9 -mmt  >NUL 2>NUL
ECHO. 
ECHO.
ping 127.1 -n 2 >NUL 2>NUL
exit

:optipngsignapk
set "signapk=signapk2"
ECHO.   %optipng03% %~n1%~x1
DEL /f /q "%CD%\%~n1_s.apk" >NUL 2>NUL
%ZIP% a -tzip "%CD%\%~n1_s.apk" "%CD%\temp_%~n1\*" -mx9 -mmt  >NUL 2>NUL
::
DEL /f /q "%CD%\%~n1_%optipng04%%optipng00%.apk" >NUL 2>NUL
%ZIP% d "%CD%\%~n1_s.apk" META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL
java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" "%CD%\%~n1_s.apk" "%CD%\%~n1_%optipng04%%optipng00%.apk" >nul 2>NUL
DEL /f /q "%CD%\%~n1_s.apk" >NUL 2>NUL
rd /s /q "%CD%\temp_%~n1" >NUL 2>NUL
ECHO. 
ECHO.
set optipngsignapk= 
ping 127.1 -n 2 >NUL 2>NUL
exit

:zipalign2
ECHO.
ECHO. %apkd021%:%~n1%~x1
ECHO.
ECHO. %apkd022%...
"%~dp0Tools\zipalign.exe" -f -v 4 %1 "apkdb.apk" >NUL 2>NUL
DEL /f /Q %1 >NUL 2>NUL
rename "apkdb.apk" "%~n1%~x1" >NUL 2>NUL
ECHO. %apkd023%
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
::
::
:dex_d
%JAR2%goto jar_d
title %baksmali001% Smali
color 21
rd /s /q Smali_%~n1
cls
ECHO.==========================================================
ECHO.
ECHO.    %baksmali001% Smali
ECHO.    
ECHO.
ECHO.    %baksmali002%
ECHO.
ECHO.
ECHO.  %baksmali003%[%~n1%~x1]
ECHO.==========================================================
ECHO.
ECHO.   %baksmali004%
java -jar "%~dp0apktool\baksmali.jar" disassemble %1 -o "Smali_%~n1"
IF %dexd_ERRORLEVEL% == 1 GOTO dexd_ERROR
:dexd_OK
ECHO.__________________________________________________________
ECHO.
ECHO. %baksmali005%
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
::
:jar_d
title %baksmali001% Smali
color 21
rd /s /Q "%Temp%\%~n1">nul 2>NUL
%ZIP% e %1 -o"%Temp%\%~n1" classes2.dex classes.dex -y>nul&&if /i exist "%Temp%\%~n1\classes2.dex" goto 230c
if not exist "%Temp%\%~n1\classes.dex" start "" "%~dp0Craining\jd-gui.exe" %1 && exit
::
rd /s /q "%~n1">nul 2>NUL
cls
ECHO.==========================================================
ECHO.
ECHO.    %baksmali001% Smali
ECHO.    
ECHO.
ECHO.    %baksmali002%
ECHO.
ECHO.
ECHO.  %baksmali003%[%~n1%~x1]
ECHO.==========================================================
ECHO.
ECHO.   %baksmali004%
java -jar "%~dp0apktool\baksmali.jar" disassemble %1 -o "%~n1"
IF %dexd_ERRORLEVEL% == 1 GOTO dexd_ERROR
:dexd_OK
ECHO.__________________________________________________________
ECHO.
ECHO. %baksmali005%
ping 127.1 -n 3 >NUL 2>NUL
exit
::
:dexd_ERROR
ECHO.__________________________________________________________
ECHO.__________________________________________________________
ECHO.
ECHO.  =_=!!! %baksmali006%
ECHO.
ECHO.
ECHO.  %baksmali007%
pause>nul
exit
::
::
::
:fwk
color a1
cls
:fwk2
title %fwk001%
call "%~dp0language\Language.bat"
color a1
ECHO.
ECHO.==================================================================
ECHO.
ECHO.    %fwk002%
ECHO.    %fwk003%
ECHO.    %fwk004%
ECHO.    %fwk005%
ECHO.    %fwk006%
ECHO.    
ECHO.    %fwk007%
ECHO.    
ECHO.==================================================================
ECHO.
%rem%ECHO.     ^>^> [F] %fwk013%
ECHO.     ^>^> [D] %fwk014%
ECHO.
ECHO.     ^>^> [N] %keytool17%   [X]-^>%Exit%
ECHO.
ECHO.___________________________________________________________________
ECHO.
for %%q in ("%USERPROFILE%\AppData\Local\apktool\framework\*.apk") do ( ECHO. 框架文件: %%q )
for %%q in ("%USERPROFILE%\apktool\framework\*.apk") do ( ECHO. 框架文件: %%q )
for %%q in ("C:%HOMEPATH%\apktool\framework\*.apk") do ( ECHO. 框架文件: %%q )
for %%q in ("%AllUsersProfile%\apktool\framework\*.apk") do ( ECHO. 框架文件: %%q )
ECHO.___________________________________________________[ www.idoog.me ]
ECHO. 
set FR=D
%rem%set FR=F
set /p FR= ^>^>%apkd014%(%apkd015%=%FR%):%=%
::
if /i "%FR%"=="F" GOTO infwk
if /i "%FR%"=="D" GOTO outfwk
if /i "%FR%"=="N" goto one
if /i "%FR%"=="X" exit
goto fwk
:outfwk
cls
ECHO.
if /i exist "%USERPROFILE%\AppData\Local\apktool\framework\*.apk" DEL /F /Q "%USERPROFILE%\AppData\Local\apktool\framework\*.apk" && goto OKUUTFWK
if /i exist "%USERPROFILE%\apktool\framework\*.apk" DEL /F /Q "%USERPROFILE%\apktool\framework\*.apk" && goto OKUUTFWK
if /i exist "C:%HOMEPATH%\apktool\framework\*.apk" DEL /F /Q "C:%HOMEPATH%\apktool\framework\*.apk" && goto OKUUTFWK
if /i exist "%AllUsersProfile%\apktool\framework\*.apk" DEL /F /Q "%AllUsersProfile%\apktool\framework\*.apk" && goto OKUUTFWK
ECHO.
ECHO.                           未发现框架文件！
GOTO fwk2
:OKUUTFWK
ECHO.
ECHO.    %fwk009%
GOTO fwk2
::
::
ECHO.
ECHO.
:infwk
if /i not exist "%USERPROFILE%\AppData\Local\apktool\framework" ( md "%USERPROFILE%\AppData\Local\apktool\framework" )
java -jar "%~dp0apktool\apktool250.jar" if %1
IF %ERRORLEVEL% == 1 GOTO FWKERRORsk
::pause
::if /i exist "%USERPROFILE%\AppData\Local\Temp\*.apk" ( move /y "%USERPROFILE%\AppData\Local\Temp\*.apk" "%USERPROFILE%\AppData\Local\apktool\framework\" )
GOTO FWKOK
:FWKERRORsk
cls
ECHO.
ECHO. =================================================================
ECHO.
ECHO.    %fwk002%
ECHO.    %fwk003%
ECHO.    %fwk004%
ECHO.    %fwk005%
ECHO.    %fwk006%
ECHO.    
ECHO.    %fwk007%
ECHO.    
ECHO. =================================================================
java -jar "%~dp0apktool\apktoolsk.jar" if %1
IF %ERRORLEVEL% == 1 GOTO FWKERROR200
GOTO FWKOK
:FWKERROR200
cls
ECHO.
ECHO. =================================================================
ECHO.
ECHO.    %fwk002%
ECHO.    %fwk003%
ECHO.    %fwk004%
ECHO.    %fwk005%
ECHO.    %fwk006%
ECHO.    
ECHO.    %fwk007%
ECHO.    
ECHO. =================================================================
java -jar "%~dp0apktool\apktool200.jar" if %1
IF %ERRORLEVEL% == 1 GOTO FWKERROR203
GOTO FWKOK
:FWKERROR203
cls
ECHO.
ECHO. =================================================================
ECHO.
ECHO.    %fwk002%
ECHO.    %fwk003%
ECHO.    %fwk004%
ECHO.    %fwk005%
ECHO.    %fwk006%
ECHO.    
ECHO.    %fwk007%
ECHO.    
ECHO. =================================================================
java -jar "%~dp0apktool\apktool203.jar" if %1
IF %ERRORLEVEL% == 1 GOTO FWKERROR
:FWKOK
ECHO.
ECHO.
ECHO.  :) %fwk008%
ping 127.1 -n 3 >NUL 2>NUL
GOTO fwk
exit
::
:FWKERROR
ECHO.
ECHO.
ECHO. =_=!!! %fwk010%
ECHO.
ECHO.
ECHO.  %fwk011%
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
::
REM /////////////////////////////////////////// SIGNER ///////////////////////////////////////////////////
::
::
:signer
TASKKILL /f /IM aapt* >NUL 2>NUL&TASKKILL /f /IM adb* >NUL 2>NUL&TASKKILL /f /IM sadb* >NUL 2>NUL&TASKKILL /f /IM tadb* >NUL 2>NUL&TASKKILL /f /IM kadb* >NUL 2>NUL&TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL&TASKKILL /f /IM ShuameDaemon.exe >NUL 2>NUL&TASKKILL /f /IM shuame_helper.exe >NUL 2>NUL
title %signer00%[%~n1%~x1]
mode con cols=66 lines=9
color a1
cls
ECHO.
ECHO.  %signer01%%~n1%~x1
ECHO.
ECHO.  %signer02%
ECHO.
ECHO.  %signer03%
DEL /f /Q %~n1_Signed%~x1 >nul 2>NUL
DEL /f /Q bak_%~n1%~x1 >nul 2>NUL
copy /d /y %1 bak_%~n1%~x1 >nul 2>NUL
%ZIP% d %1 META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL

::-----------------------------------------------定制
:: 说明把签名包放到 APKDB根目录 如：D:\APKDB\Tools\Signer\【签名文件】.keystore,在下面把名称和密码填上。
::ren "%~n1%~x1" Apkdb%~x1
::jarsigner -verbose -keystore "%~dp0Tools\Signer\【签名文件】.keystore" -storepass 【密钥】 -keypass 【密钥】 -signedjar "Apkdb_Signed%~x1" Apkdb%~x1 cert -digestalg SHA1 -sigalg MD5withRSA
::ren Apkdb%~x1 "%~n1%~x1"
::ren "Apkdb_Signed%~x1" "%~n1_Signed%~x1"
::-----------------------------------------------定制
:signer2
java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" %1 "%~n1_Signed%~x1" >nul 2>NUL
%IFF%IF %ERRORLEVEL% == 1 DEL /f /Q "%~n1_Signed%~x1" >nul 2>NUL&&set "signapk=signapk2"&&set "IFF=::"&&GOTO signer2
DEL /f /Q %1 >nul 2>NUL
rename bak_%~n1%~x1 %~n1%~x1>nul 2>NUL
ECHO. 
ECHO.  %signer04%
ping 127.1 -n 3 >NUL 2>NUL
exit
::
jarsigner -verbose -keystore "%~dp0Tools\signer"\签名文件.keystore -storepass 密码 -keypass 密码 -signedjar %~n1_Signed%~x1 %1 cert -digestalg SHA1 -sigalg MD5withRSA

#pause



::
::
::
::
:ERROR
color 0c
ECHO.
ECHO. =_=!!! %apkd027%
ECHO.
ECHO.__________________________________________________________
ECHO.    
ECHO.    %apkd028%
ECHO.    
ECHO.         ....\apktool\framework\ %apkd029%
ECHO.
ECHO.    %apkd030%
ECHO.__________________________________________________________
ECHO.
ECHO.
ECHO.  %apkd031%
ECHO.
pause>nul
GOTO StartAPK
exit
::
::
:noapk2
cls
color 0c
ECHO.
ECHO.
ECHO. %apkd032%
ECHO.
ECHO.  %apkd005%
ECHO.
pause>nul
exit
::
::
::
:noapk
cls
color 0c && ECHO. && ECHO. && ECHO. %apkd037% && ECHO. && ECHO.  %apkd005% && pause>nul && exit
::
::
::
::
::
REM ///////////////////////////////////////// ZIP /////////////////////////////////////////////////////////
::
:: --------------------------
:: 以下是ZIP文件处理
:Zipbb
title [%~n1%~x1]
color 1f
cls
ECHO. =============================================================================
ECHO.
ECHO.    %apkd009%
ECHO.           [S]-^>^> %Setup001% (%keytool18%:%key%) ^<-
ECHO.            
ECHO.           [Z]-^>^> %Setup006% ^<-
ECHO.                     %flashzip004%
ECHO.
ECHO.           [T]-^>^> %keytool01% ^<-
ECHO.
ECHO.           [W]-^>^> %apkd011%    [M]-^>%apkd024%
ECHO.           [U]-^>^> 检测更新    [X]-^>%Exit%
ECHO.  
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set ZIP=
set /p ZIP= ^>%apkd014%^>^>%=%
::
if /i "%ZIP%"=="S" goto ZipSigner
if /i "%ZIP%"=="Z" goto flashzip
if /i "%ZIP%"=="T" goto Keytool2
if /i "%ZIP%"=="W" start "" "http://idoog.me" && GOTO Zipbb
if /i "%ZIP%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO Zipbb
if /i "%ZIP%"=="x" exit
if /i "%ZIP%"=="U" start "" "%~dp0Update\update.bat" && exit
GOTO Zipbb
::
::
::
::
:: 签名ZIP文件
::
:ZipSigner
title %signer00%[%~n1%~x1]
mode con cols=66 lines=9
color a1
cls
ECHO.
ECHO.  %signer01%%~n1%~x1
ECHO.
ECHO.  %signer02%
ECHO.
ECHO.  %signer03%
DEL /f /Q "%~n1_Signed%~x1" >nul 2>NUL
%ZIP% d %1 META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL
:ZipSigner2
java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" %1 "%~n1_Signed%~x1" >nul 2>NUL
%IFF%IF %ERRORLEVEL% == 1 DEL /f /Q "%~n1_Signed%~x1" >nul 2>NUL&&set "signapk=signapk2"&&set "IFF=::"&&GOTO ZipSigner2
ECHO. 
DEL /f /q %1 >nul 2>NUL
ECHO.  %signer05%Signed_%~n1%~x1
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
::
:: 刷入ZIP包
::
:flashzip
ECHO.
ECHO.
ECHO  _______________________________________________________
color 0c
color 1f
title %flashzip001% %~n1%~x1
TASKKILL /f /IM aapt* >NUL 2>NUL
TASKKILL /f /IM adb* >NUL 2>NUL
TASKKILL /f /IM sadb* >NUL 2>NUL
TASKKILL /f /IM tadb* >NUL 2>NUL
TASKKILL /f /IM kadb* >NUL 2>NUL
TASKKILL /f /IM AndroidPopup.exe >NUL 2>NUL
TASKKILL /f /IM KuGou.exe >NUL 2>NUL
TASKKILL /f /IM QQPCTray.exe >NUL 2>NUL
TASKKILL /f /IM shuame_helper* >NUL 2>NUL
::
::
"%~dp0tools/ADB/adb" devices
IF %ERRORLEVEL% == 1 GOTO flashzipERROR
:flashzipContinue
cls
color 1f
ECHO _______________________________________________________________________________
ECHO.
ECHO.
ECHO.  %flashzip002%
ECHO.
ECHO.  %flashzip003% %~n1%~x1
ECHO.
ECHO.  %flashzip004%
ECHO.
ECHO.%flashzip005%
ECHO _______________________________________________________________________________
TASKKILL /f /IM adb.exe >NUL 2>NUL
TASKKILL /f /IM tadb.exe >NUL 2>NUL
TASKKILL /f /IM kadb.exe >NUL 2>NUL
TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL
TASKKILL /f /IM AndroidPopup.exe >NUL 2>NUL
TASKKILL /f /IM KuGou.exe >NUL 2>NUL
TASKKILL /f /IM QQPCTray.exe >NUL 2>NUL
TASKKILL /f /IM shuame_helper* >NUL 2>NUL
ping 127.1 -n 4 >NUL 2>NUL
"%~dp0tools/ADB/adb.exe" sideload %1
IF %ERRORLEVEL% == 1 GOTO flashzipReboot
ECHO.
ECHO _______________________________________________________________________________
ECHO.
ECHO.  %flashzip006%
ECHO.
exit
::
::
:flashzipContinue1
ECHO.
:flashzipsideload
cls
color 1f
ECHO _______________________________________________________________________________
ECHO.
ECHO.  %flashzip003% %~n1%~x1
ECHO.
ECHO.  %flashzip004%
ping 127.1 -n 5 >NUL 2>NUL
ECHO.
TASKKILL /f /IM adb.exe >NUL 2>NUL
TASKKILL /f /IM tadb.exe >NUL 2>NUL
TASKKILL /f /IM kadb.exe >NUL 2>NUL
TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL
TASKKILL /f /IM AndroidPopup.exe >NUL 2>NUL
TASKKILL /f /IM KuGou.exe >NUL 2>NUL
TASKKILL /f /IM QQPCTray.exe >NUL 2>NUL
TASKKILL /f /IM shuame_helper* >NUL 2>NUL
"%~dp0tools/ADB/adb.exe" sideload %1
IF %ERRORLEVEL% == 1 GOTO flashzipERROR
ECHO.%flashzip005%
ECHO.
ECHO.
ECHO.  %flashzip006%
ECHO.
exit
::
::
:flashzipReboot
ECHO.%flashzip016%
"%~dp0tools/ADB/adb.exe" reboot recovery 
ping 127.1 -n 15 >NUL 2>NUL
ECHO _______________________________________________________________________________
goto flashzipContinue1
::
:flashzipXP
set /p fl= ^>^>%flashzip007%:%=% 
if /i "%fl%"=="Y" "%~dp0tools/ADB/adb.exe" reboot && goto flashzipContinue1
if /i "%fl%"=="y" "%~dp0tools/ADB/adb.exe" reboot && goto flashzipContinue1

::
::
:flashzipERROR
color 0c
ECHO.
ECHO. =_=!!! %flashzip008%
ECHO.
ECHO _______________________________________________________________________________
ECHO.   
ECHO.   %flashzip009%
ECHO.   %flashzip010%
ECHO.
ECHO.  %flashzip011%
ECHO.     %flashzip012%
ECHO.     %flashzip013%
ECHO.
ECHO.
ECHO.  %flashzip014%
ECHO.
ECHO _______________________________________________________________________________
pause
GOTO flashzipContinue
::
::
::
::
::
::
:SeeJar
start "" "%~dp0\Craining\jd-gui.exe" %1
exit
::
::
::
REM ///////////////////////////////////////////KEYTOOL//////////////////////////////////////////////////
::
:Keytool
::
::JAVA SET
if /i exist "%JAVA_HOME%\bin" goto javahome
call "%~dp0java.bat"
if /i exist "%java%\bin" goto CPNV
if /i exist "D:\Program Files\Java" goto DP
if /i exist "D:\Program Files (x86)\Java" goto DP86
goto CP
:DP
set ja=D:\Program Files\Java
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
call "%~dp0java.bat"
goto CP
:DP86
set ja=D:\Program Files\Java (x86)
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
call "%~dp0java.bat"
goto CP
:javahome
PATH %PATH%;"%JAVA_HOME%\bin"
goto Keytool11
:CPNV
PATH %PATH%;"%java%\bin"
goto Keytool11
:CP
for /d %%j in ("%java%\*") do set jkd=%%j\bin
PATH %PATH%;"%jkd%"
:Keytool11
color 0a
title %~n1.apk ^>^>%keytool02%
cls
ECHO. 
ECHO. 
ECHO.^>^>%~n1.apk ^>%keytool02%:
ECHO ______________________________________________________________________________
if /i exist "%~n1.RSA" ECHO.&&keytool -file %1 -printcert||GOTO java
if /i exist "%~n1.apk" %ZIP% e %1 -o"%Temp%\%~n1" META-INF\ -y>NUL&&ECHO. &&keytool -file "%Temp%\%~n1"\*.RSA -printcert||GOTO java
ECHO. 
ECHO ________________________________________________________________________^<End^<-
rd /s /Q "%Temp%\%~n1">nul 2>NUL
pause>NUL
goto Start
::
:Keytool2
::
::JAVA SET
if /i exist "%JAVA_HOME%\bin" goto javahome
call "%~dp0java.bat"
if /i exist "%java%\bin" goto CPNV
if /i exist "D:\Program Files\Java" goto DP
if /i exist "D:\Program Files (x86)\Java" goto DP86
goto CP
:DP
set ja=D:\Program Files\Java
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
call "%~dp0java.bat"
goto CP
:DP86
set ja=D:\Program Files\Java (x86)
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
call "%~dp0java.bat"
goto CP
:javahome
PATH %PATH%;"%JAVA_HOME%\bin"
goto Keytool22
:CPNV
PATH %PATH%;"%java%\bin"
goto Keytool22
:CP
for /d %%j in ("%java%\*") do set jkd=%%j\bin
PATH %PATH%;"%jkd%"
:Keytool22
color 0a
title %keytool01%
call "%~dp0Tools\Signer\signapk.bat"
set rem=::
cls
ECHO ______________________________________________________________________________
ECHO.
ECHO.^>^>^>%keytool03%^<^<^<
ECHO.
ECHO.
ECHO.   [1]-^>^> %keytool04%
ECHO.   [2]-^>^> %keytool11%
ECHO.
ECHO.   [3]-^>^> %keytool12% (%keytool13%:%key%)
ECHO.
ECHO.   [4]-^>^> %keytool14%
ECHO.
%rem%ECHO.            %keytool15%[%~n1%~x1]
%rem%ECHO.
ECHO.   [W]-^>^> %apkd011%   [M]-^>%apkd024%   [N]-^>%keytool17%   [X]-^>%Exit%
ECHO ______________________________________________________________________________
ECHO.     ^>^>%keytool05%
ECHO.      ^>%keytool06%: %key%
ECHO ______________________________________________________________________________
set TK=1
set /p TK= %apkd014%(%apkd015%=1)_^>^>%=%
if /i "%tk%"=="1" goto Keystore
if /i "%tk%"=="2" goto Keystore2
if /i "%tk%"=="3" copy /d /y "%~dp0Temp\signer" "%~dp0Tools\signer" >nul 2>nul&&echo set key=testkey>"%~dp0Tools\Signer\signapk.bat"&&goto keytool2
if /i "%tk%"=="W" start "" "http://idoog.me" && GOTO StartAPK
if /i "%tk%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO StartAPK
if /i "%tk%"=="4" goto Jarsigner
if /i "%tk%"=="N" goto one
if /i "%tk%"=="X" exit
goto keytool2
::
::
:Keystore2
call "%~dp0Tools\MTkeytool\keystore.bat"
ECHO.  %keytool08%^>^>%keystore%
ECHO.  %keytool09%^>^>%alias%
ECHO.  %keytool10%^>^>%Password%
ECHO.----------------------------
ECHO. 
ECHO. [Y] %keytool16%  [N] %keytool17%
ECHO. 
if not exist "%windir%\Boot" Goto XP
CHOICE /M "%apkd014%"
IF %ERRORLEVEL%==1 (
	goto tokeytool
)
goto keytool2
::
:XP
set KE=N
set /p ke= %apkd014%(%apkd015%=N)_^>^>%=%
if /i "%ke%"=="Y" goto tokeytool
if /i "%ke%"=="N" goto keytool2
goto Keystore2

::
:Keystore
set /p keystore=%keytool08%^>^>%=% 
set /p alias=%keytool09%^>^>%=% 
set /p Password=%keytool10%^>^>%=% 
ECHO.----------------------------
:tokeytool
if /i exist "%~dp0Tools\MTkeytool\%keystore%.keystore" DEL /F /Q "%~dp0Tools\MTkeytool\%keystore%.keystore">nul 2>NUL
keytool -genkey -alias "%alias%.keystore" -keyalg RSA -validity 20000 -keystore "%~dp0Tools\MTkeytool\%keystore%.keystore" -storepass "%Password%" -keypass "%Password%"||GOTO keytool2
::
echo set keystore=%Keystore%>"%~dp0Tools\MTkeytool\keystore.bat"
echo set alias=%alias%>>"%~dp0Tools\MTkeytool\keystore.bat"
echo set Password=%Password%>>"%~dp0Tools\MTkeytool\keystore.bat"
:MTkeytool
echo FileName=%keystore%.keystore>"%~dp0Tools\MTkeytool\key.ini"
echo KeystorePassword=%Password%>>"%~dp0Tools\MTkeytool\key.ini"
echo AliasName=%alias%.keystore>>"%~dp0Tools\MTkeytool\key.ini"
echo AliasPassword=%Password%>>"%~dp0Tools\MTkeytool\key.ini"
java -classpath "%~dp0Tools\MTkeytool\key_%Lang%.jar" bin.mt.keystore.KeyStoreUtil
::
move /y "%~dp0Tools\MTkeytool\keys\*.*" "%~dp0Tools\Signer\">nul 2>NUL
DEL /F /Q "%~dp0Tools\Signer\signapk.bat">nul 2>NUL
echo set key=%keystore%>>"%~dp0Tools\Signer\signapk.bat"
GOTO keytool2
::
::
::
::
:Jarsigner
call "%~dp0Tools\MTkeytool\keystore.bat"
ECHO.  %keytool08%^>^>%keystore%
ECHO.  %keytool09%^>^>%alias%
ECHO.  %keytool10%^>^>%Password%
ECHO.----------------------------
ren "%~n1%~x1" Apkdb%~x1
jarsigner -verbose -digestalg SHA1 -sigalg MD5withRSA -keystore "%~dp0Tools\MTkeytool\%keystore%.keystore" -signedjar "Apkdb_Signed%~x1" Apkdb%~x1 %alias%.keystore -storepass %Password%

ren Apkdb%~x1 "%~n1%~x1"
ren "Apkdb_Signed%~x1" "%~n1_Signed%~x1"
::-keypass %Password% 
ECHO.
ECHO.
pause>NUL
goto keytool2
::
::
::
:java
ECHO.
ECHO.  %java01%
ECHO ______________________________________________________________________________
ECHO.
ECHO.  %java02%
ECHO.
ECHO.  %java03%
ECHO.  ^>^>%ProgramFiles%\Java            [%java04% "\"]
ECHO.
DEL /F /Q /A +S +R +H +A "%~dp0java.bat">nul 2>NUL
set ja=%ProgramFiles%\Java
ECHO ______________________________________________________________________________
set /p ja=^>^>%=%
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
ECHO.     OK!
ping 127.1 -n 2 >NUL 2>NUL
goto StartAPK

::
::
::
::
:Sperbox
TASKKILL /f /IM aapt* >NUL 2>NUL&TASKKILL /f /IM adb* >NUL 2>NUL&TASKKILL /f /IM sadb* >NUL 2>NUL&TASKKILL /f /IM tadb* >NUL 2>NUL&TASKKILL /f /IM kadb* >NUL 2>NUL&TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL&TASKKILL /f /IM ShuameDaemon.exe >NUL 2>NUL&TASKKILL /f /IM shuame_helper.exe >NUL 2>NUL
set wifi2=::
set ADBwifi=ADBwifi && set Sperbox1=Sperbox1
:Sperbox1
cls
title 高级工具箱
ECHO. ================================ 高级工具箱 =================================
ECHO.
ECHO.
ECHO.         [1]-^>^> HOSTS远程更新工具
ECHO.         [2]-^>^> 配置JAVA环境变量
ECHO.         [3]-^>^> ADB 工具
ECHO.         [4]-^>^> ADB Wi-Fi 连接
ECHO.         [5]-^>^> Fastboot 工具
ECHO.         [6]-^>^> bootimg 解包打包工具
ECHO.         [7]-^>^> 关联 APK 文件
ECHO.         [8]-^>^> 替换自定义APKTOOL版本1
ECHO.         [9]-^>^> 替换自定义APKTOOL版本2
ECHO.
ECHO.
ECHO.         [E] 返回        [X] 关闭
ECHO.
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set ID=1
set /p ID= %apkd014%(%apkd015%=%ID%)_^>^>%=%
%Lang2%if /i "%id%"=="1" start "" "%~dp0Tools\Hosts\Hostsup.bat" && GOTO StartAPK
%Lang2%if /i "%id%"=="2" start "" "%~dp0Tools\JavaSet.bat" && GOTO StartAPK
%Lang2%if /i "%id%"=="3" GOTO ADBtool
%Lang2%if /i "%id%"=="4" set "bre=::" && GOTO ADBwifi
%Lang2%if /i "%id%"=="5" GOTO Fastboot
%Lang2%if /i "%id%"=="6" GOTO bootimg
%Lang2%if /i "%id%"=="7" GOTO APKinTool
%Lang2%if /i "%id%"=="8" goto diyapktools
%Lang2%if /i "%id%"=="9" goto diyapktools2
%Lang2%if /i "%id%"=="e" GOTO one
%Lang2%if /i "%id%"=="x" exit
GOTO Sperbox1
::
::
:ADBwifi
TASKKILL /f /IM aapt* >NUL 2>NUL&TASKKILL /f /IM adb* >NUL 2>NUL&TASKKILL /f /IM sadb* >NUL 2>NUL&TASKKILL /f /IM tadb* >NUL 2>NUL&TASKKILL /f /IM kadb* >NUL 2>NUL&TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL&TASKKILL /f /IM ShuameDaemon.exe >NUL 2>NUL&TASKKILL /f /IM shuame_helper.exe >NUL 2>NUL
cls
title 开启网络ADB
ECHO. =============================================================================
ECHO.
ECHO.
ECHO.  1.手机端【开发者选项】开启“网络ADB调试”
ECHO.    如果没有请下载一个APP开启，如：Wireless ADB、网络adb
ECHO.  2.手机网络与电脑必须在同一局域内才能开启。
ECHO.  3.记住IP和端口，例如：192.168.2.230:5555
ECHO.
ECHO.
ECHO.  输入：[E] 返回      [X] 关闭
ECHO. _________________________________________________________________[ idoog.me ]
ECHO.^>^>
set adb2=
set /p adb2=请输入IP和端口^>^>%=%
if /i "%adb2%"=="E" GOTO %Sperbox1%
if /i "%adb2%"=="X" exit
%adb%adb connect %adb2%
set wifi=:: && set wifi2=
%bre%ECHO.^>^>回车.开启手机黑域
:ADBwifi00
set adb2=
set /p adb2=^>^>%=%
if /i "%adb2%"=="1" GOTO brevent1
if /i "%adb2%"=="E" GOTO %ADBwifi%
if /i "%adb2%"=="X" exit
%adb%%adb2%
ECHO.^>^>
GOTO ADBwifi00
::
::
:brevent
title 手机黑域
cls
ECHO. =============================================================================
ECHO.
ECHO.  ^*.首先，手机进入“开发者选项”，开启“USB调试” 
ECHO.  ^*.然后，打开黑域，进入阅读向导
ECHO.  ^*.本工具支持 数据线模式 或者 Wi-Fi模式 开启黑域
ECHO.  ^*.本工具仅适合黑域1.3.3及之后版本
ECHO.
ECHO.       [0] 连接网络ADB (Wi-Fi)
ECHO.       [1] 开启手机黑域
ECHO.       [2] 查看崩溃日志
ECHO.       [3] 黑域服务日志
ECHO.       [4] 开启黑域服务调试日志
ECHO.       [5] 关闭黑域服务调试日志
ECHO.
ECHO. 输入：[E] 返回  [x] 关闭
ECHO.
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set ID=1
set /p ID= %apkd014%(%apkd015%=1)_^>^>%=%
%Lang2%if /i "%id%"=="0" set ADBwifi=brevent & set "bre=" & set Sperbox1=brevent && GOTO ADBwifi
%Lang2%if /i "%id%"=="1" GOTO brevent1
%Lang2%if /i "%id%"=="2" GOTO brevent2
%Lang2%if /i "%id%"=="3" GOTO brevent3
%Lang2%if /i "%id%"=="4" GOTO brevent4
%Lang2%if /i "%id%"=="5" GOTO brevent5
%Lang2%if /i "%id%"=="e" GOTO Sperbox1
%Lang2%if /i "%id%"=="x" exit
goto brevent
::
::
:brevent1
title 开启手机黑域
ECHO.^>^>
ECHO.^>^>在手机端确认授权
ping 127.1 -n 2 >NUL 2>NUL
%adb%adb devices
ECHO.^>^>正在开启黑域 (手机端打开黑域)
ping 127.1 -n 2 >NUL 2>NUL
%wifi2%%adb%adb shell sh /data/data/me.piebridge.brevent/brevent.sh
%wifi%%adb%adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh
ECHO.
ECHO.^>^>如不出意外，到此就成功了
ECHO.
ECHO.^>^>按任意键返回
pause>NUL
GOTO brevent
::
::
:brevent2
title 查看崩溃日志
ECHO.^>^>
ECHO.^>^>在手机端确认授权
ping 127.1 -n 2 >NUL 2>NUL
%adb%adb devices
%wifi2%%adb%adb logcat -d -b crash
%wifi%%adb%adb -d logcat -d -b crash
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>按任意键返回
pause>NUL
GOTO brevent
::
::
:brevent3
title 黑域服务日志
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>在手机端确认授权
ping 127.1 -n 2 >NUL 2>NUL
%adb%adb devices
%wifi2%%adb%adb logcat -d -b main -s BreventServer BreventLoader
%wifi%%adb%adb -d logcat -d -b main -s BreventServer BreventLoader
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>按任意键返回
pause>NUL
GOTO brevent
::
::
:brevent4
title 开启黑域服务调试日志
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>在手机端确认授权
ping 127.1 -n 2 >NUL 2>NUL
%adb%adb devices
%wifi2%%adb%adb shell setprop log.tag.BreventServer DEBUG
%wifi%%adb%adb -d shell setprop log.tag.BreventServer DEBUG
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>按任意键返回
pause>NUL
GOTO brevent
::
::
:brevent5
title 关闭黑域服务调试日志
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>在手机端确认授权
ping 127.1 -n 2 >NUL 2>NUL
%adb%adb devices
%wifi2%%adb%adb shell setprop log.tag.BreventServer \"\"
%wifi%%adb%adb -d shell setprop log.tag.BreventServer \"\"
ECHO.^>^>
ECHO.^>^>
ECHO.^>^>按任意键返回
pause>NUL
GOTO brevent


:ADBtool
title ADB 工具
cls
ECHO. ================================ ADB工具 ================================
ECHO. 
ECHO.   正常手动执行命令，如：adb shell
ECHO.   (进入Fastboot模式:adb reboot bootloader)
ECHO.
ECHO.   
ECHO.   输入： [A] 开启 ADB Wi-Fi 连接
ECHO.          [E] 返回     [X] 关闭
ECHO. _____________________________________________________________[ idoog.me ]
ECHO. 
:ADBtool00
set adb2=
set /p adb2= ^>^>%=%
if /i "%adb2%"=="A" GOTO ADBwifi
if /i "%adb2%"=="E" GOTO Sperbox1
if /i "%adb2%"=="X" exit
%adb%%adb2%
ECHO.^>^>
goto ADBtool00

:Fastboot
title Fastboot 工具
cls
ECHO. =============================== Fastboot ================================
ECHO. 
ECHO.   正常手动执行命令，如：fastboot devices
ECHO.   
ECHO.   (请在手机端进入Fastboot模式)
ECHO.
ECHO.   输入：[E] 返回  [X] 关闭
ECHO. _____________________________________________________________[ idoog.me ]
ECHO. 
:Fastboot00
set Fastboot=
set /p Fastboot= ^>^>%=%
if /i "%Fastboot%"=="E" GOTO Sperbox1
if /i "%Fastboot%"=="X" exit
%adb%%Fastboot%
ECHO.^>^>
goto Fastboot00
::
::

::
:bootimg
set bootimg="%~dp0Tools\bootimg\bootimg.exe"
set cd2=%CD%
setlocal
PATH="%CD%"
set rems=::
cd /d %CD%
set name2=解包:(%~n1%~x1)
if /i exist "%CD2%\initrd\" set name=打包:(boot文件)
if /i exist "%CD2%\initrd\etc\recovery.fstab" set name=打包:(recovery文件) && set rems=
if /i exist "%CD2%\boot.img" set name2=解包:(boot.img) && set rems2=
title Bootimg 解包打包工具
cls
ECHO. =============================== Bootimg ================================
ECHO. 
ECHO.   用于解包recovery.img、boot.img和打包kernel.gz、ramdisk.gz文件
ECHO. 
ECHO.    [1] 解包命令：
ECHO.                ^>^>--unpack-bootimg     %name2%
ECHO.    [2] 打包命令：
ECHO.                ^>^>--repack-bootimg     %name%
ECHO.   
ECHO.    [3] 自定义手动操作%CD%
ECHO. 
ECHO.    [E] 返回  [X] 关闭
ECHO.   
ECHO.   高通机型boot.img或recovery.img解包后均带有dt.img
ECHO.   
ECHO.   路径不能为中文^<^<^<
ECHO.   当前路径：%CD2%
ECHO.______________________________________________________________[ idoog.me ]
ECHO. 
set ID=1
set /p ID= %apkd014%(%apkd015%=1)_^>^>%=%
if /i "%id%"=="1" goto bootimg1
if /i "%id%"=="2" goto bootimg2
if /i "%id%"=="3" goto bootimg3
if /i "%id%"=="e" GOTO Sperbox1
if /i "%id%"=="x" exit
goto bootimg
:bootimg1
cls
title 解包:(%~n1%~x1)
ECHO.^>^>
rd /s /Q "%~n1" >NUL 2>NUL
md "%~n1" >NUL 2>NUL
copy /d /y %bootimg% "%CD2%\%~n1" >NUL 2>NUL
copy /d /y %1 "%CD2%\%~n1\boot.img" >NUL 2>NUL
cd /d %CD2%\%~n1
::if /i exist "%CD2%\%~n1\boot.img" ( "%CD2%\%~n1\bootimg.exe" --unpack-bootimg & goto bootimgok )
::ren "%~n1%~x1" boot.img
"%CD2%\%~n1\bootimg.exe" --unpack-bootimg
::ren boot.img "%~n1%~x1"
::if /i exist "%~n1-old%~x1" del /F /Q "%~n1-old%~x1" >NUL 2>NUL
::ren boot-old.img "%~n1-old%~x1"
:bootimgok
del /F /Q bootimg.exe >NUL 2>NUL
del /F /Q boot-old.img >NUL 2>NUL
del /F /Q boot.img >NUL 2>NUL
ECHO.^>^>...
ECHO.^>^>按任意键返回
ECHO.______________________________________________________________[ idoog.me ]
endlocal
pause>NUL
goto bootimg

:bootimg2
ECHO.^>^>
copy /d /y %bootimg% "%CD2%\" >NUL 2>NUL
bootimg.exe --repack-bootimg
del /F /Q bootimg.exe >NUL 2>NUL
%rems%if /i exist "recovery-new.img" del /F /Q recovery-new.img >NUL 2>NUL
%rems%ren boot-new.img recovery-new.img
ECHO.______________________________________________________________[ idoog.me ]
ECHO.^>^>...
ECHO.^>^>按任意键返回
endlocal
pause>NUL
goto bootimg

:bootimg3
ECHO.^>^>
ECHO.^>^>回车查看所有命令
:bootimg33
set bootimg3=
set /p bootimg3= ^>^>%=%
%rems%if /i "%bootimg3%"=="e" goto bootimg
%rems%if /i "%bootimg3%"=="x" exit
ECHO. 
copy /d /y %bootimg% "%CD2%" >NUL 2>NUL
bootimg.exe %bootimg3%
del /F /Q bootimg.exe >NUL 2>NUL
ECHO.______________________________________________________________[ idoog.me ]
goto bootimg33



:diyapktool
if /i not exist "%~dp0apktool\apktool.jar" goto diyapktools
set "ver1=ApkTool 自定义版1" && set ver2=a300sk && set "apktooljar=apktool.jar" && goto apktool

:diyapktool2
if /i not exist "%~dp0apktool\apktool2.jar" goto diyapktools2
set "ver1=ApkTool 自定义版2" && set ver2=a300sk && set "apktooljar=apktool2.jar" && goto apktool
:diyapktools
title 已选定：%~n1%~x1
cls 
ECHO. ============================= 添加自定义APKTOOL ==============================
ECHO. 
ECHO.         直接把Apktool托进来，按回车即可！
ECHO.   
ECHO.         重新添加，请到【高级菜单】里设置
ECHO. 
ECHO._______________________________________________________________________________
ECHO. 
set "choice=%1"
set /p choice=定位 ApkTool文件路径:
ECHO. 
copy /d /y "%choice%" "%~dp0apktool\apktool.jar"
ECHO. 
ECHO.___________________________________________________________________[ idoog.me ]
ECHO. 
ECHO.^>^>按任意键返回主菜单
pause>NUL
GOTO StartAPK
:diyapktools2
title 已选定：%~n1%~x1
cls 
ECHO. ============================= 添加自定义APKTOOL ==============================
ECHO. 
ECHO.         直接把Apktool托进来，按回车即可！
ECHO.   
ECHO.         重新添加，请到【高级菜单】里设置
ECHO. 
ECHO._______________________________________________________________________________
ECHO. 
set "choice=%1"
set /p choice=定位 ApkTool文件路径:
ECHO. 
copy /d /y "%choice%" "%~dp0apktool\apktool2.jar"
ECHO. 
ECHO.___________________________________________________________________[ idoog.me ]
ECHO. 
ECHO.^>^>按任意键返回主菜单
pause>NUL
GOTO StartAPK
