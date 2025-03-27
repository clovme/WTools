@ECHO ON
@ECHO OFF
title 使用"%~dp0ffmpeg"下载直播流并转换成MP4  按【q键】停止下载 
cls
color 5f

set "local=%~n1"
set "TempMP4=TempMP4"
set "TempMP3=TempMP3"
ECHO.
goto :menu
if /i "%ex%"==".flv" goto 2mp4
if /i "%ex%"==".mp4" goto ymp4
if /i "%ex%"==".MOV" goto ymp4

:menu
ECHO.
ECHO.  [1] 转换视频为MP4
ECHO.  [2] 转换视频为MP3
ECHO.  [Y] 压缩视频
ECHO.  [N] 不压缩
ECHO.  
set "MU=1"
set /p MU=输入选项(回车键=1):%=% 
::
if /i %MU%==1 goto :2mp4
if /i %MU%==2 goto :mp3
if /i %MU%==y set "cp=" && goto :vf
if /i %MU%==N set "vd=" && set "vf=" &&set "wh=" &&  goto :ct
goto :menu

:2mp4
title 正在将"%~n1%~x1" 转换成.mp4  按【q键】停止
if /i exist "%local%.mp4" set "local=%~n1_2"
if /i exist "%local%_2.mp4" set "local=%~n1_3"
if /i exist "%local%_3.mp4" set "local=%~n1_4"

if /i exist "TempMP4.mp4" set "TempMP4=TempMP4_2"
if /i exist "TempMP4_2.mp4" set "TempMP4=TempMP4_3"
if /i exist "TempMP4_3.mp4" set "TempMP4=TempMP4_4"

::"%~dp0ffmpeg.exe" -i %flv% -vcodec copy -acodec copy "%local%.mp4"

REN "%~n1%~x1" "Temp%~x1"
"%~dp0ffmpeg" -i "Temp%~x1" -c:a copy -c:v copy -bsf:a aac_adtstoasc "%TempMP4%.mp4"
IF %ERRORLEVEL% == 1 GOTO ERROR
goto :end

:end
ECHO.
ECHO. 【转换完成】
ECHO. 
ECHO.
REN "%TempMP4%.mp4" "%local%.mp4"
ping 127.1 -n 3 >NUL 2>NUL
::del /f /q %flv%
del /f /q "Temp%~x1" >NUL 2>NUL
exit


:: 压缩
宽度固定400，高度成比例：
ffmpeg -i input.avi -vf scale=400:-2

相反地，高度固定300，宽度成比例：
ffmpeg -i input.avi -vf scale=-2:300
	
-s 1280x720  -b 600k

"%~dp0ffmpeg" -i C:\Users\10375\Desktop\learner-demo.m4v -b:v 400k -s 1280x720 newfiles/learner-demo.mp4
::"%~dp0ffmpeg" -i %flv% -s 1280x720 "%local%2.mp4"

:ymp4
title 准备压缩"%~n1%~x1"
ECHO  _______________________________________________________
ECHO.


ECHO.  
set "YS=N"
set /p YS=是否压缩视频[Y/N](回车键=N):%=% 
::
if /i %YS%==y set "cp=" && goto :vf
if /i %YS%==N set "vd=" && set "vf=" &&set "wh=" &&  goto :ct
if /i %YS%==M goto :mp3
ECHO.
ECHO.
ECHO.  高度： 480  576  720  1080
ECHO.
ECHO.
:vf
set "vd= -vcodec libx264 -preset:v fast"
set "vf= -vf scale=-2:"
set "wh=720"
set /p "wh=压缩比例(默认720):"

:ct
ECHO. 
ECHO. 
set "cp= -c:a copy -c:v copy -bsf:a aac_adtstoasc"
set "ss= -ss "
set "tt=0"
set /p "tt=开始时间(默认0秒):"

ECHO.
REN "%~n1%~x1" "Temp%~x1"
::"%~dp0ffmpeg" -i "Temp%~x1" -s %wh% "Temp%wh%.mp4"

title 正在压缩"%~n1%~x1" 按【q键】停止
"%~dp0ffmpeg"%ss%%tt% -i "Temp%~x1"%cp%%vd%%vf%%wh% "Tempwh%wh%.mp4"
IF %ERRORLEVEL% == 1 GOTO ERROR
goto :end2

:mp3
::"%~dp0ffmpeg" -i "%~n1%~x1" %~n1.mp3 && ECHO.完成！&&Pause

cls
title 正在转换"%~n1%~x1" 为 MP3

if /i exist "%local%.mp3" set "local=%~n1_2"
if /i exist "%local%_2.mp3" set "local=%~n1_3"
if /i exist "%local%_3.mp3" set "local=%~n1_4"

if /i exist "TempMP3.mp4" set "TempMP3=TempMP3_2"
if /i exist "TempMP3_2.mp4" set "TempMP3=TempMP3_3"
if /i exist "TempMP3_3.mp4" set "TempMP3=TempMP3_4"


REN "%~n1%~x1" "TempMP3%~x1"
"%~dp0ffmpeg" -i "TempMP3%~x1" "%TempMP3%.mp3"
IF %ERRORLEVEL% == 1 GOTO ERROR
goto :end

:end
ECHO.
ECHO. 【转换完成】
ECHO. 
ECHO.
REN "%TempMP3%.mp4" "%local%.mp4"
REN "%TempMP3%.mp3" "%local%.mp3"
ping 127.1 -n 3 >NUL 2>NUL
::del /f /q %flv%
::del /f /q "Temp%~x1" >NUL 2>NUL
exit


:ERROR
title 出错啦~！
ECHO.
ECHO.   出错啦~！
ECHO. 
ECHO.
ECHO.  请按任意键再次下载
ECHO.
ECHO. 【点 X 直接关闭】
ECHO.
del /f /q "Tempxh%wh%.mp4" >NUL 2>NUL
REN "Temp%~x1" "%~n1%~x1" >NUL 2>NUL
ping 127.1 -n 10 >NUL 2>NUL
Pause>NUL 2>NUL

exit
