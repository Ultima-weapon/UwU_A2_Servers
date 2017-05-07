private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_waiting","_count","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record","_pic","_kill_txt"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;
if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};
_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];

/*
_waiting = true;
_count = 0;
while {_waiting} do
{
	_killer = _victim getVariable["AttackedBy", "Unknown"];
	if ((typeName _killer) != "STRING") then {
		_waiting = false;
	};
	_count = _count + 1;
	sleep 1;
	if (_count >= 20) then {
		_waiting = false;
	};
};
*/

_killer = _victim getVariable["AttackedBy", "Unknown"];
_killerName = _victim getVariable["AttackedByName", "Unidentified Killer"];

_weapon = _victim getVariable["AttackedByWeapon", "nil"];
_distance = _victim getVariable["AttackedFromDistance", 0];
_pic = _victim getVariable["AttackedByWeaponImg", "custom\interface\Rank10.paa"];
if ((typeName _killer) != "STRING") then {
	if ((gettext (configFile >> 'cfgWeapons' >> (currentWeapon _killer) >> 'displayName')) == "Throw") then {
		_pic == "custom\interface\Rank10.paa";
	};
	if ((owner _victim) == (owner _killer)) then {
		// Suicide
		_loc_message = format["PLAYERSUICIDE: %1 killed himself", _victimName];
		_message = format ["%1 killed himself",_victimName];
		_kill_txt = format ["<t align='left' size='0.75'>%1 </t>",_victimName];
		_kill_txt = _kill_txt + format ["<img size='1.0' align='left' image='%1'/>",_pic];
		_kill_txt = _kill_txt + format ["<t align='left' size='0.75'> Suicide</t>"];
		customkillMessage = [_kill_txt];
		publicVariable "customkillMessage";
	} else {
		// Killer found
		_loc_message = format["PLAYERKILL: %1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
		_message = format ["%1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
		_kill_txt = format ["<t align='left' size='0.75'>%1 </t>",_killerName];
		_kill_txt = _kill_txt + format ["<img size='1.0' align='left' image='%1'/>",_pic];
		_kill_txt = _kill_txt + format ["<t align='left' size='0.75'> %1 </t>",_victimName];
		_kill_txt = _kill_txt + format ["<t align='left' size='0.75'>[%1m]</t>",_distance];
		customkillMessage = [_kill_txt];
		publicVariable "customkillMessage";
	};
	if(DZE_DeathMsgGlobal) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) globalChat (_this select 1) }] call RE;
	};
	/* needs customRemoteMessage 
	if(DZE_DeathMsgGlobal) then {
		customRemoteMessage = ['globalChat', _message, _killer];
		publicVariable "customRemoteMessage";
	};
	*/
	if(DZE_DeathMsgSide) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) sideChat (_this select 1) }] call RE;
	};
	if(DZE_DeathMsgTitleText) then {
		[nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE;
	};
} else {
	// Killer not found
	_loc_message = format["PLAYERKILLED: %1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
	_message = format ["%1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
	_kill_txt = format ["<t align='left' size='0.75'>%1 </t>",_killerName];
	_kill_txt = _kill_txt + format ["<img size='1.0' align='left' image='%1'/>",_pic];
	_kill_txt = _kill_txt + format ["<t align='left' size='0.75'> %1 </t>",_victimName];
	_kill_txt = _kill_txt + format ["<t align='left' size='0.75'>[%1m]</t>",_distance];
	customkillMessage = [_kill_txt];
	publicVariable "customkillMessage";
};

diag_log _loc_message;

//Use my killboard in order to work correctly
_death_record = [
	_victimName,
	_killerName,
	_weapon,
	_pic,
	_distance,
	ServerCurrentTime
];
PlayerDeaths set [count PlayerDeaths,_death_record];
PV_DeathBoard = PlayerDeaths;
publicVariable "PV_DeathBoard";

_victim setVariable["AttackedBy","Unknown", true];
_victim setVariable["AttackedByName","Unidentified Killer", true];
_victim setVariable["AttackedByWeapon","nil", true];
_victim setVariable["AttackedFromDistance",0, true];
_victim setVariable["AttackedByWeaponImg","custom\interface\Rank10.paa", true];

_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then {
	_minutes = parseNumber _minutes;
};

diag_log ("PLAYERDEATH: Player Died " + _playerID);

if (_characterID != "0") then {
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("HIVE: WRITE: "+ str(_key));
	#endif
	_key call server_hiveWrite;
} else {
	deleteVehicle _newObject;
};
