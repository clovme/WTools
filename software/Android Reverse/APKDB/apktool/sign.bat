@echo off
ECHO.  --------------------------------------------------------
ECHO.  %apkdb012%
ECHO.  [N]����ǩ��(��ǩ��)   [D]�趨�Ҽ�ֱ�ӱ���(%KQ%)
ECHO. 
ECHO.  %apkdb012s%
ECHO. _____________________________________________[ idoog.me ]
:ret
set SN=y
set /p SN=^>^> %apkdb020%[%apkdb021%=Y]:%=% 
if /i "%SN%"=="Y" set "sign="&set "go=::"&goto go
if /i "%SN%"=="N" set "nsign="&set "go=::"&goto go
if /i "%SN%"=="B" set "bsign="&set "go=::"&goto go
if /i "%SN%"=="d" goto apkdbnow
goto ret
:apkdbnow
%KQ1%goto apkdbnow2

:apkdbnow1
(
echo set "apkdbnow=::"
echo set "KQ=�ѿ���"
echo set "KQ1="
)>>"%~dp0default.bat"
exit
::
::
:apkdbnow2
(
echo set "apkdbnow="
echo set "KQ=δ����"
echo set "KQ1=::"
)>>"%~dp0default.bat"
exit
::
::
:go
