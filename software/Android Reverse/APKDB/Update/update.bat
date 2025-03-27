@echo off
mode con lines=31 cols=79
set dowhosts="%temp%\dowhosts.vbs"
set hosts0=http://idoog.me/apkdb/down.bat
set hosts1=http://idoog.me/apkdb/Changes
cls
cd /d "%~dp0"
color 0e
ECHO.
ECHO.==============================================================================
ECHO.
ECHO. 
ECHO. 
ECHO.                           正在检测可更新版本
ECHO.
ECHO. 
ECHO.
del /F /Q "down" >NUL 2>NUL
del /F /Q "down.*" >NUL 2>NUL
del /F /Q "%~dp0Changes" >NUL 2>NUL
::"%~dp0wget.exe" -c http://idoog.me/apkdb/down.bat -N
echo Sub download(url,target) > %dowhosts%
echo 	Const adTypeBinary = 1 >> %dowhosts%
echo 	Const adSaveCreateOverWrite = 2 >> %dowhosts%
echo 	Dim http,ado >> %dowhosts%
echo 	Set http = CreateObject("MSXML2.ServerXMLHTTP") >> %dowhosts%
echo 	http.open "GET",url,False >> %dowhosts%
echo 	http.send >> %dowhosts%
echo 	Set ado = createobject("Adodb.Stream") >> %dowhosts%
echo 	ado.Type = adTypeBinary >> %dowhosts%
echo 	ado.Open >> %dowhosts%
echo 	ado.Write http.responseBody >> %dowhosts%
echo 	ado.SaveToFile target >> %dowhosts%
echo 	ado.Close >> %dowhosts%
echo End Sub >> %dowhosts%
::
echo download "%hosts0%","%cd%\down.bat" >> %dowhosts%
echo download "%hosts1%","%cd%\Changes" >> %dowhosts%
%dowhosts%

call "%~dp0down.bat"
