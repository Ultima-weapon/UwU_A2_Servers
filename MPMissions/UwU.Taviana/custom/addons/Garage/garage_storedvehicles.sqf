/*** Created by 0verHeaT ***/
private ["_storedvehicles","_maxstorage","_humRank"];
_storedvehicles = VirtualGarage getVariable ["StoredVehicles",[]];

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

((uiNamespace getVariable "GarageDialog") displayCtrl 5203) ctrlSetStructuredText parseText format["<t align='right'>Vehicles Stored (%1/%2)</t>",(count _storedvehicles),_maxstorage];

lbClear 5201;

VehStoredList = [];
{
	private ["_objectUID","_class","_vehname","_index","_clr1","_clr2","_cid","_fuel","_dmg","_inv","_hit","_data","_key","_keyname"];
	_objectUID = _x select 0;
	_class = _x select 1;
	_cid = _x select 2;
	_clr1 = _x select 3;
	_clr2 = _x select 4;
	_inv = _x select 5;
	_fuel = _x select 6;
	_dmg = _x select 7;
	_hit = _x select 8;
	_cid = parsenumber _cid;
	if (_cid == 0) then {_key = ""};
	if ((_cid > 0) && (_cid <= 2500)) then {_key = format["ItemKeyGreen%1",_cid];};
	if ((_cid > 2500) && (_cid <= 5000)) then {_key = format["ItemKeyRed%1",_cid-2500];};
	if ((_cid > 5000) && (_cid <= 7500)) then {_key = format["ItemKeyBlue%1",_cid-5000];};
	if ((_cid > 7500) && (_cid <= 10000)) then {_key = format["ItemKeyYellow%1",_cid-7500];};
	if ((_cid > 10000) && (_cid <= 12500)) then {_key = format["ItemKeyBlack%1",_cid-10000];};
	_vehname = getText(configFile >> "cfgVehicles" >> _class >> "displayName");
	_keyname = getText(configFile >> "CfgWeapons" >> _key >> "displayName");
	_index = lbAdd[5201,format["%1 (%2)",_vehname,_keyname]];
	_data = [[_objectUID,_class,_cid,_clr1,_clr2,_inv,_fuel,_dmg,_hit],_key];
	VehStoredList set[count VehStoredList,_data];
} count _storedvehicles;
