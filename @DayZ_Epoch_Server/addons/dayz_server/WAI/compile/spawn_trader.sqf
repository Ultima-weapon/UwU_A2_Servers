/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if (isServer) then {

    private ["_pos_x","_pos_y","_pos_z","_aiskin","_unarmed","_gain","_aitype","_position","_gun","_skin","_aiweapon","_aiskin","_unitGroup","_weapon","_unit"];

	_position 			= _this select 0;
	_pos_x 			= _position select 0;
	_pos_y 			= _position select 1;
	_pos_z 			= _position select 2;
	_gun 				= _this select 1;
	_skin 				= _this select 2;
	_aitype				= _this select 3;

	if (typeName _aitype == "ARRAY") then {
		_gain 			= _aitype select 1;
		_aitype 		= _aitype select 0;
	};

	_aiweapon 			= [];
	_aiskin 			= "";
	_unarmed			= false;

	if(_aitype == "Hero") then {
		_unitGroup	= createGroup RESISTANCE;
	} else {
		_unitGroup	= createGroup EAST;
	};

	if(_pos_z == 0) then {
		if(floor(random 2) == 1) then { 
			_pos_x = _pos_x - (5 + random(25));
		} else {
			_pos_x = _pos_x + (5 + random(25));
		};			

		if(floor(random 2) == 1) then { 
			_pos_y = _pos_y - (5 + random(25));
		} else {
			_pos_y = _pos_y + (5 + random(25));
		};
	};

	call {
		if(typeName(_gun) == "SCALAR") then {
			if(_gun == 0) 			exitWith { _aiweapon = ai_wep_assault; };
			if(_gun == 1) 			exitWith { _aiweapon = ai_wep_machine; };
			if(_gun == 2) 			exitWith { _aiweapon = ai_wep_sniper; };
		} else {
			if(_gun == "random") 	exitWith { _aiweapon = ai_wep_random call BIS_fnc_selectRandom; };
			if(_gun == "unarmed") 	exitWith { _unarmed = true; };
			_weapon = _gun;
		}
	};

	if (!_unarmed) then {
		_weapon 	= _aiweapon call BIS_fnc_selectRandom;
	};

	_aiskin = _skin;

	_unit = _unitGroup createUnit [_aiskin,[_pos_x,_pos_y,_pos_z],[],0,"CAN COLLIDE"];
	[_unit] joinSilent _unitGroup;

	call {
		if(_aitype == "hero") 		exitWith { _unit setVariable ["Hero",true]; _unit setVariable ["humanity", ai_remove_humanity]; };
		if(_aitype == "bandit") 	exitWith { _unit setVariable ["Bandit",true]; _unit setVariable ["humanity", ai_add_humanity]; };
		if(_aitype == "Special") 	exitWith { _unit setVariable ["Special",true]; _unit setVariable ["humanity", ai_special_humanity]; };
	};

	if (!isNil "_gain") then { _unit setVariable ["humanity", _gain]; };
	
	_unit allowDammage false; 
	_unit disableAI 'FSM'; 
	_unit disableAI 'MOVE'; 
	_unit disableAI 'AUTOTARGET'; 
	_unit disableAI 'TARGET'; 
	_unit setBehaviour 'CARELESS'; 
	_unit forceSpeed 0;
	_unit enableSimulation false;

	removeAllWeapons _unit;
	removeAllItems _unit;

	if (!_unarmed) then {
		_unit addweapon _weapon;
		_unit selectWeapon _weapon;
	};

	_unitGroup selectLeader ((units _unitGroup) select 0);

	diag_log format ["WAI: Spawned a trader at %1",_position];
	
	_unitGroup
};