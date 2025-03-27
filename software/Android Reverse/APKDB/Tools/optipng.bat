@echo off
IF %1 == () goto end
cls
ECHO _______________________________________________________________________________
ECHO. 
ECHO.   %optipng05% %~n1%~x1
%optipng% -o7 %1 >NUL 2>NUL
:end
