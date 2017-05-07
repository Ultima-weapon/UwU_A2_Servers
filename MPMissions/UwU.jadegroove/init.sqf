dayz_antihack = 0; dayz_REsec = 0; startLoadingScreen ["","RscDisplayLoadCustom"]; cutText ["","BLACK OUT"]; enableSaving [false, false];
dayZ_instance = 26; dayz_serverName = "@UwU.Lingor"; dayzHiveRequest = []; initialized = false; dayz_previousID = 0; player setVariable ["BIS_noCoreConversations", true]; enableRadio false; enableSentences false;
call compile preprocessFileLineNumbers "custom\config.sqf";
call compile preprocessFileLineNumbers "custom\variables.sqf";
call compile preprocessFileLineNumbers "custom\addons\Buildables\variables.sqf";
call compile preprocessFileLineNumbers "custom\origins\config.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "custom\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "custom\compiles.sqf";
call compile preprocessFileLineNumbers "custom\addons\Buildables\Crafting_Compiles.sqf";
call compile preprocessFileLineNumbers "custom\addons\dzap\init.sqf";
call compile preprocessFileLineNumbers "custom\compile\ZSCinit.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";
call compile preprocessFileLineNumbers "custom\addons\Nuke\Settings.sqf";
progressLoadingScreen 1.0;
"filmic" setToneMappingParams [0.153,0.357,0.231,0.1573,0.011,3.750,6,4]; setToneMapping "Filmic";
if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\UwU.jadegroove\dynamic_vehicle.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\UwU.jadegroove\mission.sqf";
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
	execVM "custom\addons\Nuke\server_Nuke.sqf";
	axe_server_log = compile preprocessFileLineNumbers "custom\compile\logtorpt.sqf";
	"axeDiagLog" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_log};
};
if (!isDedicated) then {
	0 fadeSound 0; waitUntil {!isNil "dayz_loadScreenMsg"}; dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}]; _playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	_nil = [] execVM "custom\addons\earthquake\earthquake.sqf";
	execVM "custom\addons\spawn\start.sqf"; execVM "custom\interface\playerHud.sqf";
	["custom\compile"] execVM "custom\compile\elevator_init.sqf";
	_nil = [] execVM "custom\actions\EvacChopper_init.sqf";
	_nil = [] execVM "custom\compile\remote.sqf";
	_nil = [] execVM "custom\compile\VehicleKeyChanger_init.sqf";
	execVM "custom\compile\service_point.sqf";
	execVM "custom\addons\Nuke\Effects\effects.sqf";
	execVM "custom\addons\dzgm\init.sqf";
	_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";
	_nil = [] execVM "custom\addons\VASP\VASP_init.sqf";
	execVM "custom\interface\kill_msg.sqf";
};
execVM "custom\compile\DynamicWeatherEffects.sqf";
[] execVM "custom\compile\safezone.sqf";
[] execVM "custom\addons\logistics\Logistic_Init.sqf";
[] execVM 'custom\addons\logistics\Tow\init.sqf';
execVM "custom\addons\logistics\R3F_ARTY_AND_LOG\init.sqf";
execVM "custom\addons\carradio\initCarRadio.sqf";
[] execVM "custom\addons\bon_recruit_units\init.sqf";
execVM "custom\addons\weed\farms.sqf";
[] execVM "custom\addons\customMap\jadePrison.sqf";
[] execVM "custom\addons\customMap\swAirstrip.sqf";
[] execVM "custom\addons\customMap\neAirstrip.sqf";
[] execVM "custom\addons\customMap\dogTown.sqf";
[] execVM "custom\addons\customMap\linfort.sqf";
[] execVM "custom\addons\customMap\battleArena.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf";
// [10,true,10,10,true,10] execFSM "custom\compile\core_time.fsm";
_pic = "custom\interface\UwU_logo.paa"; ['<img align=''left'' size=''2.0'' shadow=''0'' image='+(str(_pic))+' />',safeZoneX+0.027,safeZoneY+safeZoneH-0.2,99999,0,0,3090] spawn bis_fnc_dynamicText;
remote_log = {
	axeDiagLog = _this select 0;
	publicVariable "axeDiagLog";
};