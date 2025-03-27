@echo off

rem Start-up script for JEB (Windows Console)
set JVMOPT=
if exist "%~dp0jvmopt.txt" set /p JVMOPT=<"%~dp0jvmopt.txt"
rem Manual override for JVM options: uncomment the following line and adjust if necessary
rem set JVMOPT=-Xss4M -Xmx8G

rem Used to circumvent the double-quote in var issue with Batch scripts
set argCount=0
for %%x in (%*) do set /A argCount+=1

rem Prefer local JRE
set JAVA=bin\runtime\bin\java.exe
if exist %JAVA% goto :runinst

rem Prefer a JDK over a JRE
if defined JAVA_HOME (set base="%JAVA_HOME%\bin") else (set base="%SystemRoot%\System32")
set JAVA=%base%\java.exe

rem Note: If the Java path generation does not yield a correct result, manually set
rem the JAVA variable (defined above) to a correct value
if exist %JAVA% goto :runinst
for /F "delims=" %%i in ('where java') do set JAVA="%%i"
if exist %JAVA% goto :runinst
echo JEB requires a Java JRE or JDK version 8 or above.
echo It is also recommended to set JAVA_HOME and JRE_HOME environment variables to point to your JDK
exit /b -1

:runinst
set INSTALLER="%~dp0bin\app\jebi.jar"
if exist %INSTALLER% goto :runinst2
set INSTALLER_NEW="%~dp0bin\app\jebi.jar.new"
if not exist %INSTALLER_NEW% goto :runinst3
move %INSTALLER_NEW% %INSTALLER% >nul
goto :runinst2
:runinst3
echo The JEB Installer (jebi.jar) was not found!
exit /b -1
:runinst2
%JAVA% -jar %INSTALLER% --di --up --timeout=0 -- %*
if errorlevel 0 goto :runjeb
exit /b -1

:runjeb
if "%argCount%" == "0" goto :startjeb
if %1 == -c goto :startraw

if %1 == -j goto :runjar
REM Note: -j, if present, is not shifted out (unlike what a cleaner jeb_linux.sh does)
REM It is okay though: AbstractClientContext.parseCommandLineArguments() cleans it out

:startjeb
set JEB="%~dp0bin\jeb.exe"
if exist %JEB% goto :runlauncher
:runjar
%JAVA% %JVMOPT% -jar "%~dp0bin\app\jebc.jar" %*
exit 0
:runlauncher
REM echo Starting JEB Desktop Client...
REM echo (If you are experiencing problems on your system or, use the -j flag: jeb_wincon.bat -j)
REM start "" %JEB% --cd="%CD%" %*
REM NOTE: JVM options (jvmopt.txt) are provided to the UI client by the installer (jebi.jar)
%JAVA% -jar %INSTALLER% --start-client -- %*
exit 0

:startraw
%JAVA% %JVMOPT% -jar "%~dp0bin\app\jeb.jar" %*
