@echo off
REM
REM 本文件是APKDB的语言文件，翻译后请发送给我，谢谢！
REM The following is APKDB Tools language file, Please send it to me after translation. Thank you!
REM E-Mail: soyu.zom@gmail.com or s@idoog.me  QQ:120123176
REM
REM
REM =========================================[Start]==========================================
::System Language: zh-CN
::
set Author=Soyu Zom
set Date=2015-07-20
set Language=简体中文
set Lang=chs
set Changelog=Changelog-CHS.txt
set Readme=Readme-CHS.txt
set Exit=退出
set noresources2=×
set nosources2=×
set aapt22=×
set BL2=×
set YES=√
set bit=32
set adb="%~dp0Tools\ADB\"
set "signapk=signapk"
set "f=未安装"
if /i exist "%USERPROFILE%\AppData\Local\apktool\framework\*.apk" ( set "f=已安装" )
if /i exist "%USERPROFILE%\apktool\framework\*.apk" ( set "f=已安装" )
if /i exist "C:%HOMEPATH%\apktool\framework\*.apk" ( set "f=已安装" )
if /i exist "%AllUsersProfile%\apktool\framework\*.apk" ( set "f=已安装" )
::chcp 936
REM CMD语言编码，如果默认语言能显示就不用添加，如果不能显示去掉“::”，后面的数字改为你电脑的编码。
REM 编码查看 打开CMD 后 打开属性-选项，最下面当前代码页。
REM
REM
::
::
::
::Goto Setup.exe
::
set Setup001=签名zip刷机包
set Setup002=使用 APKDB 编译
set Setup003=该文件无法编译！
set Setup004=反编译DEX文件
set Setup005=签名APK文件
set Setup006=线刷CWM Sideload
set Setup007=设为框架文件
set Setup008=APK文件源
set Setup009=Android 应用程序
set Setup010=查看或安装
set Setup011=Android 源码包
set Setup012=执行反编译
set Setup013=查看源码并转JAR格式
set Setup014=合并Odex
set Setup015=出错：无法写入注册表，请认真查看安装说明！
set Setup017="%~dp0Readme-cn.txt"
set Setup018= 安装 安卓逆手(APKDB) V2.1.3
set Setup019= 准备为您安装[安卓逆手](APKDB) V2.1.3
set Setup020=注意：本工具必须在JAVA环境下才能运行。
set Setup021=使用前，必须安装 JAVA 环境
set Setup022=是一款，针对Android OS系统APK程序，直接反编译修改的工具。
set Setup023=APKDB集合了当今最强悍，最犀利的APK及Dex文件编译工具；
set Setup024=正常安装后，会直接在鼠标[右键]创建快捷菜单；
set Setup025=用户可以对APK或Dex文件进行简易的反编译回编译操作。
set Setup026=网站：http://www.idoog.me
set Setup027=为了避免写入注册表被拦截，建议关闭杀毒软件！
set Setup028=[任意键开始安装]
set Setup029=正在开始安装....
set Setup030=语言翻译
set Setup031=请使用右键 [以管理员身份运行]
set Setup032=请求管理权限……
set Setup033=出错啦！无法访问注册表。
::
::
::Goto install.bat
::
set install001=是否安装显示APK自身图标？
set install002=是否显示APK自身图标？
set install003=注意：需要，.NET Framework 4.0 环境支持！
set install004=如果未配置该环境，请下载 或 使用 默认图标
set install005=内存和CPU配置较低的用户，不推荐使用本功能。
set install006=该程序对个别APK文件读取缓慢，
set install007=会读取缓存滞留，从而导致无法删除APK文件的情况。
set install008=[1]使用 默认图标  [2]显示APK自身图标  [3]下载 .NET Framework 4.0
set install009=使用 默认图标
set install010=显示APK自身图标
set install011=下载 .NET Framework 4.0
set install012=请输入您的选项
set install013=正在安装 APK文件显示自身图标
set install014=正在安装显示 APK文件自身图标…
set install015=请选择 APK文件安装器
set install016=选择 APK文件 安装器：
set install017=使用APKDB内置APK安装器
set install018=保留原有第三方APK安装器
set install019=请选择安装器
set install020=[安卓逆手] 安装完成！
set install021=恭喜！ 安装完成！ 
set install022=建议 重启 explorer 进程。
set install023=或
set install024=[按任意键]重启 explorer.exe 进程，重置图标缓存！
set install025=注意：将会关闭全部Windows窗口。
set install026=出错：未安装.NET Framework 4.0
set install027=出错：本机还未安装.NET Framework 4.0
set install028=下载安装后再使用本功能。
set install029=[按任意键返回重新选择]
::
::
::Goto apkdb.cmd
::
set smali001=你是要回编译Dex文件吗？ 按“任意键”回编译
set smali002=回编译[classes.dex文件夹]工具 
set smali003=可直接对Apktoo工具反编译后的smali文件夹回编译。
set smali004=注意：本工具必须在JAVA环境下才能运行。 
set smali005=正在回编译文件夹
set smali006=正在回编译中...
set smali007=恭喜！  回编译完成! 
set smali008=请手动改名
set smali009=呃。。正所谓，东风不与周郎便，出现错误所难免!
set smali010=[唉，任意键关闭吧！]
::
set apkdb001=已编译
set apkdb002=已编译_
set apkdb003=当前正在使用
set apkdb004=回编译文件夹
set apkdb004x=为APK文件包
set apkdb005=开始回编译
set apkdb006=[出错啦! =_=!!! 5秒后，即将自动切换另一个版本!]
set apkdb007=倒计时
set apkdb007x=秒后自动切换...
set apkdb008=[出错啦! =_=!!! 是否切换另一个版本？]
set apkdb009=＞＞[按任意键] 切换...
set apkdb010=[任意键关闭]
set apkdb011=恭喜！ 编译完成! 
set apkdb012=[Y]重新签名APK文件    [B]保留原签名(仅适用于系统应用)
set apkdb012s=PS:保留原签名,不修改 AndroidManifest.xml 文件。
set apkdb013=正在签名
set apkdb014=正在优化
set apkdb015=OK 啦， 搞定收工！ :)
set apkdb016=瞧这里：
set apkdb007=倒计时
set apkdb007x=秒后自动切换...
set apkdb018=自动跳转：高版本反编译失败会自动跳至低版本
set apkdb019=准备编译:
set apkdb019x=为APK文件
set apkdb020=请输入选择
set apkdb021=回车键
set apkdb022=呃。。你的人品也太差了吧，竟然出错啦！！！
set apkdb023=如果编译普通APK文件失败，请检查框架文件
set apkdb024=内所有APK文件
set apkdb025=[按任意键 返回主菜单吧]
set apkdb026=错误：签名失败。
set apkdb027=可能APK文件不存在；2.重命名过回编译文件夹；
set apkdb028=请直接使用右键签名: 已编译
set apkdb029=错误：优化失败！
set apkdb030=查看是否
set apkdb030x=目录名称含有空格；
set apkdb031=可能
set apkdb031x=文件 不支持优化！
set apkdb032=错误：该文件夹不是 APK文件反编译所生成的！！！
set apkdb033=错误报告！
set apkdb034=您打开的是否是dex反编译文件夹？
set apkdb035=如果是请按[Y]键强制编译。
set apkdb036=查看
set apkdb036x=目录，并手动打包APK。
set apkdb037=恭喜！ 回编译完成! 
set apkdb038=请选择ApkTool编译工具版本：
set apkdb039=仅回编译APK文件
set apkdb040=仅回编译DEX文件
set apkdb041=JAVA
set apkdb042=官 网
set apkdb043=选项：
set apkdb044=使用内置APK安装器
set www=网站
::
set apkdball001=开始反编译
set apkdball002=开始回编译
set apkdball003=反编译完成！
set apkdball004=回编译完成！
set apkdball005=APK文件
set apkdball006=已反编译
set apkdball007=APK备份
set apkdball008=已编译
set apkdball009=已完成
set apkdball010=[任意键关闭]
set apkdball011=[任意键返回]
set apkdball012=正在签名并优化
set apkdball013=签名优化完毕！
set apkdball014=批量回编译
set apkdball014x=内的APK文件夹
set apkdball015=准备批量处理
set apkdball015x=目录内的APK文件或文件夹
set apkdball017=批量 反编译
set apkdball017x=目录下的*.apk文件
set apkdball018=批量 回编译
set apkdball018x=内的APK文件夹(完整版)
set apkdball019=批量 回编译
set apkdball019x=内的APK文件夹(无Dex版)
set apkdball020=框架 安装为编译时所需的框架文件
set apkdball021=安装
set apkdball021x=目录内的*.apk文件
set apkdball022=测试 批量合并[无Dex版]到[APK文件]内
set apkdball023=帮助 以上项目详细说明。
set apkdball024=附，右键反编译的APK目录，可自动创建 values-zh-rCN 文件夹
set apkdball025=你想做什么?
set apkdball026=准备批量处理
set apkdball026x=目录内的APK文件夹
set apkdball027=测试 批量合并[无Dex版]到[APK文件]内
set apkdball028=帮助 以上项目详细说明。
set apkdball029=批量反编译文件夹
set apkdball029x=里的APK文件
set apkdball030=正在执行批量反编译
set apkdball030x=目录下的APK文件... 
set apkdball031=目录下所有APK文件反编译完成！
set apkdball032=所有APK文件反编译完毕！
set apkdball033=查看[已反编译]目录。
set apkdball034=内所有APK文件夹 回编译完成！
set apkdball035=所有APK文件夹回编译完成！
set apkdball036=回编译后的APK文件保存在[已编译]目录
set apkdball037=打包签名后的apk程序包在
set apkdball037x=根目录下:
set apkdball038=开始批量回编译
set apkdball038x=内的APK文件夹为 无Dex版APK文件
set apkdball039=需要手动打包，如果不明白，请忽略该功能！
set apkdball040=必须目录下包含[APK文件]和[已反编译]
set apkdball041=批量安装
set apkdball041x=文件夹内的APK文件
set apkdball042=请将手机通过USB数据线连接，并且开启[USB 调试]模式。
set apkdball043=待，电脑识别驱动后，按任意键继续...
set apkdball044=[任意键开始安装]
set apkdball045=正在执行批量安装
set apkdball045x=文件夹内的APK文件... 
set apkdball046=正在安装
set apkdball047=安装成功！
set apkdball048=文件夹内的APK文件安装完成！！
set apkdball049=正在安装Apktool的框架... 
set apkdball050=正在安装
set apkdball050x=到Apktool框架...
set apkdball051=框架文件安装成功！！
set apkdball052=恭喜! 安装框架完成！
set apkdball053=如果反编译普通APK文件，失败，需要删除框架哦！
set apkdball054=出错: 未找到Apktool所需的框架文件framework-res.apk！
set apkdball055=但，仍然可以继续。。。
set apkdball056=注: 默认框架文件一般在 \system\framework\ 目录。
set apkdball057=[输入[Y]继续安装框架][输入任意键返回]
set apkdball058=出错: 该目录不存在APK文件。你是要回编译吗！？
set apkdball059=出错: 该目录不存在APK文件。
set apkdball060=反编译目录下[APK文件]
set apkdball061=反编译后，会自动将文件分别反正[APK文件][已反编译]两个文件夹内
set apkdball062=无法反编译的APK文件，则保留移动。
set apkdball063=如果出现大量无法反编译的情况，请检查框架文件。
set apkdball064=回编译目录下[APK文件夹]完整版
set apkdball065=回编译后，会在APK文件夹内生产一个[已编译]的目录，
set apkdball066=里面就是回编译后所得到的新的*.APK文件和未打包的[apk]文件夹
set apkdball067=未打包的[apk]文件夹，一般情况下，直接用zip格式压缩后签名，即可！
set apkdball068=如果出现大量无法回编译的情况，请检查框架文件。
set apkdball069=注: 文件夹名称前缀含 _unfinished_ 表示可能未汉化
set apkdball070=注: 文件夹名称前缀含 _Failure_ 表示 回编译失败
set apkdball071=回编译目录下[APK文件夹]无Dex版
set apkdball072=回编译后，会在APK文件夹内生产一个[已编译]的目录，
set apkdball073=里面是回编译后的apk未打包文件，由于不包含Dex文件，所以需要自动手动打包。
set apkdball074=适合用于编译汉化ROM内大量APK程序，操作。
set apkdball075=安装框架文件
set apkdball076=在反编译新版的ROM时 发现系统文件无法反编译，如Settings.apk
set apkdball077=那是因为 ApkTool 原有框架文件无法与定制的系统Apk进行比对，
set apkdball078=那么，我们就需要手动为 ApkTool 重新添加一个框架文件:  
set apkdball079=如，右键 \system\framework\ 目录，单击本工具: 
set apkdball080=选择第 [5] 项，安装框架文件选项，即可！
set apkdball081=批量安装目录下APK文件
set apkdball082=该操作需要，手机连接USB数据线，并且开启[USB 调试]模式。
set apkdball083=电脑必须安装该手机的驱动，否则，安装识别。
set apkdball084=安装框架文件
set apkdball085=测试功能，不完善。
set apkdball086=批量合并，已回编译后的APK文件夹内的[已编译]文件到
set apkdball087=[APK文件]文件夹的*.APK文件内。合并完成后，存放在[已完成]目录。
set apkdball088=执行目录下必须含有[APK文件][已反编译](APK文件夹已回编译)
::
::
::Goto apkdb_d.cmd
::
set apkd001=当前正在使用反编译工具:
set apkd002=正在反编译文件:
set apkd003=开始反编译...
set apkd004=恭喜！反编译完成! 
set apkd005=[任意键关闭]
set apkd007=准备反编译: 
set apkd008=请选择ApkTool版本反编译工具: 
set apkd009=选项: 
set apkd010=仅反编译内部Dex文件
set apkd011=访问官网
set apkd013=到目录
set apkd014=请输入选择
set apkd015=回车键
set apkd016=正在检测是否有更新...
set apkd017=*正在检测....
set apkd018=如果没有更新，将跳回主页面。
set apkd019=已成功创建[values-zh-rCN]目录！
::
set apkd027=呃。。你的人品也太差了吧，竟然出错啦！！！
set apkd028=如果编译普通APK文件失败，请检查框架文件
set apkd029=内所有APK文件
set apkd030=注意: 本工具必须在JAVA环境下才能运行。 
set apkd031=[按任意键返 回主菜单吧]
set apkd032=错误: 不要双击执行本脚本！！
set apkd033=系统目录未找到aapt.exe 开发工具！
set apkd034=正在为您加载…
set apkd035=出错: 加载失败!!!
set apkd036=请手动操作，复制APKDB目录下的aapt.exe文件到
set apkd037=错误: 请不要单独执行本文件。
::
::
::Goto dex_d.cmd
::
set baksmali001=正在使用Dex反编译工具
set baksmali002=注意: 本工具必须在JAVA环境下才能运行。 
set baksmali003=正在反编译文件
set baksmali004=正在反编译中...
set baksmali005=恭喜！  反编译完成!  
set baksmali006=呃。。正所谓，东风不与周郎便，出现错误所难免!
set baksmali007=[唉，任意键关闭吧！]
::
::
::Goto flashzip.bat
::
set flashzip001=正在刷入
set flashzip002=正在使用 adb sideload 命令
set flashzip003=刷入文件
set flashzip004=TWRP/CWM Recovery 模式打开 sideload 选项
set flashzip005=正在刷机ing…
set flashzip006=刷机完成后，会自动退出 sideload 刷机选项
set flashzip007=可按[Y]，在这里重启手机
set flashzip008=呃。。竟然出错！！！
set flashzip009=确认如果手机驱动一切正常，
set flashzip010=并且请检查是否有进程冲突。
set flashzip011=方法：打开任务管理器，查看是否有 adb 相关的进程，
set flashzip012=进程不一定叫 adb.exe
set flashzip013=如：金山手机助手 sjk_daemon.exe 等等。。
set flashzip014=请 打开 sideload 选项
set flashzip015=是否让手机进入 Recovery 模式
set flashzip016=重启手机进入 Recovery 模式，请耐心等待……
::
::
::Goto fws.cmd
::
set fwk001=安装 ApkTool 工具框架文件
set fwk002=在反编译新版的ROM时 发现系统文件无法反编译，如Settings.apk
set fwk003=那是因为 ApkTool 原有框架文件无法与定制的系统apk进行比对，
set fwk004=那么，我们就需要手动为 ApkTool 重新添加一个框架文件： 
set fwk005=打开 \system\framework\ 目录，
set fwk006=把里面所有*.apk文件，右键*设为APKTool的框架文件，即可！
set fwk007=如果，反编译第三方APK文件，失败，需要删除框架哦！
set fwk008=恭喜! 安装框架完成！
set fwk010=呃。。正所谓，东风不与周郎便，出现错误不可免!
set fwk011=[唉，任意键关闭吧！]
set fwk012=安装或删除Apktool框架文件
set fwk013=安装 Apktool框架文件
set fwk014=删除 Apktool框架文件
set fwk009=OK！ 框架文件已经删除
::
::
::Goto odex.cmd
::
set odex001=进行合并
set odex001x=到
set odex001x2=内
set odex002=[本工具用于转换Odex文件并合并到APK或JAR文件内]
set odex003=准备工作: 
set odex004=将Odex文件编译成Dex文件，必须用到原ROM系统文件。
set odex005=所以必须使用完整的ROM 或 直接从手机上提取: 
set odex006=提取 system/app 和 system/framework 两个目录到PC上。
set odex008=右键*.odex文件，菜单 [执行编译] 即可！
set odex009=本工具将会自动合并odex到apk或jar内。
set odex010=注: 批量处理工具到这下载: http://dwz.cn/Apkdb
set odex011=◆◇请选择Android系统版本: 
set odex012=输入: 
set odex013=PS:会自动递升版本
set odex014=请输入选择
set odex015=回车键
set odex016=正在运行转换并合并工作，请稍后……
set odex017=正在转换
set odex018=为
set odex019=正在合并
set odex020=到
set odex021=合并完成！
set odex022=出错啦! O_o.. 立即切换更高级别
set odex023=出错了啦！ 未知错误…，转换失败！
set odex024=请详细看首页的使用说明
set odex025=[按任意键重新开始]
::
::
::Goto seesource.bat
::
set seesource01=正在反编译DEX源码
set seesource02=正在使用
set seesource03=注意：本工具必须在JAVA环境下才能运行。 
set seesource04=正在反编译
::
::
::Goto signer.cmd
::
set signer00=签名工具 签名:
set signer01=签名文件：
set signer02=*PS:将自动删除原 META-INF 签名数据
set signer03=正在签名...
set signer04=签名完成！
set signer05=已签名为:
::
::
::Goto Craining\dex2jar.bat
::
set dex2jar01=使用 Java Decompiler 查看dex文件源码
set dex2jar02=欢迎使用DEX反编译查看源码器Java Decompiler 
set dex2jar03=请勿关闭本窗口！
set dex2jar04=查看完源码后窗口自动关闭
::
::
::Goto Uninstall.exe
::
set uninstall001=请使用右键 [以管理员身份运行]
set uninstall002=卸载 安卓逆手
set uninstall003=感谢您使用[安卓逆手]
set uninstall004=你确定要卸载吗？
set uninstall005=卸载选项：
set uninstall006=完全卸载
set uninstall007=仅卸载 APK图标
set uninstall008=官方网站
set uninstall009=请输入选择
set uninstall010=感谢您的使用...
set uninstall011=再见！！
set uninstall012=正在卸载...
set uninstall013=正在删除残余文件...
::
::
::Goto uninstapkico.bat
::
set uninstapkico01=卸载 APK文件显示自身图标
set uninstapkico02=正在卸载APK文件自身图标...
::
::
::Goto unins.bat
::
set unins01=删除 APK文件自身图标及残余文件
set unins02=正在删除APK文件自身图标
set unins03=以及残余文件...
set unins04=您的电脑Win7或Win8操作系统，如果卸载失败，请[以管理员身份]运行卸载！
set unins05=32为操作系统。
::
::
::Goto Other
::
set warning=警告！隐藏的脚本文件不要直接执行，否则后果自负！！
set OK=设定完成！
set OK2=设定完成！PS: 可同时输入CR选项！
::
::
::New
set apkd020=优化APK文件
set apkd021=优化
set apkd022=开始优化
set apkd023=恭喜，优化完成！
set apkd024=请作者吃辣条
set apkd038=不反编译Resources
set apkd039=不反编译Classes
set seapktool01=设定默认Apktool版本
set seapktool02=设置后，主界面直接按回车键开始编译
set seapktool03=当前设定版本为：
::
::
set odex026=合并odex到APK文件
set optipng0=极限优化压缩APK内图片
set optipng00=压缩+签名
set optipng01=优化压缩
set optipng02=正在提取
set optipng03=极限打包
set optipng04=已优化
set optipng06=未优化
set optipng05=正在优化图片
::
::ShakaApktool
set shakaapktool01=自定义操作
set shakaapktool02=例如：
set shakaapktool03=例如：
set shakaapktool04=-df    使用默认的框架资源文件
set shakaapktool05=-fui   反编译遇到未知资源id继续执行
set shakaapktool06=-ir    忽略资源反编译的错误
set shakaapktool07=-mc    显示更多的可识别字符
set shakaapktool08=-n9    不解析.9格式的资源
set shakaapktool09=-o     输出文件夹名字. 默认是 apk.out
set shakaapktool10=-p     使用指定目录下的框架文件
set shakaapktool11=-r     不反编译resources.arsc
set shakaapktool12=-s     不反编译classes.dex
set shakaapktool13=-t     使用指定名称的框架文件(tag)
set shakaapktool14=-xn    纠正xml属性名. 可能有问题, 不推荐
set shakaapktool15=-f     跳过已编译检查,强制编译所有文件.
set shakaapktool16=-fnd   跳过 Public symbol drawable/xxx 错误
set shakaapktool17=-p     使用指定目录下的框架文件.
::
::
::Keytool
set keytool01=Keytool签名包制作工具
set keytool02=签名包信息
set keytool03=Keytool工具 自定义操作
set keytool04=要创建签名包，只需根据以下步骤填写名称、别名以及密码即可！
set keytool05=已创建签名包后，会自动替换APKDB内置的签名包，可直接签名APK。
set keytool06=已经创建的签名包
set keytool07=查看签名包信息
set keytool08=输入名称(字母或数字)
set keytool09=输入别称(字母或数字)
set keytool10=输入钥匙库口令(六位)
set keytool11=查看上次的签名数据，可再次制作签名包
set keytool12=恢复默认签名包：Testkey
set keytool13=当前签名包
set keytool14=使用 JAVA Jarsigner工具签名
set keytool15=签名
set keytool16=再次制作改签名
set keytool17=返回
set keytool18=签名包
::
::
set java01=出错拉，APKDB未识别到JAVA路径！请手动输入！
set java02=请输入JAVA安装路径
set java03=例如：
set java04=结尾无
::
set apkdb045=精简语言包(保留英简繁)
::
REM =========================================[End]==========================================
REM
REM
REM 翻译结束后，保存即可。
REM 注意：文件的编码格式必须是：ANSI 
REM
REM
