@Echo Off
title CrashRecovery
:Start
tasklist /FI "IMAGENAME eq arma2oaserver_Jade.exe" /NH | find /I /N "arma2oaserver_Jade.exe" >NUL
if %ERRORLEVEL%==1 Goto RecoverJadeGroove
tasklist /FI "IMAGENAME eq arma2oaserver_Taviana.exe" /NH | find /I /N "arma2oaserver_Taviana.exe" >NUL
if %ERRORLEVEL%==1 Goto RecoverTaviana
tasklist /FI "IMAGENAME eq arma2oaserver_Chernarus.exe" /NH | find /I /N "arma2oaserver_Chernarus.e" >NUL
if %ERRORLEVEL%==1 Goto RecoverChernarus
tasklist /FI "IMAGENAME eq arma2oaserver_Takistan.exe" /NH | find /I /N "arma2oaserver_Takistan.ex" >NUL
if %ERRORLEVEL%==1 Goto RecoverTakistan
tasklist /FI "IMAGENAME eq arma2oaserver_Napf.exe" /NH | find /I /N "arma2oaserver_Napf.exe" >NUL
if %ERRORLEVEL%==1 Goto RecoverNapf
tasklist /FI "IMAGENAME eq arma2oaserver_Namalsk.exe" /NH | find /I /N "arma2oaserver_Namalsk.exe" >NUL
if %ERRORLEVEL%==1 Goto RecoverNamalsk
tasklist /FI "IMAGENAME eq arma2oaserver_Lingor.exe" /NH | find /I /N "arma2oaserver_Lingor.exe" >NUL
if %ERRORLEVEL%==1 Goto RecoverLingor
timeout /t 300 /nobreak > NUL
Goto Start

:RecoverJadeGroove
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@Panthera;@jade;@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Jade
Set Arma_Config=DayZConfig_Jade\server.cfg
Set Arma_Cfg=DayZConfig_Jade\basic.cfg
Set Arma_Profiles=DayZConfig_Jade
set ServerEXE=arma2oaserver_Jade.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=JadeGrooveDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverTaviana
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Taviana
Set Arma_Config=DayZConfig_Taviana\server.cfg
Set Arma_Cfg=DayZConfig_Taviana\basic.cfg
Set Arma_Profiles=DayZConfig_Taviana
set ServerEXE=arma2oaserver_Taviana.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=TavianaDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverChernarus
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Chernarus
Set Arma_Config=DayZConfig_Chernarus\server.cfg
Set Arma_Cfg=DayZConfig_Chernarus\basic.cfg
Set Arma_Profiles=DayZConfig_Chernarus
set ServerEXE=arma2oaserver_Chernarus.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=ChernarusDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverTakistan
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Takistan
Set Arma_Config=DayZConfig_Takistan\server.cfg
Set Arma_Cfg=DayZConfig_Takistan\basic.cfg
Set Arma_Profiles=DayZConfig_Takistan
set ServerEXE=arma2oaserver_Takistan.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=TakistanDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverNapf
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Napf
Set Arma_Config=DayZConfig_Napf\server.cfg
Set Arma_Cfg=DayZConfig_Napf\basic.cfg
Set Arma_Profiles=DayZConfig_Napf
set ServerEXE=arma2oaserver_Napf.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=NapfDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverNamalsk
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@Namalsk;@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Namalsk
Set Arma_Config=DayZConfig_Namalsk\server.cfg
Set Arma_Cfg=DayZConfig_Namalsk\basic.cfg
Set Arma_Profiles=DayZConfig_Namalsk
set ServerEXE=arma2oaserver_Namalsk.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=NamalskDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:RecoverLingor
set Arma_Path=C:\###DrivePath###
set Arma_Mods=@lingor;@DayzOverwatch;@DayzOrigins;@DayZ_Epoch;@DayZ_Epoch_Server
Set Arma_Name=DayZConfig_Lingor
Set Arma_Config=DayZConfig_Lingor\server.cfg
Set Arma_Cfg=DayZConfig_Lingor\basic.cfg
Set Arma_Profiles=DayZConfig_Lingor
set ServerEXE=arma2oaserver_Lingor.exe
set BERCon_Path=C:\###DrivePath###
set SQL_Path=C:\###DrivePath###
Set SQL_Port=####
Set SQL_User=###username###
Set SQL_Pass=###password###
Set SQL_Name=hivemind
Set SQL_Titl=LingorDatabase
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Goto Recover

:Recover
start /Wait /D "%SQL_Path%bin\" /Min mysqladmin.exe -u%SQL_User% shutdown -p%SQL_Pass% -P %SQL_Port% shutdown
taskkill /FI "WINDOWTITLE eq Administrator:  %SQL_Titl%" /F
timeout /t 5 /nobreak > NUL
start /D "%SQL_Path%" /MIN MySQL.bat
timeout /t 5 /nobreak > NUL
%SQL_Path%bin\mysql.exe --user=%SQL_User% --password=%SQL_Pass% --host=%sIP% --port=%SQL_Port% --database=%SQL_Name% --execute="call pMain(0)"
timeout /t 5 /nobreak > NUL
start /D "%Arma_Path%" /MIN %ServerEXE% -mod=%Arma_Mods% -name=%Arma_Name% -config=%Arma_Config% -cfg=%Arma_Cfg% -profiles=%Arma_Profiles% -port=%sPort%
Goto Start