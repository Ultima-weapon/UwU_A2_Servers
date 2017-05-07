private["_unit","_hitPoints","_selection","_killer","_weapons","_magazines","_backpacks","_pos"];

_unit = _this select 0;
_killer = _this select 1;

_hitPoints = _unit call vehicle_getHitpoints;
{
	_selection = getText (configFile >> "CfgVehicles" >> (typeof _unit) >> "HitPoints" >> _x >> "name");
	_unit setVariable [_selection, 1, true];
} count _hitPoints;

/*
waitUntil {
	if(isNull _unit) exitWith {true}; 
	if(((getPosATL Player) select 2) < 5) exitWith {true};
	false;
};
	player action ["eject", _unit];
	_pos = getposATL player;
if (!(surfaceIsWater (_pos))) then {
	_weapons = getWeaponCargo _unit;
	_magazines = getMagazineCargo _unit;
	_backpacks = getBackpackCargo _unit;
	clearWeaponCargoGlobal _unit;
	{
		[(_x select 0) select 0, (_x select 0) select 1 , _Pos, 10] call spawn_loot;
	} forEach _weapons;
	clearMagazineCargoGlobal _unit;
	{
		[(_x select 0) select 0, (_x select 0) select 1 , _Pos, 10] call spawn_loot;
	} forEach _magazines;
	clearBackpackCargoGlobal _unit;
	{
		[(_x select 0) select 0, (_x select 0) select 1 , _Pos, 10] call spawn_loot;
	} forEach _backpacks;
};
*/

//["PVDZE_veh_Update",[_unit, "damage"]] call callRpcProcedure;
if (isServer) then {
	[_unit, "killed"] call server_updateObject;
} else {
	if (DZE_Debug_Damage && ((!isPlayer _unit) || ((isPlayer _unit) && (vehicle _unit != _unit) && (_unit != _killer)))) then {
		PVDZE_veh_Update = [_unit, "killed",_killer];
		_killerVeh = if (vehicle _killer != _killer) then { format["[KILLER IN VEHICLE %1 OF TYPE %2]", (vehicle _killer), (typeOf (vehicle _killer))]; } else {""};
		_name = if (alive _killer) then { name _killer; } else { format["OBJECT %1", _killer]; };
		// diag_log format["DAMAGE: Vehicle %1 (TYPE: %2) Killed by player %3 (UID: %4) %5",_unit, (typeOf _unit), _name, (getPlayerUID _killer), _killerVeh];
	} else {
		PVDZE_veh_Update = [_unit, "killed"];
	};
	publicVariableServer "PVDZE_veh_Update";
};

_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "GetIn";
//_unit removeAllEventHandlers "GetOut";