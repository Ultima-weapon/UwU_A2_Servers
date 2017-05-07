if (isServer) then {

    private ["_mark","_marker","_rocket","_launcher","_pos_x","_pos_y","_pos_z","_aiskin","_unarmed","_current_time","_gain","_mission","_ainum","_aitype","_mission","_aipack","_aicskill","_position","_unitnumber","_skill","_gun","_mags","_backpack","_skin","_gear","_aiweapon","_aigear","_aiskin","_skillarray","_unitGroup","_weapon","_magazine","_gearmagazines","_geartools","_unit"];

	_position 			= _this select 0;
	_pos_x 			= _position select 0;
	_pos_y 			= _position select 1;
	_pos_z 			= _position select 2;
	_unitnumber 		= _this select 1;
	_skill 				= _this select 2;
	_gun 				= _this select 3;
	_mags 				= _this select 4;
	_backpack 			= _this select 5;
	_skin 				= _this select 6;
	_gear 				= _this select 7;
	_aitype				= _this select 8;
	
	if (typeName _gun == "ARRAY") then {
		_launcher		= _gun select 1;
		_gun			= _gun select 0;
	};

	if (typeName _aitype == "ARRAY") then {
		_gain 			= _aitype select 1;
		_aitype 		= _aitype select 0;
	};

	_mark				= _this select 9;	
	
	if (count _this > 10) then {
		_mission = _this select 10;
	} else {
		_mission = nil;
	};

	_aiweapon 			= [];
	_aigear 			= [];
	_aiskin 			= "";
	_aicskill 			= [];
	_aipack 			= "";
	_current_time		= time;
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

	for "_x" from 1 to _unitnumber do {

		call {
			if(typeName(_gun) == "SCALAR") then {
				if(_gun == 0) 			exitWith { _aiweapon = cai_wep_assault; };
				if(_gun == 1) 			exitWith { _aiweapon = cai_wep_machine; };
				if(_gun == 2) 			exitWith { _aiweapon = cai_wep_sniper; };
			} else {
				if(_gun == "random") 	exitWith { _aiweapon = cai_wep_random call BIS_fnc_selectRandom; };
				if(_gun == "unarmed") 	exitWith { _unarmed = true; };
				_weapon = _gun;
			}
		};

		if (!_unarmed) then {
			_weapon 	= _aiweapon call BIS_fnc_selectRandom;
			_magazine 	= _weapon 	call civ_find_suitable_ammunition;
		};

		call {
			if(typeName(_gear) == "SCALAR") then {
				if(_gear == 0) 			exitWith { _aigear = cai_gear0; };
				if(_gear == 1) 			exitWith { _aigear = cai_gear1; };
			} else {
				if(_gear == "random") 	exitWith { _aigear = cai_gear_random call BIS_fnc_selectRandom; };
			};
		};
		
		_gearmagazines 	= _aigear select 0;
		_geartools 		= _aigear select 1;

		call {
			if(_skin == "random") 	exitWith { _aiskin = cai_all_skin 		call BIS_fnc_selectRandom; };
			if(_skin == "hero") 	exitWith { _aiskin = cai_hero_skin 		call BIS_fnc_selectRandom; };
			if(_skin == "bandit") 	exitWith { _aiskin = cai_bandit_skin 	call BIS_fnc_selectRandom; };
			if(_skin == "special") 	exitWith { _aiskin = cai_special_skin 	call BIS_fnc_selectRandom; };
			_aiskin = _skin;
		};

		if(typeName _aiskin == "ARRAY") then {
			_aiskin = _aiskin call BIS_fnc_selectRandom;
		};

		_unit = _unitGroup createUnit [_aiskin,[_pos_x,_pos_y,_pos_z],[],0,"CAN COLLIDE"];
		[_unit] joinSilent _unitGroup;

		call {
			if(_aitype == "hero") 		exitWith { _unit setVariable ["Hero",true]; _unit setVariable ["humanity", cai_remove_humanity]; };
			if(_aitype == "bandit") 	exitWith { _unit setVariable ["Bandit",true]; _unit setVariable ["humanity", cai_add_humanity]; };
			if(_aitype == "special") 	exitWith { _unit setVariable ["Special",true]; _unit setVariable ["humanity", cai_special_humanity]; };
		};

		if (!isNil "_gain") then { _unit setVariable ["humanity", _gain]; };

		call {
			if(_backpack == "random") 	exitWith { _aipack = cai_packs call BIS_fnc_selectRandom; };
			if(_backpack == "none") 	exitWith { };
			_aipack = _backpack;
		};
		
		if (isNil "_mission") then {
		
			_unit enableAI "TARGET";
			_unit enableAI "AUTOTARGET";
			_unit enableAI "MOVE";
			_unit enableAI "ANIM";
			_unit enableAI "FSM";
		
		};

		removeAllWeapons _unit;
		removeAllItems _unit;

		if (sunOrMoon != 1) then {
			_unit addweapon "NVGoggles";
		};

		if (!_unarmed) then {
			for "_i" from 1 to _mags do {
				_unit addMagazine _magazine;
			};
			_unit addweapon _weapon;
			_unit selectWeapon _weapon;
		};

		if(_backpack != "none") then {
			_unit addBackpack _aipack;
		};

		{
			_unit addMagazine _x
		} count _gearmagazines;

		{
			_unit addweapon _x
		} count _geartools;
		
		if (!_unarmed) then {
			//Single Currency
			_cash = round(random 20) * 1000; // number between 0 and 20000
			_unit setVariable["CashMoney",_cash ,true];
		} else {
			_cash = round(random 20) * 100; // number between 0 and 2000
			_unit setVariable["CashMoney",_cash ,true];
		};
		
		call {
			if(_skill == "supereasy") 	exitWith { _aicskill = cai_skill_supereasy; };
			if(_skill == "easy") 		exitWith { _aicskill = cai_skill_easy; };
			if(_skill == "medium") 		exitWith { _aicskill = cai_skill_medium; };
			if(_skill == "hard") 		exitWith { _aicskill = cai_skill_hard; };
			if(_skill == "extreme") 	exitWith { _aicskill = cai_skill_extreme; };
			if(_skill == "random") 		exitWith { _aicskill = cai_skill_random call BIS_fnc_selectRandom; };
			_aicskill = cai_skill_random call BIS_fnc_selectRandom;
		};

		{
			_unit setSkill [(_x select 0),(_x select 1)]
		} count _aicskill;
		
		cai_ground_units = (cai_ground_units + 1);

		_unit addEventHandler ["Killed",{[_this select 0, _this select 1, "civground"] call civ_on_kill;}];

		if (!isNil "_mission") then {
			cai_mission_data select _mission set [0, (((cai_mission_data select _mission) select 0) + 1)];
			_unit setVariable ["civmissionclean", "civground"];
			_unit setVariable ["civmission", _mission, true];
		};
		
		_unit forceWalk true;
		_unit forceSpeed 0.5;
		
		if (_mark) then {
			_marker = "Sign_arrow_down_EP1" createVehicle _position;
			_colour = [1,0,1];
			_marker setVariable ["Colour",_colour,true];
			_marker setObjectTexture [0,"#(argb,8,8,3)color(1,0,1,0.6,ca)"];
			_marker allowDamage false;
			_marker setPos _position;
			_marker attachTo [_unit,[0,0,2.2]];
			if (!isNil "_mission") then {
				cai_mission_data select _mission set [0, (((cai_mission_data select _mission) select 0) + 1)];
				_marker setVariable ["civmissionclean", "civvehicle"];
				_marker setVariable ["civmission", _mission, true];
			};
		};

	};

	if (!isNil "_launcher" && cai_use_launchers) then {
		call {
			//if (_launcher == "Random") exitWith { _launcher = (cai_launchers_AT + cai_launchers_AA) call BIS_fnc_selectRandom; };
			if (_launcher == "at") exitWith { _launcher = cai_wep_launchers_AT call BIS_fnc_selectRandom; };
			if (_launcher == "aa") exitWith { _launcher = cai_wep_launchers_AA call BIS_fnc_selectRandom; };
		};
		_rocket = _launcher call civ_find_suitable_ammunition;
		_unit addMagazine _rocket;
		_unit addMagazine _rocket;
		_unit addWeapon _launcher;
	};

	_unitGroup setFormation "ECH LEFT";
	_unitGroup selectLeader ((units _unitGroup) select 0);

	if(_aitype == "Hero") then {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn civ_hero_behaviour;
		} else {
			[_unitGroup] spawn civ_hero_behaviour;
		};
	} else {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn civ_bandit_behaviour;
		} else {
			[_unitGroup] spawn civ_bandit_behaviour;
		};
	};

	if(_pos_z == 0) then {
		[_unitGroup,[_pos_x,_pos_y,_pos_z],_skill] spawn civ_group_waypoints;
	};

	diag_log format ["CAI: Spawned a group of %1 AI (%3) at %2",_unitnumber,_position,_aitype];
	
	_unitGroup
};