_create = _this select 0;
_player = _this select 1;
_typeorunit = _this select 2;

if(_create)then{
//gear items the ai will always have, all ai weapons/items and magazines are removed upon death
	_items = ["ItemRadio","ItemCompass","ItemMap","ItemWatch","ItemGPS","NVGoggles"];
/********************* UNIT CREATION ********************/
	_pos = getPos _player;
	diag_log format["[PMC_CONTRACTOR]: %1 (%2) Hired a %3 @ (%4) %5",name _player,getPlayerUID _player,_typeorunit,mapGridPosition _pos,_pos];
	_unit = (group _player) createUnit [_typeorunit, _pos, [], 0, "FORM"];
	_unit setVehicleInit "this addAction [""<t color='#949494'>Dismiss!</t>"",(BON_RECRUIT_PATH + 'dismiss.sqf'),[],-10,false,true,""""];[this] spawn Halv_units_control;";
	//_unit setVehicleInit "[this] spawn Halv_units_control;";
	_unit setRank "PRIVATE";
	_unit setCombatMode "YELLOW";
	
	_humRank = player getVariable['humanity', 0];
	// NO RANK
	if(_humRank < 5000 && _humRank > -5000) then {_unit setskill 0.05;;};
	// HERO RANK
	if(_humRank >= 5000 && _humRank < 10000) then {_unit setskill 0.1;};
	if(_humRank >= 10000 && _humRank < 15000) then {_unit setskill 0.2;};
	if(_humRank >= 15000 && _humRank < 25000) then {_unit setskill 0.3;};
	if(_humRank >= 25000 && _humRank < 40000) then {_unit setskill 0.4;};
	if(_humRank >= 40000 && _humRank < 60000) then {_unit setskill 0.5;};
	if(_humRank >= 60000 && _humRank < 90000) then {_unit setskill 0.6;};
	if(_humRank >= 90000 && _humRank < 130000) then {_unit setskill 0.7;};
	if(_humRank >= 130000 && _humRank < 185000) then {_unit setskill 0.8;};
	if(_humRank >= 185000 && _humRank < 250000) then {_unit setskill 0.9;};
	if(_humRank >= 250000) then {_unit setskill 1;};
	// BANDIT RANK
	if(_humRank <= -5000 && _humRank > -10000) then {_unit setskill 0.1;};
	if(_humRank <= -10000 && _humRank > -15000) then {_unit setskill 0.15;};
	if(_humRank <= -15000 && _humRank > -25000) then {_unit setskill 0.2;};
	if(_humRank <= -25000 && _humRank > -40000) then {_unit setskill 0.25;};
	if(_humRank <= -40000 && _humRank > -60000) then {_unit setskill 0.3;};
	if(_humRank <= -60000 && _humRank > -90000) then {_unit setskill 0.35;};
	if(_humRank <= -90000 && _humRank > -130000) then {_unit setskill 0.4;};
	if(_humRank <= -130000 && _humRank > -185000) then {_unit setskill 0.45;};
	if(_humRank <= -185000 && _humRank > -250000) then {_unit setskill 0.5;};
	if(_humRank <= -250000) then {_unit setskill 0.55;};
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setBehaviour "AWARE";
	_unit setFormation "WEDGE";
	processInitCommands;
//	_text = format["<t color='#949494'>Dismiss %1</t>",name _unit];
//	[nil,_player,rADDACTION,_text, (BON_RECRUIT_PATH + "dismiss.sqf"),[_unit],-10,false,true,""] call RE;
	_unit addEventHandler ["Killed",{[_this select 0, _this select 1, "ground"] call on_kill;}];

	removeAllWeapons _unit;
	removeAllItems _unit;
	{_unit removeMagazine _x}forEach magazines _unit;
	private ["_weap"];
	switch (typeof _unit) do {

		case "Rocket_DZ":{
			_weap = "RH_Deagleg";
		};
		case "Soldier1_DZ":{
			_weap = "M16A4_ACG";
		};
		case "Sniper1_DZ":{
			_weap = "SCAR_H_LNG_Sniper";
		};
		case "CZ_Soldier_Sniper_EP1_DZ":{
			_weap = "USSR_cheytacM200";
		};
		case "Camo1_DZ":{
			_weap = "Sa58V_EP1";
		};
		case "FR_OHara_DZ":{
			_weap = "AKS_74_kobra";
		};
		case "FR_Rodriguez_DZ":{
			_weap = "AK_74";
		};
		case "Graves_Light_DZ":{
			_weap = "RH_hk416glacog";
		};
		case "CZ_Special_Forces_GL_DES_EP1_DZ":{
			_weap = "SCAR_H_STD_EGLM_Spect";
		};
		case "Soldier_Bodyguard_AA12_PMC_DZ":{
			_weap = "M9";
		};
		case "Soldier_Sniper_PMC_DZ":{
			_weap = "RH_hk417acog";
		};
		default{
			_mag = "";
			_weap = "";
		};
	};


	if(_weap != "")then{
		_items set [count _items,_weap];
		_mags = getArray (configfile >> 'cfgWeapons' >> _weap >> 'magazines');
		_mag = _mags select 0;
		for "_i" from 0 to 5 do{
			_unit addMagazine _mag;
		};
//		diag_log format["[PMC_CONTRACTOR]: %1 (%2) %3 (%4) %5",_items,_mags,_mag,mapGridPosition _player,getPos _player];
	};
	
	{if !(_unit hasWeapon _x)then{_unit addWeapon _x;};}forEach _items;
	reload _unit;
	/*******************************************************/
	[_unit] joinSilent (group _player);
	(group _player) selectLeader _player;
	[_unit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
}else{
	diag_log format["[PMC_CONTRACTOR]: %1 (%2) Dismissed/Killed a %3 @ (%4) %5",name _player,getPlayerUID _player,typeOf _typeorunit,mapGridPosition _player,getPos _player];
	_delgrp = createGroup west;
	[_typeorunit] joinSilent _delgrp;
	_typeorunit enableSimulation false;
	_typeorunit removeAllMPEventHandlers "mpkilled";
	_typeorunit removeAllMPEventHandlers "mphit";
	_typeorunit removeAllMPEventHandlers "mprespawn";
	_typeorunit removeAllEventHandlers "FiredNear";
	_typeorunit removeAllEventHandlers "HandleDamage";
	_typeorunit removeAllEventHandlers "Killed";
	_typeorunit removeAllEventHandlers "Fired";
	_typeorunit removeAllEventHandlers "GetOut";
	_typeorunit removeAllEventHandlers "GetIn";
	_typeorunit removeAllEventHandlers "Local";
	clearVehicleInit _typeorunit;
	deleteVehicle _typeorunit;
	deleteGroup (group _typeorunit);
	_typeorunit = nil;
};
