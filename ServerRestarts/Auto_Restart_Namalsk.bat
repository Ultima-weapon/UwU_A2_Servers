@echo off
title Auto_Server_Restart_Namalsk
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
set sIP=127.0.0.1
set sPort=#####
set RConP=###Password###
Set CurrentMessage=0
CALL :LoadKickVars
:Start
timeout /t 5 /nobreak > NUL
set hour=%TIME:~0,2%
if "%hour:~0,1%" == " "  set hour=0%hour:~1,1%
set minute=%TIME:~3,2%
set second=%TIME:~6,2%
set timeStamp=%hour%%minute%.%second%
:: 0005 - 0400
if %timeStamp% GEQ 0135.00 if %timeStamp% LSS 0200.00 goto Msg01
if %timeStamp% GEQ 0200.00 if %timeStamp% LSS 0230.00 goto Msg02
if %timeStamp% GEQ 0230.00 if %timeStamp% LSS 0300.00 goto Msg03
if %timeStamp% GEQ 0300.00 if %timeStamp% LSS 0330.00 goto Msg04
if %timeStamp% GEQ 0330.00 if %timeStamp% LSS 0400.00 goto Msg05
if %timeStamp% GEQ 0400.00 if %timeStamp% LSS 0430.00 goto Msg06
if %timeStamp% GEQ 0430.00 if %timeStamp% LSS 0500.00 goto Msg07
if %timeStamp% GEQ 0500.00 if %timeStamp% LSS 0515.00 goto Msg08
if %timeStamp% GEQ 0515.00 if %timeStamp% LSS 0520.00 goto Msg09
if %timeStamp% GEQ 0520.00 if %timeStamp% LSS 0525.00 goto Msg10
if %timeStamp% GEQ 0525.00 if %timeStamp% LSS 0526.00 goto Msg11
if %timeStamp% GEQ 0526.00 if %timeStamp% LSS 0527.00 goto Msg12
if %timeStamp% GEQ 0527.00 if %timeStamp% LSS 0528.00 goto Msg13
if %timeStamp% GEQ 0528.00 if %timeStamp% LSS 0529.00 goto Msg14
if %timeStamp% GEQ 0529.00 if %timeStamp% LSS 0529.30 goto Msg15
if %timeStamp% GEQ 0529.30 if %timeStamp% LSS 0529.45 goto Msg16
if %timeStamp% GEQ 0529.45 if %timeStamp% LSS 0529.50 goto Msg17
if %timeStamp% GEQ 0529.50 if %timeStamp% LSS 0529.55 goto Msg18
if %timeStamp% GEQ 0529.55 if %timeStamp% LSS 0535.00 goto Msg19
:: 0405 - 0800
if %timeStamp% GEQ 0535.00 if %timeStamp% LSS 0600.00 goto Msg01
if %timeStamp% GEQ 0600.00 if %timeStamp% LSS 0630.00 goto Msg02
if %timeStamp% GEQ 0630.00 if %timeStamp% LSS 0700.00 goto Msg03
if %timeStamp% GEQ 0700.00 if %timeStamp% LSS 0730.00 goto Msg04
if %timeStamp% GEQ 0730.00 if %timeStamp% LSS 0800.00 goto Msg05
if %timeStamp% GEQ 0800.00 if %timeStamp% LSS 0830.00 goto Msg06
if %timeStamp% GEQ 0830.00 if %timeStamp% LSS 0900.00 goto Msg07
if %timeStamp% GEQ 0900.00 if %timeStamp% LSS 0915.00 goto Msg08
if %timeStamp% GEQ 0915.00 if %timeStamp% LSS 0920.00 goto Msg09
if %timeStamp% GEQ 0920.00 if %timeStamp% LSS 0925.00 goto Msg10
if %timeStamp% GEQ 0925.00 if %timeStamp% LSS 0926.00 goto Msg11
if %timeStamp% GEQ 0926.00 if %timeStamp% LSS 0927.00 goto Msg12
if %timeStamp% GEQ 0927.00 if %timeStamp% LSS 0928.00 goto Msg13
if %timeStamp% GEQ 0928.00 if %timeStamp% LSS 0929.00 goto Msg14
if %timeStamp% GEQ 0929.00 if %timeStamp% LSS 0929.30 goto Msg15
if %timeStamp% GEQ 0929.30 if %timeStamp% LSS 0929.45 goto Msg16
if %timeStamp% GEQ 0929.45 if %timeStamp% LSS 0929.50 goto Msg17
if %timeStamp% GEQ 0929.50 if %timeStamp% LSS 0929.55 goto Msg18
if %timeStamp% GEQ 0929.55 if %timeStamp% LSS 0935.00 goto Msg19
:: 0805 - 1200
if %timeStamp% GEQ 0935.00 if %timeStamp% LSS 1000.00 goto Msg01
if %timeStamp% GEQ 1000.00 if %timeStamp% LSS 1030.00 goto Msg02
if %timeStamp% GEQ 1030.00 if %timeStamp% LSS 1100.00 goto Msg03
if %timeStamp% GEQ 1100.00 if %timeStamp% LSS 1130.00 goto Msg04
if %timeStamp% GEQ 1130.00 if %timeStamp% LSS 1200.00 goto Msg05
if %timeStamp% GEQ 1200.00 if %timeStamp% LSS 1230.00 goto Msg06
if %timeStamp% GEQ 1230.00 if %timeStamp% LSS 1300.00 goto Msg07
if %timeStamp% GEQ 1300.00 if %timeStamp% LSS 1315.00 goto Msg08
if %timeStamp% GEQ 1315.00 if %timeStamp% LSS 1320.00 goto Msg09
if %timeStamp% GEQ 1320.00 if %timeStamp% LSS 1325.00 goto Msg10
if %timeStamp% GEQ 1325.00 if %timeStamp% LSS 1326.00 goto Msg11
if %timeStamp% GEQ 1326.00 if %timeStamp% LSS 1327.00 goto Msg12
if %timeStamp% GEQ 1327.00 if %timeStamp% LSS 1328.00 goto Msg13
if %timeStamp% GEQ 1328.00 if %timeStamp% LSS 1329.00 goto Msg14
if %timeStamp% GEQ 1329.00 if %timeStamp% LSS 1329.30 goto Msg15
if %timeStamp% GEQ 1329.30 if %timeStamp% LSS 1329.45 goto Msg16
if %timeStamp% GEQ 1329.45 if %timeStamp% LSS 1329.50 goto Msg17
if %timeStamp% GEQ 1329.50 if %timeStamp% LSS 1329.55 goto Msg18
if %timeStamp% GEQ 1329.55 if %timeStamp% LSS 1335.00 goto Msg19
:: 1205 - 1600
if %timeStamp% GEQ 1335.00 if %timeStamp% LSS 1400.00 goto Msg01
if %timeStamp% GEQ 1400.00 if %timeStamp% LSS 1430.00 goto Msg02
if %timeStamp% GEQ 1430.00 if %timeStamp% LSS 1500.00 goto Msg03
if %timeStamp% GEQ 1500.00 if %timeStamp% LSS 1530.00 goto Msg04
if %timeStamp% GEQ 1530.00 if %timeStamp% LSS 1600.00 goto Msg05
if %timeStamp% GEQ 1600.00 if %timeStamp% LSS 1630.00 goto Msg06
if %timeStamp% GEQ 1630.00 if %timeStamp% LSS 1700.00 goto Msg07
if %timeStamp% GEQ 1700.00 if %timeStamp% LSS 1715.00 goto Msg08
if %timeStamp% GEQ 1715.00 if %timeStamp% LSS 1720.00 goto Msg09
if %timeStamp% GEQ 1720.00 if %timeStamp% LSS 1725.00 goto Msg10
if %timeStamp% GEQ 1725.00 if %timeStamp% LSS 1726.00 goto Msg11
if %timeStamp% GEQ 1726.00 if %timeStamp% LSS 1727.00 goto Msg12
if %timeStamp% GEQ 1727.00 if %timeStamp% LSS 1728.00 goto Msg13
if %timeStamp% GEQ 1728.00 if %timeStamp% LSS 1729.00 goto Msg14
if %timeStamp% GEQ 1729.00 if %timeStamp% LSS 1729.30 goto Msg15
if %timeStamp% GEQ 1729.30 if %timeStamp% LSS 1729.45 goto Msg16
if %timeStamp% GEQ 1729.45 if %timeStamp% LSS 1729.50 goto Msg17
if %timeStamp% GEQ 1729.50 if %timeStamp% LSS 1729.55 goto Msg18
if %timeStamp% GEQ 1729.55 if %timeStamp% LSS 1735.00 goto Msg19
:: 1605 - 2000
if %timeStamp% GEQ 1735.00 if %timeStamp% LSS 1800.00 goto Msg01
if %timeStamp% GEQ 1800.00 if %timeStamp% LSS 1830.00 goto Msg02
if %timeStamp% GEQ 1830.00 if %timeStamp% LSS 1900.00 goto Msg03
if %timeStamp% GEQ 1900.00 if %timeStamp% LSS 1930.00 goto Msg04
if %timeStamp% GEQ 1930.00 if %timeStamp% LSS 2000.00 goto Msg05
if %timeStamp% GEQ 2000.00 if %timeStamp% LSS 2030.00 goto Msg06
if %timeStamp% GEQ 2030.00 if %timeStamp% LSS 2100.00 goto Msg07
if %timeStamp% GEQ 2100.00 if %timeStamp% LSS 2115.00 goto Msg08
if %timeStamp% GEQ 2115.00 if %timeStamp% LSS 2120.00 goto Msg09
if %timeStamp% GEQ 2120.00 if %timeStamp% LSS 2125.00 goto Msg10
if %timeStamp% GEQ 2125.00 if %timeStamp% LSS 2126.00 goto Msg11
if %timeStamp% GEQ 2126.00 if %timeStamp% LSS 2127.00 goto Msg12
if %timeStamp% GEQ 2127.00 if %timeStamp% LSS 2128.00 goto Msg13
if %timeStamp% GEQ 2128.00 if %timeStamp% LSS 2129.00 goto Msg14
if %timeStamp% GEQ 2129.00 if %timeStamp% LSS 2129.30 goto Msg15
if %timeStamp% GEQ 2129.30 if %timeStamp% LSS 2129.45 goto Msg16
if %timeStamp% GEQ 2129.45 if %timeStamp% LSS 2129.50 goto Msg17
if %timeStamp% GEQ 2129.50 if %timeStamp% LSS 2129.55 goto Msg18
if %timeStamp% GEQ 2129.55 if %timeStamp% LSS 2135.00 goto Msg19
:: 2005 - 0000
if %timeStamp% GEQ 2135.00 if %timeStamp% LSS 2200.00 goto Msg01
if %timeStamp% GEQ 2200.00 if %timeStamp% LSS 2230.00 goto Msg02
if %timeStamp% GEQ 2230.00 if %timeStamp% LSS 2300.00 goto Msg03
if %timeStamp% GEQ 2300.00 if %timeStamp% LSS 2330.00 goto Msg04
if %timeStamp% GEQ 2330.00 if %timeStamp% LSS 2400.00 goto Msg05
if %timeStamp% GEQ 0000.01 if %timeStamp% LSS 0030.00 goto Msg06
if %timeStamp% GEQ 0030.00 if %timeStamp% LSS 0100.00 goto Msg07
if %timeStamp% GEQ 0100.00 if %timeStamp% LSS 0115.00 goto Msg08
if %timeStamp% GEQ 0115.00 if %timeStamp% LSS 0120.00 goto Msg09
if %timeStamp% GEQ 0120.00 if %timeStamp% LSS 0125.00 goto Msg10
if %timeStamp% GEQ 0125.00 if %timeStamp% LSS 0126.00 goto Msg11
if %timeStamp% GEQ 0126.00 if %timeStamp% LSS 0127.00 goto Msg12
if %timeStamp% GEQ 0127.00 if %timeStamp% LSS 0128.00 goto Msg13
if %timeStamp% GEQ 0128.00 if %timeStamp% LSS 0129.00 goto Msg14
if %timeStamp% GEQ 0129.00 if %timeStamp% LSS 0129.30 goto Msg15
if %timeStamp% GEQ 0129.30 if %timeStamp% LSS 0129.45 goto Msg16
if %timeStamp% GEQ 0129.45 if %timeStamp% LSS 0129.50 goto Msg17
if %timeStamp% GEQ 0129.50 if %timeStamp% LSS 0129.55 goto Msg18
if %timeStamp% GEQ 0129.55 if %timeStamp% LSS 0135.00 goto Msg19
Goto Start
:://// Server Restart
:ServerRestart
start /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd #lock -cmd "say -1 Server Locked" -cmd %Kick0% -cmd %Kick1% -cmd %Kick2% -cmd %Kick3% -cmd %Kick4% -cmd %Kick5% -cmd %Kick6% -cmd %Kick7% -cmd %Kick8% -cmd %Kick9% -cmd %Kick10% -cmd %Kick11% -cmd %Kick12% -cmd %Kick13% -cmd %Kick14% -cmd %Kick15% -cmd %Kick16% -cmd %Kick17% -cmd %Kick18% -cmd %Kick19% -cmd %Kick20% -cmd %Kick21% -cmd %Kick22% -cmd %Kick23% -cmd %Kick24% -cmd %Kick25% -cmd %Kick26% -cmd %Kick27% -cmd %Kick28% -cmd %Kick29% -cmd %Kick30% -cmd %Kick31% -cmd %Kick32% -cmd %Kick33% -cmd %Kick34% -cmd %Kick35% -cmd %Kick36% -cmd %Kick37% -cmd %Kick38% -cmd %Kick39% -cmd %Kick40% -cmd %Kick41% -cmd %Kick42% -cmd %Kick43% -cmd %Kick44% -cmd %Kick45% -cmd %Kick46% -cmd %Kick47% -cmd %Kick48% -cmd %Kick49% -cmd exit 
start /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd %Kick50% -cmd %Kick51% -cmd %Kick52% -cmd %Kick53% -cmd %Kick54% -cmd %Kick55% -cmd %Kick56% -cmd %Kick57% -cmd %Kick58% -cmd %Kick59% -cmd %Kick60% -cmd %Kick61% -cmd %Kick62% -cmd %Kick63% -cmd %Kick64% -cmd %Kick65% -cmd %Kick66% -cmd %Kick67% -cmd %Kick68% -cmd %Kick69% -cmd %Kick70% -cmd %Kick71% -cmd %Kick72% -cmd %Kick73% -cmd %Kick74% -cmd %Kick75% -cmd %Kick76% -cmd %Kick77% -cmd %Kick78% -cmd %Kick79% -cmd %Kick80% -cmd %Kick81% -cmd %Kick82% -cmd %Kick83% -cmd %Kick84% -cmd %Kick85% -cmd %Kick86% -cmd %Kick87% -cmd %Kick88% -cmd %Kick89% -cmd %Kick90% -cmd %Kick91% -cmd %Kick92% -cmd %Kick93% -cmd %Kick94% -cmd %Kick95% -cmd %Kick96% -cmd %Kick97% -cmd %Kick98% -cmd %Kick99% -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
timeout /t 3 /nobreak > NUL
start /Wait /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd #Shutdown -cmd exit
taskkill /im %ServerEXE% /F
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
timeout /t 3 /nobreak > NUL
start /Wait /D "%SQL_Path%bin\" /Min mysqladmin.exe -u%SQL_User% shutdown -p%SQL_Pass% -P %SQL_Port% shutdown
timeout /t 5 /nobreak > NUL
start /D "%SQL_Path%" /MIN MySQL.bat
timeout /t 5 /nobreak > NUL
%SQL_Path%bin\mysql.exe --user=%SQL_User% --password=%SQL_Pass% --host=%sIP% --port=%SQL_Port% --database=%SQL_Name% --execute="call pMain(15)"
timeout /t 5 /nobreak > NUL
start /D "%Arma_Path%" /MIN %ServerEXE% -mod=%Arma_Mods% -name=%Arma_Name% -config=%Arma_Config% -cfg=%Arma_Cfg% -profiles=%Arma_Profiles% -port=%sPort%
timeout /t 30 /nobreak > NUL
start /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd #unlock -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
timeout /t 3 /nobreak > NUL
goto Start
:Msg01
if %CurrentMessage% EQU 1 goto Start
Set CurrentMessage=1
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Server Restart Successful. Enjoy your stay." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg02
if %CurrentMessage% EQU 2 goto Start
Set CurrentMessage=2
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 3 hours and 30 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg03
if %CurrentMessage% EQU 3 goto Start
Set CurrentMessage=3
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 3 hours." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg04
if %CurrentMessage% EQU 4 goto Start
Set CurrentMessage=4
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 2 hours and 30 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg05
if %CurrentMessage% EQU 5 goto Start
Set CurrentMessage=5
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 2 hours." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg06
if %CurrentMessage% EQU 6 goto Start
Set CurrentMessage=6
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 1 hour and 30 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg07
if %CurrentMessage% EQU 7 goto Start
Set CurrentMessage=7
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 1 hour." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg08
if %CurrentMessage% EQU 8 goto Start
Set CurrentMessage=8
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 30 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg09
if %CurrentMessage% EQU 9 goto Start
Set CurrentMessage=9
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 15 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg10
if %CurrentMessage% EQU 10 goto Start
Set CurrentMessage=10
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 Next server restart in 10 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg11
if %CurrentMessage% EQU 11 goto Start
Set CurrentMessage=11
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 5 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg12
if %CurrentMessage% EQU 12 goto Start
Set CurrentMessage=12
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 4 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg13
if %CurrentMessage% EQU 13 goto Start
Set CurrentMessage=13
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 3 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg14
if %CurrentMessage% EQU 14 goto Start
Set CurrentMessage=14
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 2 minutes." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg15
if %CurrentMessage% EQU 15 goto Start
Set CurrentMessage=15
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 1 minute. LogOut Now." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg16
if %CurrentMessage% EQU 16 goto Start
Set CurrentMessage=16
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 30 seconds. LogOut Now." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg17
if %CurrentMessage% EQU 17 goto Start
Set CurrentMessage=17
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 15 seconds. LogOut Now." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg18
if %CurrentMessage% EQU 18 goto Start
Set CurrentMessage=18
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 10 seconds. LogOut Now." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
Goto Start
:Msg19
if %CurrentMessage% EQU 19 goto Start
Set CurrentMessage=19
start "" /D "%BERCon_Path%" /Min BERCon.exe -host %sIP% -port %sPort% -pw %RConP% -cmd "say -1 WARNING: Server restart in 5 seconds. Server restart initiated. If you are reading this, admin's will not replace items lost due to server restart." -cmd exit
timeout /t 2 /nobreak > NUL
taskkill /im BERCon.exe /F
timeout /t 3 /nobreak > NUL
Goto ServerRestart
:LoadKickVars
Set Kick0="kick 0 Server Restart Initiated."
Set Kick1="kick 1 Server Restart Initiated."
Set Kick2="kick 2 Server Restart Initiated."
Set Kick3="kick 3 Server Restart Initiated."
Set Kick4="kick 4 Server Restart Initiated."
Set Kick5="kick 5 Server Restart Initiated."
Set Kick6="kick 6 Server Restart Initiated."
Set Kick7="kick 7 Server Restart Initiated."
Set Kick8="kick 8 Server Restart Initiated."
Set Kick9="kick 9 Server Restart Initiated."
Set Kick10="kick 10 Server Restart Initiated."
Set Kick11="kick 11 Server Restart Initiated."
Set Kick12="kick 12 Server Restart Initiated."
Set Kick13="kick 13 Server Restart Initiated."
Set Kick14="kick 14 Server Restart Initiated."
Set Kick15="kick 15 Server Restart Initiated."
Set Kick16="kick 16 Server Restart Initiated."
Set Kick17="kick 17 Server Restart Initiated."
Set Kick18="kick 18 Server Restart Initiated."
Set Kick19="kick 19 Server Restart Initiated."
Set Kick20="kick 20 Server Restart Initiated."
Set Kick21="kick 21 Server Restart Initiated."
Set Kick22="kick 22 Server Restart Initiated."
Set Kick23="kick 23 Server Restart Initiated."
Set Kick24="kick 24 Server Restart Initiated."
Set Kick25="kick 25 Server Restart Initiated."
Set Kick26="kick 26 Server Restart Initiated."
Set Kick27="kick 27 Server Restart Initiated."
Set Kick28="kick 28 Server Restart Initiated."
Set Kick29="kick 29 Server Restart Initiated."
Set Kick30="kick 30 Server Restart Initiated."
Set Kick31="kick 31 Server Restart Initiated."
Set Kick32="kick 32 Server Restart Initiated."
Set Kick33="kick 33 Server Restart Initiated."
Set Kick34="kick 34 Server Restart Initiated."
Set Kick35="kick 35 Server Restart Initiated."
Set Kick36="kick 36 Server Restart Initiated."
Set Kick37="kick 37 Server Restart Initiated."
Set Kick38="kick 38 Server Restart Initiated."
Set Kick39="kick 39 Server Restart Initiated."
Set Kick40="kick 40 Server Restart Initiated."
Set Kick41="kick 41 Server Restart Initiated."
Set Kick42="kick 42 Server Restart Initiated."
Set Kick43="kick 43 Server Restart Initiated."
Set Kick44="kick 44 Server Restart Initiated."
Set Kick45="kick 45 Server Restart Initiated."
Set Kick46="kick 46 Server Restart Initiated."
Set Kick47="kick 47 Server Restart Initiated."
Set Kick48="kick 48 Server Restart Initiated."
Set Kick49="kick 49 Server Restart Initiated."
Set Kick50="kick 50 Server Restart Initiated."
Set Kick51="kick 51 Server Restart Initiated."
Set Kick52="kick 52 Server Restart Initiated."
Set Kick53="kick 53 Server Restart Initiated."
Set Kick54="kick 54 Server Restart Initiated."
Set Kick55="kick 55 Server Restart Initiated."
Set Kick56="kick 56 Server Restart Initiated."
Set Kick57="kick 57 Server Restart Initiated."
Set Kick58="kick 58 Server Restart Initiated."
Set Kick59="kick 59 Server Restart Initiated."
Set Kick60="kick 60 Server Restart Initiated."
Set Kick61="kick 61 Server Restart Initiated."
Set Kick62="kick 62 Server Restart Initiated."
Set Kick63="kick 63 Server Restart Initiated."
Set Kick64="kick 64 Server Restart Initiated."
Set Kick65="kick 65 Server Restart Initiated."
Set Kick66="kick 66 Server Restart Initiated."
Set Kick67="kick 67 Server Restart Initiated."
Set Kick68="kick 68 Server Restart Initiated."
Set Kick69="kick 69 Server Restart Initiated."
Set Kick70="kick 70 Server Restart Initiated."
Set Kick71="kick 71 Server Restart Initiated."
Set Kick72="kick 72 Server Restart Initiated."
Set Kick73="kick 73 Server Restart Initiated."
Set Kick74="kick 74 Server Restart Initiated."
Set Kick75="kick 75 Server Restart Initiated."
Set Kick76="kick 76 Server Restart Initiated."
Set Kick77="kick 77 Server Restart Initiated."
Set Kick78="kick 78 Server Restart Initiated."
Set Kick79="kick 79 Server Restart Initiated."
Set Kick80="kick 80 Server Restart Initiated."
Set Kick81="kick 81 Server Restart Initiated."
Set Kick82="kick 82 Server Restart Initiated."
Set Kick83="kick 83 Server Restart Initiated."
Set Kick84="kick 84 Server Restart Initiated."
Set Kick85="kick 85 Server Restart Initiated."
Set Kick86="kick 86 Server Restart Initiated."
Set Kick87="kick 87 Server Restart Initiated."
Set Kick88="kick 88 Server Restart Initiated."
Set Kick89="kick 89 Server Restart Initiated."
Set Kick90="kick 90 Server Restart Initiated."
Set Kick91="kick 91 Server Restart Initiated."
Set Kick92="kick 92 Server Restart Initiated."
Set Kick93="kick 93 Server Restart Initiated."
Set Kick94="kick 94 Server Restart Initiated."
Set Kick95="kick 95 Server Restart Initiated."
Set Kick96="kick 96 Server Restart Initiated."
Set Kick97="kick 97 Server Restart Initiated."
Set Kick98="kick 98 Server Restart Initiated."
Set Kick99="kick 99 Server Restart Initiated."
GOTO :EOF