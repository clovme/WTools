@ECHO ON
@ECHO OFF
title ʹ��"%~dp0ffmpeg"����ֱ������ת����MP4  ����q����ֹͣ���� 
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
ECHO.  [1] ת����ƵΪMP4
ECHO.  [2] ת����ƵΪMP3
ECHO.  [Y] ѹ����Ƶ
ECHO.  [N] ��ѹ��
ECHO.  
set "MU=1"
set /p MU=����ѡ��(�س���=1):%=% 
::
if /i %MU%==1 goto :2mp4
if /i %MU%==2 goto :mp3
if /i %MU%==y set "cp=" && goto :vf
if /i %MU%==N set "vd=" && set "vf=" &&set "wh=" &&  goto :ct
goto :menu

:2mp4
title ���ڽ�"%~n1%~x1" ת����.mp4  ����q����ֹͣ
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
ECHO. ��ת����ɡ�
ECHO. 
ECHO.
REN "%TempMP4%.mp4" "%local%.mp4"
ping 127.1 -n 3 >NUL 2>NUL
::del /f /q %flv%
del /f /q "Temp%~x1" >NUL 2>NUL
exit


:: ѹ��
��ȹ̶�400���߶ȳɱ�����
ffmpeg -i input.avi -vf scale=400:-2

�෴�أ��߶ȹ̶�300����ȳɱ�����
ffmpeg -i input.avi -vf scale=-2:300
	
-s 1280x720  -b 600k

"%~dp0ffmpeg" -i C:\Users\10375\Desktop\learner-demo.m4v -b:v 400k -s 1280x720 newfiles/learner-demo.mp4
::"%~dp0ffmpeg" -i %flv% -s 1280x720 "%local%2.mp4"

:ymp4
title ׼��ѹ��"%~n1%~x1"
ECHO  _______________________________________________________
ECHO.


ECHO.  
set "YS=N"
set /p YS=�Ƿ�ѹ����Ƶ[Y/N](�س���=N):%=% 
::
if /i %YS%==y set "cp=" && goto :vf
if /i %YS%==N set "vd=" && set "vf=" &&set "wh=" &&  goto :ct
if /i %YS%==M goto :mp3
ECHO.
ECHO.
ECHO.  �߶ȣ� 480  576  720  1080
ECHO.
ECHO.
:vf
set "vd= -vcodec libx264 -preset:v fast"
set "vf= -vf scale=-2:"
set "wh=720"
set /p "wh=ѹ������(Ĭ��720):"

:ct
ECHO. 
ECHO. 
set "cp= -c:a copy -c:v copy -bsf:a aac_adtstoasc"
set "ss= -ss "
set "tt=0"
set /p "tt=��ʼʱ��(Ĭ��0��):"

ECHO.
REN "%~n1%~x1" "Temp%~x1"
::"%~dp0ffmpeg" -i "Temp%~x1" -s %wh% "Temp%wh%.mp4"

title ����ѹ��"%~n1%~x1" ����q����ֹͣ
"%~dp0ffmpeg"%ss%%tt% -i "Temp%~x1"%cp%%vd%%vf%%wh% "Tempwh%wh%.mp4"
IF %ERRORLEVEL% == 1 GOTO ERROR
goto :end2

:mp3
::"%~dp0ffmpeg" -i "%~n1%~x1" %~n1.mp3 && ECHO.��ɣ�&&Pause

cls
title ����ת��"%~n1%~x1" Ϊ MP3

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
ECHO. ��ת����ɡ�
ECHO. 
ECHO.
REN "%TempMP3%.mp4" "%local%.mp4"
REN "%TempMP3%.mp3" "%local%.mp3"
ping 127.1 -n 3 >NUL 2>NUL
::del /f /q %flv%
::del /f /q "Temp%~x1" >NUL 2>NUL
exit


:ERROR
title ������~��
ECHO.
ECHO.   ������~��
ECHO. 
ECHO.
ECHO.  �밴������ٴ�����
ECHO.
ECHO. ���� X ֱ�ӹرա�
ECHO.
del /f /q "Tempxh%wh%.mp4" >NUL 2>NUL
REN "Temp%~x1" "%~n1%~x1" >NUL 2>NUL
ping 127.1 -n 10 >NUL 2>NUL
Pause>NUL 2>NUL

exit
