/*** Created by 0verHeaT ***/
private ["_index","_veh","_vehicle","_key","_stored","_maxstorage","_vehname","_cost","_wealth","_humRank"];
_index = _this select 0;
if (_index < 0) exitWith {cutText["\n\nNo Vehicle selected!","PLAIN DOWN"]};

_stored = VirtualGarage getVariable ["StoredVehicles",[]];

_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {_maxstorage = 1;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {_maxstorage = 1;};
if(_humRank >= 10000 && _humRank < 15000) then {_maxstorage = 2;};
if(_humRank >= 15000 && _humRank < 25000) then {_maxstorage = 3;};
if(_humRank >= 25000 && _humRank < 40000) then {_maxstorage = 4;};
if(_humRank >= 40000 && _humRank < 60000) then {_maxstorage = 5;};
if(_humRank >= 60000 && _humRank < 90000) then {_maxstorage = 6;};
if(_humRank >= 90000 && _humRank < 130000) then {_maxstorage = 7;};
if(_humRank >= 130000 && _humRank < 185000) then {_maxstorage = 8;};
if(_humRank >= 185000 && _humRank < 250000) then {_maxstorage = 9;};
if(_humRank >= 250000) then {_maxstorage = 10;};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {_maxstorage = 1;};
if(_humRank <= -10000 && _humRank > -15000) then {_maxstorage = 1;};
if(_humRank <= -15000 && _humRank > -25000) then {_maxstorage = 2;};
if(_humRank <= -25000 && _humRank > -40000) then {_maxstorage = 2;};
if(_humRank <= -40000 && _humRank > -60000) then {_maxstorage = 3;};
if(_humRank <= -60000 && _humRank > -90000) then {_maxstorage = 3;};
if(_humRank <= -90000 && _humRank > -130000) then {_maxstorage = 4;};
if(_humRank <= -130000 && _humRank > -185000) then {_maxstorage = 4;};
if(_humRank <= -185000 && _humRank > -250000) then {_maxstorage = 5;};
if(_humRank <= -250000) then {_maxstorage = 5;};

if ((count _stored) >= _maxstorage) exitWith {cutText["\n\nThe store limit of your Virtual Garage has been reached!","PLAIN DOWN"]};

_veh = VehNearbyList select _index;
_vehicle = _veh select 0;
_key = _veh select 1;
_vehname = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName");

if (_key == "") exitWith {cutText["\n\nYou can only store lockable vehicles!","PLAIN DOWN"]};

if(!(_key in weapons player)) exitWith {cutText["\n\nYou have to have the key for the vehicle in your inventory!","PLAIN DOWN"]};

_cost = 10000;
_wealth = player getVariable["cashMoney",0];
if(_wealth < _cost) exitWith {cutText [format["You need %1 coins to store a vehicle.",_cost], "PLAIN DOWN"]};
player setVariable["cashMoney",(_wealth - _cost),true];
//player removeWeapon _key;

PVDZE_veh_store = [player,_vehicle,VirtualGarage];
publicVariableServer "PVDZE_veh_store";

cutText [format["\n\nYou have successfully stored your %1, %2 has been copied and stored with your vehicle.",_vehname,getText(configFile >> "CfgWeapons" >> _key >> "displayName")],"PLAIN DOWN"];

sleep 2;
call garage_getnearVeh;
call garage_getstoredVeh;
