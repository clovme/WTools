@ECHO OFF
ECHO.
del /f /q "%HOMEDRIVE%\Users\Public\Desktop\XML文件编辑器.lnk" /f>NUL 2>NUL
del /f /q "%AllUsersProfile%\Desktop\XML文件编辑器.lnk" /f>NUL 2>NUL
del /f /q "%AllUsersProfile%\桌面\XML文件编辑器.lnk" /f>NUL 2>NUL
del /f /q "%AllUsersProfile%\\XML文件编辑器.lnk" /f>NUL 2>NUL
rd /s /q "%AllUsersProfile%\Start Menu\Programs\APKDB">NUL 2>NUL
rd /s /q "%AllUsersProfile%\「开始」菜单\程序\APKDB">NUL 2>NUL
rd /s /q "%AllUsersProfile%\秨﹍\祘Α栋\APKDB">NUL 2>NUL
rd /s /q "%AllUsersProfile%\Microsoft\Windows\Start Menu\Programs\APKDB">NUL 2>NUL
cd\
