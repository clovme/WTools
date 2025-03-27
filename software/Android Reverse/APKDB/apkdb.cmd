@echo off
set "folder=%1"
set sign=::&&set bsign=::&&set nsign=::&&set go=
if /i not exist "%~dp0language\Language.bat" ( copy /a /d /y "%~dp0language\Language.bat.ini" "%~dp0language\Language.bat" >nul 2>nul )
call "%~dp0language\Language.bat"
if /i not %PROCESSOR_ARCHITECTURE%==x86 set bit=64
if /i not exist "%~dp0Tools\Signer\signapk.jar" xcopy "%~dp0Temp\signer" "%~dp0Tools\signer\" /e /g /r /h /a /y >nul 2>nul
if /i not exist "%~dp0Tools\Signer\signapk.bat" echo set key=testkey>>"%~dp0Tools\Signer\signapk.bat"
if /i not exist "%~dp0apktool\default.bat" goto sa230n >NUL 2>NUL
set ZIP="%~dp0tools\7zip\%bit%\7z"
:one
call "%~dp0Tools\Signer\signapk.bat"
call "%~dp0apktool\default.bat"
set "apkdbnow="
cls
color 0c
if /i exist "%~p1apkdb.cmd" ECHO.  && ECHO.  && ECHO.  %apkd037% && ECHO. && ECHO. && pause>nul && exit
if /i exist %folder%\apktool.yml call "%~dp0apktool\default.bat"&&goto StartAPK
if /i exist %folder%\android goto smali
if /i exist %folder%\com goto smali
if /i exist %folder%\net goto smali
if /i exist %folder%\org goto smali
if /i exist %folder%\a goto smali
if /i exist %folder%\me goto smali
if /i exist %folder%\o goto smali
if /i exist %folder%\b goto smali
if /i exist %folder%\"%apkdball005%" goto apkdb_all
if /i exist %folder%\"%apkdball006%" goto apkdb_all
if /i exist %folder%\"*.apk" goto apkdb_all
if /i exist %folder%\"*.RSA" goto Keytool
if /i exist %folder%\"META-INF\*.RSA" goto Keytool
if /i exist %folder%\"original\META-INF\*.RSA" goto Keytool
if /i exist %folder%\bootinfo.txt goto bootimg
if /i exist %folder%\initrd goto bootimg
if /i exist %folder%\init goto bootimg

::
title [%~n1%~x1]
color 0e
set rem=::
set gototo=H
goto StartAPK2
::
DEL /f /Q %1\original\"AndroidManifest.xml">NUL 2>NUL
::
:StartAPK
cls
::
::
:StartAPK2
%rem%title %apkdb019% [%~n1%~x1]%apkdb019x%
%rem%color 5a
cls
ECHO. =============================================================================
ECHO.
%rem%ECHO. %apkdb038%
%rem%ECHO.
%rem%ECHO.         [1]-v2.5.0                  [2]-v3.0.0(ShakaApktool)
%rem%ECHO.         [3]-v2.0.3                  [4]-v2.0.0
%rem%ECHO.         [5]-自定义Aptoool版本1      [6]-自定义Aptoool版本2
%rem%ECHO.         [0]-ShakaApktool %shakaapktool01% ^<-
%rem%ECHO.
%rem%ECHO.         [P]-^>Apktool 2.5.0 使用APPT2构建(%aapt22%)
ECHO.
ECHO. %apkdb043%
ECHO.         [E]-^>^> %seapktool01% =^>[%seapktool00%]
%rem%ECHO.         [A]-^>^> %apkdb039%[%nosources2%]
ECHO.         [D]-^>^> %apkdb040% (Smali)
%rem%ECHO.         [K]-^>^> %keytool07%
ECHO.         [T]-^>^> %keytool01% ^<-
%rem%%Lang2%ECHO.         [J]-^>^> %apkdb045%
ECHO.         [F]-^>^> %fwk012% =^>[%f%]
%Lang2%ECHO.         [H]-^>^> 高级菜单 ^<^<^<^< ^<^<^< ^<^< ^<=
ECHO.
ECHO.         [W]-^>^> %apkd011%    [M]-^>%apkd024%
ECHO.         [U]-^>^> 检测更新    [X]-^>%Exit%
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set ID=%gototo%
%apkdbnow%set /p ID= %apkd014%(%apkd015%=%gototo%)_^>^>%=%
%rem%if /i "%id%"=="1" set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto apktool
%rem%if /i "%id%"=="2" set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && set "aapt2=" && goto apktool
%rem%if /i "%id%"=="3" set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && set "aapt2=" && goto apktool
%rem%if /i "%id%"=="4" set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && set "aapt2=" && goto apktool
%rem%if /i "%id%"=="5" goto diyapktool
%rem%if /i "%id%"=="6" goto diyapktool2
%rem%if /i "%id%"=="0" goto ShakaApktool
%rem%if /i "%id%"=="A" goto A
%rem%if /i "%id%"=="j" goto reduce
%Px%%rem%if /i "%id%"=="P" set "aapt2=--use-aapt2"&set "aapt22=%YES%"& set "Px=::"&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
%rem%if /i "%id%"=="P" set "aapt2="&set "aapt22=OFF"&%Lang2%set "aapt22=×"& set "Px="&color 0a&ping 127.1 -n 1 >NUL 2>NUL&&goto StartAPK
if /i "%id%"=="T" goto Keytool2
%rem%if /i "%id%"=="K" goto Keytool
if /i "%id%"=="E" goto seapktool
if /i "%id%"=="F" goto fwk
if /i "%id%"=="D" goto smali
if /i "%id%"=="W" start "" "http://idoog.me" && goto StartAPK2
if /i "%id%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO StartAPK2
if /i "%id%"=="X" exit
%Lang2%if /i "%id%"=="H" GOTO Sperbox
if /i "%id%"=="U" start "" "%~dp0Update\update.bat" && exit
cls
GOTO StartAPK2


::=========================================================================================================
%rem%if /i "%id%"=="1" set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto apktool
%rem%if /i "%id%"=="2" set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && goto apktool
%rem%if /i "%id%"=="3" set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && goto apktool
%rem%if /i "%id%"=="4" set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && goto apktool
::=========================================================================================================

:a230
set "ver1=ApkTool v2.5.0" && set ver2=a300sk && set "apktooljar=apktool250.jar" && goto %goooto%
:a300sk
set "ver1=ShakaApktool v3.0.0" && set ver2=a203 && set "apktooljar=apktoolsk.jar" && goto %goooto%
:a203
set "ver1=ApkTool v2.0.3" && set ver2=a200 && set "apktooljar=apktool203.jar" && goto %goooto%
:a200
set "ver1=ApkTool v2.0.0" && set ver2=ERROR && set "apktooljar=apktool200.jar" && goto %goooto%

::
::=========================================================================================================
::
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
:apktool
title %apkdb004% [%~n1%~x1.apk]
color 0d
rename %1\Xsmali smali>NUL 2>NUL
::
cls
ECHO.==========================================================
ECHO.
ECHO.
ECHO.
ECHO.  %apkdb003% %ver1%
ECHO.  
ECHO.  
ECHO.  
%go%call "%~dp0apktool\sign.bat"
%sign%rename %1\original\AndroidManifest.xml AndroidManifest2.xml>NUL 2>NUL
ECHO.
ECHO.I: %apkdb005% [%~n1%~x1.apk]
set "apkdb002x=%time:~,2%%time:~3,2%%time:~6,2%"
set "apkdb002x=%apkdb002x: =0%"
rd /s /q %1\"%apkdb001%_%apkdb002x%" >NUL 2>NUL
rd /s /q %1\"%apkdb001%_%apkdb002x%" >NUL 2>NUL
rd /s /q %1\dist\>nul 2>NUL
rd /s /q %1\build\>nul 2>NUL
java -jar "%~dp0apktool\%apktooljar%" b %aapt2% -f -c %1
if /i %ERRORLEVEL% == 1 set goooto=apktools && GOTO %ver2% 
GOTO signed
exit
::
::
::=========================================================================================================
::=========================================================================================================
::
::
::
::
::
%Xsmali%:A
color 0a
rename %1\smali Xsmali >NUL 2>NUL
set "nosources2=%YES%"
set "Xsmali=::"
goto StartAPK2
:A
color 0a
rename %1\Xsmali smali >NUL 2>NUL
set "nosources2=OFF"
%Lang2%set "nosources2=×"
set "Xsmali="
goto StartAPK2
::
:reduce
set "delang=%1"
set "reduce=::"
if not exist %delang%\res\values echo No "values" && ping 127.1 -n 2 >NUL 2>NUL && goto one
call "%~dp0Tools\reduce.bat"
goto SETOK
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
if /i "%se%"=="x" exit
if /i "%se%"=="f" goto one
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
goto one
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
:SETOK
color 0a
ECHO.
ECHO.  %OK%
ECHO.
call "%~dp0apktool\default.bat"
ping 127.1 -n 2 >NUL 2>NUL
%reduce%goto seapktool
goto one
::
::
::
::
::
:ShakaApktool
cls
title %apkd007% %~n1%~x1
ECHO.
ECHO. =========================================================================
ECHO                 ShakaApktool %shakaapktool01%
ECHO.
ECHO.    %shakaapktool04%
ECHO.    %shakaapktool15%
ECHO.    %shakaapktool16%
ECHO.    %shakaapktool10%
ECHO. 
ECHO.    %shakaapktool02%^>^>-df -f
ECHO. _____________________________________________________________[ idoog.me ]
set /p SK= ^>^>%=%
ECHO. 
ECHO.I: %apkd003%
java -jar "%~dp0apktool\apktoolsk.jar" b %1 %sk%
if /i %ERRORLEVEL% == 1 GOTO ERROR
GOTO signed
::
::
::
::
::
::
:signed
rename %1\Xsmali smali>nul 2>NUL
if /i exist %1\"%apkdb001%_%apkdb002x%" rd /s /q %1\"%apkdb001%_%apkdb002x%" >NUL 2>NUL
rename %1\build "%apkdb001%_%apkdb002x%" >NUL 2>NUL
move %1\build\apk %1\"%apkdb001%_%apkdb002x%"\  >NUL 2>NUL
move %1\dist\*.* %1\"%apkdb001%_%apkdb002x%"\ >NUL 2>NUL
rd /s /q %1\dist\ >NUL 2>NUL
rd /s /q %1\build\ >NUL 2>NUL
if /i exist %1\"%apkdb001%_%apkdb002x%\*jar" goto isjar
%sign%goto sign
%bsign%goto bsign
%nsign%goto nsign
::
ECHO.__________________________________________________________
ECHO. 
ECHO.  %apkdb012%
ECHO. 
ECHO.  %apkdb012s%
ECHO.__________________________________________________________
set sn=y
set /p sn=^>^> %apkdb020%[%apkdb021%=Y]:%=% 
if /i "%sn%"=="Y" goto sign
if /i "%sn%"=="N" goto bsign
::
:sign
cls
ECHO.__________________________________________________________
ECHO. 
title %apkdb013% %~n1%~x1.apk ...
ECHO. %apkdb013% %~n1%~x1.apk ...
set apk1=%1
cd /d %1\%apkdb001%_%apkdb002x%\
For /r %%S In (*.apk) Do (Call :signapk "%%S")
if /i %1 == () goto APKDBOK
:signapk
%ZIP% d %1 META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL
java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" %1 %apk1%\\"%apkdb001%_%apkdb002x%"\\"apkdb_signed.apk" >NUL 2>NUL
%IFF%IF %ERRORLEVEL% == 1 DEL /f /Q apkdb_signed.apk >nul 2>NUL&&set "signapk=signapk2"&&set "IFF=::"&&GOTO signapk
DEL /f /Q %1 >NUL 2>NUL
:: 不优化
ren apkdb_signed.apk "%~n1%~x1"
::if /i %ERRORLEVEL% == 1 GOTO NOAPK
::title %apkdb014% %~n1%~x1...
::ECHO. %apkdb014% %~n1%~x1...
::"%~dp0Tools\zipalign.exe" -f -v 4 %apk1%\\"%apkdb001%_%apkdb002x%"\\"apkdb_signed.apk" %1 >NUL 2>NUL
::if /i %ERRORLEVEL% == 1 GOTO nozipalign
::DEL /f /Q apkdb_signed.apk" >NUL 2>NUL
::
rename %apk1%\original\AndroidManifest2.xml AndroidManifest.xml>NUL 2>NUL
goto APKDBOK
::
::
::
::
:bsign
rename %apk1%\original\AndroidManifest2.xml AndroidManifest.xml>NUL 2>NUL
cls 
ECHO.__________________________________________________________
ECHO. 
::
set apk1=%1
cd /d %1\"%apkdb001%_%apkdb002x%\"
For /r %%Z In (*.apk) Do (Call :7ZIP "%%Z")
:7ZIP
if /i %1 == () goto APKDBOK
%ZIP% d %1 META-INF >NUL 2>NUL
%ZIP% a %1 %apk1%\original\META-INF %apk1%\original\AndroidManifest.xml >NUL 2>NUL
goto APKDBOK
::
::
:isjar
cls 
ECHO.__________________________________________________________
ECHO. 
::
set apk1=%1
cd /d %1\"%apkdb001%_%apkdb002x%\"
For /r %%j In (*.jar) Do (Call :7ZIP "%%j")
:7ZIP
if /i %1 == () goto APKDBOK
%ZIP% d %1 META-INF >NUL 2>NUL
%ZIP% a %1 %apk1%\original\META-INF %apk1%\original\AndroidManifest.xml >NUL 2>NUL
goto APKDBOK
::
::
::
:nsign
cls 
ECHO. 
ECHO.__________________________________________________________

:APKDBOK
ECHO. 
ECHO. 
ECHO.      %apkdb015%
ECHO. 
ECHO.__________________________________________________________
ECHO.
ECHO.  %apkdb011%
ECHO. 
start "" explorer.exe /select,%folder%\"%apkdb001%_%apkdb002x%"
ping 127.1 -n 2 >NUL 2>NUL
exit
if /i exist %apk1%\"%apkdb001%_%apkdb002x%" ( start "" explorer.exe /select,%apk1%\"%apkdb001%_%apkdb002x%"
)
if /i exist %folder%\"%apkdb001%_%apkdb002x%" ( start "" explorer.exe /select,%folder%\"%apkdb001%_%apkdb002x%"
)
ping 127.1 -n 2 >NUL 2>NUL
exit
::
::
::
::
:ERROR
color 0c
rename %1\Xsmali smali>nul 2>NUL
ECHO.
ECHO. =_=!!! %apkdb022%
ECHO.
ECHO.__________________________________________________________
ECHO.    
ECHO.    %apkdb023%
ECHO.    
ECHO.         ....\apktool\framework\ %apkdb024%
ECHO.    
ECHO. _________________________________________[ www.idoog.me ]
ECHO.
ECHO.
ECHO.  %apkdb025%
ECHO.
pause>nul
goto StartAPK2
exit
::
:NOAPK
color 0c
rename %1\Xsmali smali>nul 2>NUL
ECHO.
ECHO.  %apkdb026%
ECHO.
ECHO.      1.%apkdb027%
ECHO.      3.%apkdb028%/%~n1%~x1.apk！
ECHO.
ECHO.  %apkdb010%
if /i %ERRORLEVEL% == 1 copy /d /y "%~dp0Temp\signer" "%~dp0Tools\signer" >nul 2>nul&&echo set key=testkey>"%~dp0Tools\Signer\signapk.bat"
pause>nul
exit
::
:nozipalign
color 0c
rename %1\Xsmali smali>nul 2>NUL
ECHO.
ECHO. %apkdb029%
ECHO.    1.%apkdb030%[%~n1%~x1]%apkdb030x%
ECHO.    2.%apkdb031% %~n1%~x1.apk %apkdb031x%
ECHO.    %1
ECHO.
ECHO.  %apkdb010%
pause>nul
exit
::
:noapk2
cls
color 0c
ECHO.
ECHO.
ECHO. %apkdb032%
ECHO.
ECHO.  %apkdb010%
pause>nul
exit
::
::
::
::
::
REM ///////////////////////////////////////////// SMALI //////////////////////////////////////////////////
::
::
:smali
cls
title %smali002% Smali
color 1a
rename %1\Xsmali smali>NUL 2>NUL
if /i exist %1\"%~n1%~x1.jar" DEL /F /Q /A +S +R +H +A %1\"%~n1%~x1.jar">nul 2>NUL
if /i exist %1\"classes.dex" DEL /F /Q /A +S +R +H +A %1\"classes.dex">nul 2>NUL
if /i exist %1\"%~n1_classes.dex" DEL /F /Q /A +S +R +H +A "%~n1_classes.dex">nul 2>NUL
if /i exist %1\"classes.dex" DEL /F /Q /A +S +R +H +A "classes.dex">nul 2>NUL
cls
ECHO.
ECHO.==========================================================
ECHO.
ECHO.    %smali002% Smali
ECHO.    
ECHO.    %smali003%
ECHO.
ECHO.    %smali004%
ECHO.
ECHO.
ECHO.  %smali005%[ %~n1%~x1]
ECHO.==========================================================
ECHO.
ECHO.   %smali006%
java -jar "%~dp0apktool\smali.jar" assemble %1 -o "%~n1%~x1_classes.dex"
if /i %ERRORLEVEL% == 1 GOTO SMERROR
ECHO.__________________________________________________________
ECHO.
ECHO.   %smali007%
if /i exist "%cd%\%~n1%~x1.jar" goto tojar
ECHO.   %smali008% [%~n1%~x1_classes.dex]
ECHO.__________________________________________________________
ping 127.1 -n 4 >NUL 2>NUL
exit
::
:tojar
copy /d /y "%cd%\%~n1%~x1.jar" %1>NUL 2>NUL
move /y "%cd%\%~n1%~x1_classes.dex" %1\"classes.dex">NUL 2>NUL
%ZIP% d %1\"%~n1%~x1.jar" "classes.dex">NUL 2>NUL
%ZIP% a %1\"%~n1%~x1.jar" %1\"classes.dex">NUL 2>NUL
ECHO.
ECHO.  ^>^>%~n1%~x1\%~n1%~x1.jar
ECHO.__________________________________________________________
ping 127.1 -n 4 >NUL 2>NUL
exit
::
::
:tojarXXXX
ECHO.
ECHO.   [%~n1%~x1_classes.dex] Packed into [%~n1%~x1.jar] ?
ECHO.
pause
rename "%cd%\%~n1%~x1_classes.dex" "classes.dex" >NUL 2>NUL
%ZIP% d ""%cd%\%~n1%~x1.jar"" "classes.dex" >NUL 2>NUL
%ZIP% a ""%cd%\%~n1%~x1.jar"" "%cd%\classes.dex" >NUL 2>NUL
ECHO.
ping 127.1 -n 3 >NUL 2>NUL
exit
::
::
ECHO.
:SMERROR
ECHO.__________________________________________________________
ECHO.__________________________________________________________
ECHO.
ECHO.  =_=!!! %smali009%
ECHO.
ECHO.
ECHO.  %smali010%
pause>nul
exit
::
::
::
REM //////////////////////////////////////////apkdb_all///////////////////////////////////////////////////
::
:apkdb_all
TASKKILL /f /IM aapt* >NUL 2>NUL&TASKKILL /f /IM adb* >NUL 2>NUL&TASKKILL /f /IM sadb* >NUL 2>NUL&TASKKILL /f /IM tadb* >NUL 2>NUL&TASKKILL /f /IM kadb* >NUL 2>NUL&TASKKILL /f /IM sjk_daemon.exe >NUL 2>NUL&TASKKILL /f /IM ShuameDaemon.exe >NUL 2>NUL&TASKKILL /f /IM shuame_helper.exe >NUL 2>NUL
call "%~dp0apktool\default.bat"
cls
if /i not exist %1\*.apk set rem=::
if /i not exist %1\"%apkdball006%" set rem3=::
title %apkdball015%[%~n1]%apkdball015x%
color 0a
cls
ECHO.
ECHO. =============================================================================
ECHO.
%rem3%ECHO.     [1]-^>^> %apkdball018%[%~n1]%apkdball018x%
%rem3%ECHO.     [2]-^>^> %apkdball019%[%~n1]%apkdball019x%
%rem3%ECHO.
%rem%ECHO.     [A]-^>^> %apkdball017%[%~n1]%apkdball017x%
%rem%ECHO.     [F]-^>^> %apkdball020%
%rem%ECHO.     [S]-^>^> %apkdball021%[%~n1]%apkdball021x%
%rem%ECHO.
%rem%ECHO.     [B]-^>^> %optipng0%%optipng00%
%rem%ECHO.
%rem3%ECHO.     [X]-^>^> %apkdball022%
ECHO.     [?]-^>^> %apkdball023%
ECHO.
ECHO.     [D]-^>^> %seapktool01% ^<-
ECHO.     [T]-^>^> %keytool01% ^<-
%Lang2%ECHO.     [H]-^>^> 高级工具箱 ^< ^<^< ^<^<^< ^<^<^<^<-
ECHO.
ECHO.     [W]-^>^> %apkd011%       [M]-^>%apkd024%
ECHO.     [U]-^>^> 检测更新       [X]-^>%Exit%
ECHO.
ECHO. _________________________________________________________________[ idoog.me ]
ECHO. 
set all=
set /p all=^>_^< %apkdball025% ^>^>%=%
if /i "%all%"=="A" goto d
if /i "%all%"=="1" goto b
if /i "%all%"=="2" goto bx
if /i "%all%"=="F" goto res
if /i "%all%"=="S" goto setupapk
if /i "%all%"=="B" "%~dp0optipng.cmd" %1
if /i "%all%"=="?" goto apkdb_allhelp
if /i "%all%"=="C" goto bxxx
if /i "%all%"=="D" goto seapktool
if /i "%all%"=="T" goto Keytool2
if /i "%all%"=="W" start "" "http://idoog.me" && goto StartAPK2
if /i "%all%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO StartAPK2
if /i "%all%"=="X" exit
if /i "%all%"=="U" start "" "%~dp0Update\update.bat" && exit
%Lang2%if /i "%all%"=="H" GOTO Sperbox
GOTO apkdb_all
::
::
::
:d
title %apkdball029%[%~n1]%apkdball029x%
color 21
cls
ECHO.
ECHO. %apkdball030%[%~n1]%apkdball030x%
ECHO.
if /i not exist %1\%apkdball006% md %1\%apkdball006%
if /i not exist %1\%apkdball005% md %1\%apkdball005%
::
:apkb
cd /d %1
ECHO. =================================================================
for %%s in (*.apk) do title %apkdball001%[%%s]... && ECHO. %apkdball001%[%%s] && ECHO. ================================================================= && java -jar "%~dp0apktool\%apktoolx%" d -f -o %apkdball006%\%%~ns %%s && move %%s %apkdball005% && ECHO. _________________________________________________________________&& ECHO. [%%s]%apkdball003% && ECHO. && ECHO. =================================================================
title [%~n1]%apkdball031%
for %%s in (*.apk) do rd /s /q %apkdball006%\%%~ns >NUL 2>NUL
ECHO. %apkdball032%
ECHO. %apkdball033%
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball010%
ECHO.  
pause >NUL
exit
::
::
:b
title %apkdball014%[%~n1]%apkdball014x%
color 3f
if /i not exist %1\%apkdball006% goto b1
if /i exist %1\%apkdball006% goto b2
:b1
title %apkdball014%[%~n1]%apkdball014x%
cls
cd /d %1
DEL /F /Q *.apk >NUL 2>NUL
for /d %%b in (*) do rd /S /Q %%b\%apkdball008% >NUL 2>NUL
for /d %%b in (*) do ECHO. %apkdball002%[%%b] ... && if /i not exist %%b\res\%values02% ren %%b _unfinished_%%b >NUL 2>NUL
set "signapk=signapk2"
ECHO.
ECHO. =================================================================
for /d %%b in (*) do title %apkdball002%[%%b] ... && ECHO. %apkdball002%[%%b] ... && ECHO. ================================================================= && if /i not exist %%b\%apkdball008% java -jar "%~dp0apktool\%apktoolx%" b %%b && ren %%b\build %apkdball008% && move %%b\dist\*.* %%b\%apkdball008%>NUL && rd /S /Q %%b\dist>NUL && ECHO.%apkdball012% "%%b.apk" ... && cd /d %%b\%apkdball008%\ &&%ZIP% d "%%b.apk" META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL && java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" "%%b.apk" Signed_"%%b.apk" && DEL /F /Q "%%b.apk" >NUL && "%~dp0Tools\zipalign" -v 4 Signed_"%%b.apk" "%%b.apk" >NUL && DEL /F /Q Signed_"%%b.apk" && ECHO.%apkdball013% && move "%%b.apk" %1 >NUL && cd.. && cd.. && ECHO. _________________________________________________________________&& ECHO. [%%b]%apkdball004% && ECHO. && ECHO.=================================================================
ECHO.
title [%~n1]%apkdball034%
ECHO. %apkdball035%
ECHO.
ECHO. %apkdball036%
ECHO. %apkdball037%[%~n1]%apkdball037x%
ECHO.__________________________________________________________________
dir *.apk /b
ECHO.__________________________________________________________________
ECHO.
ECHO. 
ECHO. %apkdball010%
pause >NUL
exit
::
:b2
title %apkdball014%[%~n1]%apkdball014x%
cls
cd /d %1\%apkdball006%\
DEL /F /Q *.apk >NUL 2>NUL
set "signapk=signapk2"
for /d %%b in (*) do rd /S /Q %%b\%apkdball008% >NUL 2>NUL
for /d %%b in (*) do ECHO. %apkdball002%[%%b] ... && if /i not exist %%b\res\%values02% ren %%b _unfinished_%%b >NUL 2>NUL
ECHO. =================================================================
for /d %%b in (*) do title %apkdball002%[%%b] ... && ECHO. %apkdball002%[%%b] ... && ECHO. ================================================================= && if /i not exist %%b\%apkdball008% java -jar "%~dp0apktool\%apktoolx%" b %%b && ren %%b\build %apkdball008% && move %%b\dist\*.* %%b\%apkdball008%>NUL && rd /S /Q %%b\dist>NUL && ECHO.%apkdball012% "%%b.apk" ... && cd /d %%b\%apkdball008%\ &&%ZIP% d "%%b.apk" META-INF/*.RSA META-INF/*.SF  META-INF/*.MF >nul 2>NUL && java -jar "%~dp0Tools\Signer\%signapk%.jar" "%~dp0Tools\Signer\%key%.x509.pem" "%~dp0Tools\Signer\%key%.pk8" "%%b.apk" Signed_"%%b.apk" && DEL /F /Q "%%b.apk" >NUL && "%~dp0Tools\zipalign" -v 4 Signed_"%%b.apk" "%%b.apk" >NUL && DEL /F /Q Signed_"%%b.apk" && ECHO.%apkdball013% && move "%%b.apk" %1\%apkdball006%\ >NUL && cd.. && cd.. && ECHO. _________________________________________________________________&& ECHO. [%%b]%apkdball004% && ECHO. && ECHO.=================================================================
ECHO.
title %apkdball034%
ECHO. %apkdball035%
ECHO.
ECHO.
ECHO. %apkdball036%
ECHO. %apkdball037%[%~n1]%apkdball037x%
ECHO.__________________________________________________________________
dir *.apk /b
ECHO.__________________________________________________________________
ECHO.
ECHO.
ECHO. 
ECHO. %apkdball010%
pause >NUL
exit
::
::
:bx
title %apkdball014%[%~n1]%apkdball014x%
color 30
if /i not exist %1\%apkdball006% goto b1x
if /i exist %1\%apkdball006% goto b2x
:b1x
cls
cd /d %1
DEL /F /Q *.apk >NUL 2>NUL
for /d %%b in (*) do rd /S /Q %%b\%apkdball008% >NUL 2>NUL
for /d %%b in (*) do rename %%b\smali Xsmali>nul 2>NUL
for /d %%b in (*) do if /i not exist %%b\res\%values02% ren %%b _unfinished_%%b >NUL 2>NUL
ECHO.
ECHO. %apkdball038%[%~n1]%apkdball038x%
ECHO.
ECHO. =================================================================
for /d %%b in (*) do title %apkdball002%[%%b] ... && ECHO. %apkdball002%[%%b] ... && ECHO. ================================================================= && if /i not exist %%b\%apkdball008% java -jar "%~dp0apktool\%apktoolx%" b %%b && move %%b\build\apk %%b\>nul && rename %%b\apk %apkdball008%>nul && rd /S /Q %%b\dist >NUL && rd /s /q %%b\build\>nul && ECHO. _________________________________________________________________&& ECHO. [%%b]%apkdball004% && ECHO. && ECHO.================================================================= && rename %%b\Xsmali smali >nul 2>NUL
for /d %%b in (*) do if /i not exist %%b\%apkdball008% ren %%b _Failure_%%b >NUL && rd /S /Q _Failure_%%b\build >NUL 2>NUL
title %apkdball034%
ECHO. %apkdball035%
ECHO.
ECHO. %apkdball036%
ECHO. %apkdball039%
ECHO.__________________________________________________________________
ECHO.
ECHO. 
ECHO. %apkdball010%
pause >NUL
exit
::
:b2x
title %apkdball014%[%~n1]%apkdball014x%
cls
cd /d %1\%apkdball006%\
DEL /F /Q *.apk >NUL
for /d %%b in (*) do rd /S /Q %%b\%apkdball008% >NUL 2>NUL
for /d %%b in (*) do rename %%b\smali Xsmali>nul 2>NUL
for /d %%b in (*) do ECHO. %apkdball002%[%%b] ... && if /i not exist %%b\res\%values02% ren %%b _unfinished_%%b >NUL 2>NUL
ECHO.
ECHO. =================================================================
for /d %%b in (*) do title %apkdball002%[%%b] ... && ECHO. %apkdball002%[%%b] ... && ECHO. ================================================================= && if /i not exist %%b\%apkdball008% java -jar "%~dp0apktool\%apktoolx%" b %%b && move %%b\build\apk %%b\>nul && rename %%b\apk %apkdball008%>nul && rd /S /Q %%b\dist >NUL && rd /s /q %%b\build\>nul && ECHO. _________________________________________________________________&& ECHO. [%%b]%apkdball004% && ECHO. && ECHO.=================================================================
for /d %%b in (*) do rename %%b\Xsmali smali>nul 2>NUL
title %apkdball034%
ECHO. %apkdball035%
ECHO.
ECHO.
ECHO. %apkdball036%
ECHO. %apkdball039%
ECHO.__________________________________________________________________
ECHO.
ECHO. 
ECHO. %apkdball010%
pause >NUL
exit
::
::
:bxxx
title %apkdball014%[%~n1]%apkdball014x%
color 30
if /i not exist %1\%apkdball005% goto b1x
if /i not exist %1\%apkdball006% goto b1x
if /i not exist %1\%apkdball009% MD %1\%apkdball009%
if /i not exist %1\%apkdball007% MD %1\%apkdball007%
copy %1\%apkdball005%\*.* %1\%apkdball007%\*.* >NUL 2>NUL
cd /d %1\%apkdball005%
for %%a in (*.apk) do rename %%~na.apk %%~na.zip >NUL && %ZIP% u %%~na.zip %1\%apkdball006%\%%~na\%apkdball008%\*
for %%a in (*.zip) do rename %%a %%~na.apk && move %%~na.apk %1\%apkdball009%\ >NUL 2>NUL
ECHO. 
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball010%
pause >NUL
exit
::
:bxxx2
if /i not exist %1\%apkdball006%\%%~na\%apkdball008%\apk\resources.arsc goto bxxx2
if /i not exist %1\%apkdball009% MD %1\%apkdball009%
if /i not exist %1\%apkdball007% MD %1\%apkdball007%
copy %1\%apkdball005%\*.* %1\%apkdball007%\*.* >NUL 2>NUL
cd /d %1\%apkdball005%
for %%a in (*.apk) do rename %%~na.apk %%~na.zip >NUL && %ZIP% u %%~na.zip %1\%apkdball006%\%%~na\%apkdball008%\apk\*
for %%a in (*.zip) do rename %%a %%~na.apk && move %%~na.apk %1\%apkdball009%\ >NUL 2>NUL
ECHO. 
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball010%
pause >NUL
exit
::
:b1x
cls
ECHO. 
ECHO.
ECHO. %apkdball040%
ECHO.
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball011%
pause >NUL
goto apkdb_all
::
::
:setupapk
title %apkdball041%[%~n1]%apkdball041x%
color 1b
cls
if /i not exist %1\*.apk goto apkdb_allnapk2
if /i exist %1\*.apk goto install
::
:install
ECHO.
ECHO.
ECHO. %apkdball042%
ECHO. %apkdball043%
ECHO.
ECHO. %apkdball044%
pause >NUL
cls
ECHO.
ECHO. %apkdball045%[%~n1]%apkdball045x%
ECHO.
cd /d %1
ECHO. =================================================================
for %%q in (*.apk) do title %apkdball046%[%%q]... && ECHO. %apkdball046%[%%q]... && ECHO. ================================================================= && "%~dp0Tools\ADB\adb.exe" install %%q && ECHO. _________________________________________________________________&& ECHO. [%%q]%apkdball047% && ECHO. && ECHO. && ECHO. =================================================================
title [%~n1]%apkdball048%
ECHO.
ECHO.
ECHO. 
ECHO. %apkdball010%
pause >NUL
exit
::
::
:res
cls
color 5e
if /i not exist %1\*.apk goto apkdb_allnapk2
if /i not exist %1\framework-res.apk goto noframework
if /i exist %1\*.apk goto res2
if /i not exist "%USERPROFILE%\AppData\Local\apktool\framework" ( md "%USERPROFILE%\AppData\Local\apktool\framework" )
:res2
cd /d %1
ECHO. =================================================================
for %%q in (*.apk) do title %apkdball049% && ECHO. %apkdball050%[%%q]%apkdball050x% && ECHO. ================================================================= && java -jar "%~dp0apktool\%apktoolx%" if /i %%q && ECHO. _________________________________________________________________ 
title %apkdball051%
ECHO.
ECHO.  
ECHO.  :) %apkdball052%
ECHO.
ECHO.  %apkdball053%
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball010%
pause >NUL
exit
::
::
:noframework
color 0c
cls
ECHO.
ECHO.
ECHO. %apkdball054%
ECHO.    %apkdball055%
ECHO.
ECHO. %apkdball056%
ECHO.__________________________________________________________________
ECHO.
set /p NF= ^>^>%apkdball07%:%=% 
if /i "%nf%"=="Y" goto res2
if /i "%nf%"=="y" goto res2
goto apkdb_all
::
::
:apkdb_allnapk
color 0c
cls
ECHO.
ECHO.
ECHO.
ECHO. %apkdball058%
ECHO.
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball011%
pause >NUL
goto apkdb_all
::
::
:apkdb_allnapk2
color 0c
cls
ECHO.
ECHO.
ECHO.
ECHO. %apkdball059%
ECHO.
ECHO.__________________________________________________________________
ECHO.
ECHO. %apkdball011%
pause >NUL
goto apkdb_all
::
::
:apkdb_allhelp
color f0
cls
ECHO.
ECHO.[1]%apkdball060%
ECHO. =================================================================
ECHO. %apkdball061%
ECHO. %apkdball062%
ECHO. %apkdball063%
ECHO. _________________________________________________________________
ECHO.
ECHO.
ECHO.[2]%apkdball064%
ECHO. =================================================================
ECHO. %apkdball065%
ECHO. %apkdball066%
ECHO. %apkdball067%
ECHO. %apkdball068%
ECHO.
ECHO. %apkdball069%
ECHO. %apkdball070%
ECHO. _________________________________________________________________
ECHO.
ECHO.
ECHO.[3]%apkdball071%
ECHO. =================================================================
ECHO. %apkdball072%
ECHO. %apkdball073%
ECHO. %apkdball074%
ECHO. %apkdball068%
ECHO.
ECHO. %apkdball069%
ECHO. %apkdball070%
ECHO. _________________________________________________________________
ECHO.
ECHO.
ECHO.[4]%apkdball075%
ECHO. =================================================================
ECHO. %apkdball076%
ECHO. %apkdball077%
ECHO. %apkdball078%
ECHO. %apkdball079%
ECHO. %apkdball080%
ECHO. 
ECHO.__________________________________________________________________
ECHO.
ECHO.[5]%apkdball081%
ECHO. =================================================================
ECHO. %apkdball082%
ECHO. %apkdball083%
ECHO. 
ECHO. _________________________________________________________________
ECHO.
ECHO.[x]%apkdball084%
ECHO. =================================================================
ECHO. %apkdball085%
ECHO. %apkdball086%
ECHO. %apkdball087%
ECHO. %apkdball088%
ECHO. 
ECHO.__________________________________________________________________
ECHO. 
ECHO.                       2016-1-8  @Soyu_Zom
ECHO.__________________________________________________________________
ECHO. 
ECHO. %apkdball011%
pause >NUL
goto apkdb_all
::
::
::
::
REM //////////////////////////////////////////////Keytool/////////////////////////////////////////////////
::
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
title %keytool07%
cls
ECHO. 
ECHO. 
ECHO.^>^>%keytool02%:
ECHO _______________________________________________________________________________
if /i exist %1\*.RSA ECHO. && keytool -file %1\*.RSA -printcert ||GOTO java
if /i exist %1\META-INF\*.RSA ECHO. && keytool -file %1\META-INF\*.RSA -printcert ||GOTO java
if /i exist %1\original\META-INF\*.RSA ECHO. && keytool -file %1\original\META-INF\*.RSA -printcert ||GOTO java
ECHO. 
ECHO _________________________________________________________________________^<End^<-
pause>NUL
goto StartAPK2
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
DEL /F /Q /A +S +R +H +A "%~dp0java.bat">nul 2>NUL
set ja=D:\Program Files\Java
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
call "%~dp0java.bat"
goto CP
:DP86
DEL /F /Q /A +S +R +H +A "%~dp0java.bat">nul 2>NUL
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
%rem%ECHO.   [4]-^>^> %keytool14%
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
%rem%if /i "%tk%"=="4" goto Jarsigner
if /i "%tk%"=="W" start "" "http://idoog.me" && GOTO StartAPK
if /i "%tk%"=="M" start "" "%~dp0Icon\wxzf.jpg" && GOTO StartAPK
if /i "%tk%"=="N" goto one
if /i "%tk%"=="X" exit
goto keytool2
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
if /i not exist "%windir%\Boot" Goto XP
CHOICE /M "%apkd014%"
if /i %ERRORLEVEL%==1 (
	goto tokeytool
)
goto keytool2
::
:XP
set KE=N
set /p ke= %apkd014%(%apkd015%=N)_^>^>%=%
if /i "%ke%"=="Y" goto tokeytool
if /i "%ke%"=="y" goto tokeytool
if /i "%ke%"=="N" goto keytool2
if /i "%ke%"=="n" goto keytool2
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
echo set key=%keystore%>"%~dp0Tools\Signer\signapk.bat"
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
jarsigner -digestalg SHA1 -sigalg MD5withRSA -verbose -keystore "%~dp0Tools\MTkeytool\%keystore%.keystore" -signedjar %~n1_Signed.apk %1 %alias%.keystore -storepass %Password%
::-keypass %Password% 
goto keytool2
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
set ja=%ProgramFiles%\Java
ECHO ______________________________________________________________________________
set /p ja=^>^>%=%
echo @echo off>"%~dp0java.bat"
echo set java=%ja%>>"%~dp0java.bat"
ECHO.     OK!
ping 127.1 -n 2 >NUL 2>NUL
goto StartAPK2
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
ECHO.^>^>
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
::
::
:bootimg
color 0a
set bootimg="%~dp0Tools\bootimg\bootimg.exe"
set rems=::
set rems2=::
set CD2=%1
if /i exist %1\init set CD2="%CD%"
if /i exist %CD2%\initrd set name=打包:(boot文件)
if /i exist %CD2%\initrd\etc\recovery.fstab set name=打包:(recovery文件) && set rems=
if /i exist %CD2%\boot.img set name2=解包:(boot.img) && set rems2=
cd /d %CD2%
title Bootimg 解包打包工具
cls
ECHO. =============================== Bootimg ================================
ECHO. 
ECHO.   用于解包recovery.img、boot.img和打包kernel.gz、ramdisk.gz文件
ECHO. 
%rems2%ECHO.    [1] 解包命令：
%rems2%ECHO.                ^>^>--unpack-bootimg     %name2%
ECHO.    [2] 打包命令：
ECHO.                ^>^>--repack-bootimg     %name%
ECHO.   
ECHO.    [3] 自定义手动操作
ECHO.   
ECHO.    [E] 返回  [X] 关闭
ECHO.   
ECHO.   高通机型boot.img或recovery.img解包后均带有dt.img
ECHO.   recovery.img、boot.img 打包后名称：boot-new.img
ECHO.   
ECHO.   路径不能为中文：
ECHO.   当前路径：%CD2%
ECHO.______________________________________________________________[ idoog.me ]
ECHO. 
set ID=2
set /p ID= %apkd014%(%apkd015%=2)_^>^>%=%
%rems2%if /i "%id%"=="1" goto bootimg1
if /i "%id%"=="2" goto bootimg2
if /i "%id%"=="3" goto bootimg3
if /i "%id%"=="e" GOTO Sperbox1
if /i "%id%"=="x" exit
goto bootimg
:bootimg1
ECHO.^>^>
copy /d /y %bootimg% %CD2% >NUL 2>NUL
bootimg.exe --unpack-bootimg
:bootimgok
del /F /Q bootimg.exe >NUL 2>NUL
ECHO.______________________________________________________________[ idoog.me ]
cls
ECHO.^>^>...
ECHO.^>^>按任意键返回
pause>NUL
goto bootimg

:bootimg2
cls
ECHO.^>^>
set rems=::
if /i exist %CD2%\initrd\etc\recovery.fstab set name=recovery-new.img & set rems=
copy /d /y %bootimg% %CD2% >NUL 2>NUL
bootimg.exe --repack-bootimg
del /F /Q bootimg.exe >NUL 2>NUL
%rems%if /i exist %CD2%\recovery-new.img del /F /Q recovery-new.img >NUL 2>NUL
%rems%ren boot-new.img recovery-new.img
ECHO.^>^>...
ECHO.^>^>按任意键返回
ECHO.______________________________________________________________[ idoog.me ]
pause>NUL
goto bootimg

:bootimg3
ECHO.^>^>
ECHO.^>^>回车查看所有命令
:bootimg33
set bootimg3=
set /p bootimg3= ^>^>%=%
if /i "%bootimg3%"=="e" goto bootimg
if /i "%bootimg3%"=="x" exit
ECHO. 
copy /d /y %bootimg% %CD2% >NUL 2>NUL
bootimg.exe %bootimg3%
del /F /Q bootimg.exe >NUL 2>NUL
ECHO.______________________________________________________________[ idoog.me ]
set bootimg3=
goto bootimg33


:diyapktool
if /i not exist "%~dp0apktool\apktool.jar" goto diyapktools
set "ver1=ApkTool 自定义版1" && set ver2=a300sk && set "apktooljar=apktool.jar" && goto apktool

:diyapktool2
if /i not exist "%~dp0apktool\apktool2.jar" goto diyapktools2
set "ver1=ApkTool 自定义版2" && set ver2=a300sk && set "apktooljar=apktool2.jar" && goto apktool
:diyapktools
cls 
ECHO. ============================= 添加自定义APKTOOL ==============================
ECHO. 
ECHO.         直接把Apktool托进来，按回车即可！
ECHO.   
ECHO.         重新添加，请到【高级菜单】里设置
ECHO. 
ECHO._______________________________________________________________________________
ECHO. 
set choice=
set /p choice=定位 ApkTool文件路径:
ECHO. 
copy /d /y "%choice%" "%~dp0apktool\apktool.jar"
ECHO. 
ECHO.___________________________________________________________________[ idoog.me ]
ECHO. 
ECHO.^>^>按任意键返回主菜单
pause>NUL
GOTO StartAPK2
:diyapktools2
cls 
ECHO. ============================= 添加自定义APKTOOL ==============================
ECHO. 
ECHO.         直接把Apktool托进来，按回车即可！
ECHO.   
ECHO.         重新添加，请到【高级菜单】里设置
ECHO. 
ECHO._______________________________________________________________________________
ECHO. 
set choice=
set /p choice=定位 ApkTool文件路径:
ECHO. 
copy /d /y "%choice%" "%~dp0apktool\apktool2.jar"
ECHO. 
ECHO.___________________________________________________________________[ idoog.me ]
ECHO. 
ECHO.^>^>按任意键返回主菜单
pause>NUL
GOTO StartAPK2

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
set /p FR= ^>^>%apkd014%(%apkd015%=%FR%):%=%
::
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
