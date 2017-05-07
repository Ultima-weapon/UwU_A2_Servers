/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if (isServer) then {

	private ["_mission_data","_pos_x","_pos_y","_ainum","_missionrunning","_aitype","_helipos1","_geartools","_gearmagazines","_cleanheli","_drop","_helipos","_gunner2","_gunner","_player_present","_skillarray","_aicskill","_aiskin","_aigear","_wp","_helipatrol","_gear","_skin","_backpack","_mags","_gun","_triggerdis","_startingpos","_aiweapon","_mission","_heli_class","_aipack","_helicopter","_unitGroup","_pilot","_skill","_paravehicle","_position","_wp1"];
	
	_position 		= _this select 0;
	_pos_x			= _position select 0;
	_pos_y			= _position select 1;
	_startingpos 	= _this select 1;
	_triggerdis 	= _this select 2;
	_heli_class 	= _this select 3;
	_veh_class	 	= _this select 4;
	_wpnum			= _this select 5;
	_radius			= _this select 6;
	_skill 			= _this select 7;
	_skin 			= _this select 8;
	_aitype			= _this select 9;
	_helipatrol 	= _this select 10; // Disabled
	
	if (count _this > 11) then {
		_mission = _this select 11;
	} else {
		_mission = nil;
	};

	_skillarray 	= ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
	
	if(debug_mode) then { diag_log "WAI: Paradrop Vehicle waiting for player"; };	
	
	waitUntil
	{
		sleep 10;

		_player_present = false;

		{
			if((isPlayer _x) && (_x distance [_pos_x,_pos_y,0] <= _triggerdis)) then {
				_player_present = true;
			};
		} count playableUnits;

		(_player_present)
	};
	
	_skillarray = ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
	
	call {
		if(_skill == "supereasy") 		exitWith { _aicskill = ai_skill_supereasy; };
		if(_skill == "easy") 		exitWith { _aicskill = ai_skill_easy; };
		if(_skill == "medium") 		exitWith { _aicskill = ai_skill_medium; };
		if(_skill == "hard") 		exitWith { _aicskill = ai_skill_hard; };
		if(_skill == "extreme") 	exitWith { _aicskill = ai_skill_extreme; };
		if(_skill == "random") 		exitWith { _aicskill = ai_skill_random call BIS_fnc_selectRandom; };
		_aicskill = ai_skill_random call BIS_fnc_selectRandom;
	};

	call {
		if(_skin == "random") 	exitWith { _aiskin = ai_all_skin call BIS_fnc_selectRandom; };
		if(_skin == "hero") 	exitWith { _aiskin = ai_hero_skin call BIS_fnc_selectRandom; };
		if(_skin == "bandit") 	exitWith { _aiskin = ai_bandit_skin call BIS_fnc_selectRandom; };
		if(_skin == "special") 	exitWith { _aiskin = ai_special_skin call BIS_fnc_selectRandom; };
		_aiskin = _skin;
	};
	
	if(typeName _aiskin == "ARRAY") then {
		_aiskin = _aiskin call BIS_fnc_selectRandom;
	};

	if(!isNil "_mission") then {
		_missionrunning = (typeName (wai_mission_data select _mission) == "ARRAY");
	} else {
		_missionrunning = true;
	};
	
	if(!_missionrunning) exitWith { if(debug_mode) then { diag_log format["WAI: Mission at %1 already ended, aborting para drop vehicle",_position]; }; };
	if(debug_mode) then { diag_log format ["WAI: Spawning a %1 with %2 to be para dropped at %3",_heli_class,_veh_class,_position]; };

	if(_aitype == "Hero") then {
		_unitGroup	= createGroup RESISTANCE;
	} else {
		_unitGroup	= createGroup EAST;
	};

	_pilot = _unitGroup createUnit [_aiskin,[0,0,0],[],1,"NONE"];
	[_pilot] joinSilent _unitGroup;
	
	ai_air_units = (ai_air_units +1);
	
	_helicopter = createVehicle [_heli_class,[(_startingpos select 0),(_startingpos select 1),100],[],0,"FLY"];
	_helicopter setFuel 1;
	_helicopter engineOn true;
	_helicopter setVehicleAmmo 1;
	_helicopter flyInHeight 150;
	_helicopter addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];
	
	_pilot assignAsDriver _helicopter;
	_pilot moveInDriver _helicopter;	
	
	call {
		if (_aitype == "Hero") 		exitWith { { _x setVariable ["Hero",true]; _x setVariable ["humanity", ai_add_humanity]; } count [_pilot]; };
		if (_aitype == "Bandit") 	exitWith { { _x setVariable ["Bandit",true]; _x setVariable ["humanity", ai_remove_humanity]; } count [_pilot]; };
		if (_aitype == "Special") 	exitWith { { _x setVariable ["Special",true]; _x setVariable ["humanity", ai_special_humanity]; } count [_pilot]; };
	};
	
	{
		_pilot setSkill [_x,1]
	} count _skillarray;
	
	{
		_x addweapon "Makarov";
		_x addmagazine "8Rnd_9x18_Makarov";
		_x addmagazine "8Rnd_9x18_Makarov";
	} count (units _unitgroup);
	
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_helicopter];
	[_helicopter] spawn vehicle_monitor;
	
	_unitGroup allowFleeing 0;
	_unitGroup setBehaviour "CARELESS";
	_unitGroup setSpeedMode "FULL";
	
	if(_aitype == "Hero") then {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn hero_behaviour;
		} else {
			[_unitGroup] spawn hero_behaviour;
		};
	} else {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn bandit_behaviour;
		} else {
			[_unitGroup] spawn bandit_behaviour;
		};
	};
	
	// Add waypoints to the chopper group.
	_wp = _unitGroup addWaypoint [[(_position select 0), (_position select 1)], 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 10;

	_drop = True;
	_helipos = getpos _helicopter;

	while {(alive _helicopter) && (_drop)} do {

		private ["_ainum","_vehicle","_gunner","_gunner2","_veh","_vunitGroup","_vpilot","_wp","_chute","_height"];
		sleep 1;
		_helipos = getpos _helicopter;	
		if (_helipos distance [(_position select 0),(_position select 1),100] <= 300) then {
	
			if(_aitype == "Hero") then {
				_vunitGroup	= createGroup RESISTANCE;
			} else {
				_vunitGroup	= createGroup EAST;
			};
	
			_vpilot = _vunitGroup createUnit [_aiskin, [0,0,0], [], 1, "NONE"];
			[_vpilot] joinSilent _vunitGroup;
			
			call {
				if (_aitype == "hero") 		exitWith { _pilot setVariable ["Hero",true,true]; };
				if (_aitype == "bandit") 	exitWith { _pilot setVariable ["Bandit",true,true]; };
				if (_aitype == "special") 	exitWith { _pilot setVariable ["Special",true,true]; };
			};
			
			ai_vehicle_units = (ai_vehicle_units + 1);
			
			_vehicle = createVehicle [_veh_class, [(_helipos select 0),(_helipos select 1), (_helipos select 2) - 20], [], 0, "CAN_COLLIDE"];
			_vehicle setFuel 1;
			_vehicle engineOn true;
			_vehicle setVehicleAmmo 1;
			_vehicle addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];
			_vehicle allowCrewInImmobile true; 
			_vehicle lock true;
			
			_chute = createVehicle ["ParachuteMediumEast", [((position _helicopter) select 0),((position _helicopter) select 1),((position _helicopter) select 2) - 20], [], 0, "NONE"];
			_height = [_helicopter, _vehicle] call getParaVehicleHeight;
			_vehicle attachTo [_chute, [0,0,0]];
			while {_height > 1} do {
				sleep 0.1;
				_height = [_helicopter, _vehicle] call getParaVehicleHeight;
			};
			detach _vehicle;
			
			PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_vehicle];

			_vpilot assignAsDriver _vehicle;
			_vpilot moveInDriver _vehicle;

			
			// Gunners ///////////////////////////////
			if (_vehicle isKindOf "BMP2_INS" || _vehicle isKindOf "ZSU_INS" || _vehicle isKindOf "T72_INS" || _vehicle isKindOf "M1A1_US_DES_EP1" || _vehicle isKindOf "M1A1" || _vehicle isKindOf "M1A2_US_TUSK_MG_EP1" || _vehicle isKindOf "M1A2_TUSK_MG") then {
				_gunner2 = _unitGroup createUnit [_aiskin, [0,0,0], [], 1, "NONE"];
				_gunner2 assignAsCommander _vehicle;
				_gunner2 moveInCommander _vehicle;
				[_gunner2] joinSilent _vunitGroup;
				call {
					if (_aitype == "hero") 		exitWith { _gunner2 setVariable ["Hero",true,true]; };
					if (_aitype == "bandit") 	exitWith { _gunner2 setVariable ["Bandit",true,true]; };
					if (_aitype == "special") 	exitWith { _gunner2 setVariable ["Special",true,true]; };
				};
				ai_vehicle_units = (ai_vehicle_units + 1);
				{
					_gunner2 setSkill [(_x select 0),(_x select 1)];
				} count _aicskill;
			};
			_gunner = _unitGroup createUnit [_aiskin, [0,0,0], [], 1, "NONE"];
			_gunner assignAsGunner _vehicle;
			_gunner moveInTurret [_vehicle,[0]];
			[_gunner] joinSilent _vunitGroup;
			call {
				if (_aitype == "hero") 		exitWith { _gunner setVariable ["Hero",true,true]; };
				if (_aitype == "bandit") 	exitWith { _gunner setVariable ["Bandit",true,true]; };
				if (_aitype == "special") 	exitWith { _gunner setVariable ["Special",true,true]; };
			};
			ai_vehicle_units = (ai_vehicle_units + 1);
			{
				_gunner setSkill [(_x select 0),(_x select 1)];
			} count _aicskill;
			/////////////////////////////////////////////
			
			{
				_vpilot setSkill [_x,1]
			} count _skillarray;
			
			{
				_x addweapon "Makarov";
				_x addmagazine "8Rnd_9x18_Makarov";
				_x addmagazine "8Rnd_9x18_Makarov";
			} count (units _vunitGroup);

			{
				_x addEventHandler ["Killed",{[_this select 0, _this select 1, "vehicle"] call on_kill;}];
			} forEach (units _vunitGroup);

			if (!isNil "_mission") then {
				_vehicle setVariable ["missionclean","vehicle"];
				_vehicle setVariable ["mission",_mission];
				{
					if(typeName (wai_mission_data select _mission) == "ARRAY") then {
						_ainum = (wai_mission_data select _mission) select 0;
						wai_mission_data select _mission set [0, (_ainum + 1)];
						_x setVariable ["mission",_mission]; 
					};
				} count (crew _vehicle);
			};

			[_vehicle] spawn vehicle_monitor;

			_vunitGroup allowFleeing 0;

			if(_aitype == "Hero") then {
				if (!isNil "_mission") then {
					[_vunitGroup, _mission] spawn hero_behaviour;
				} else {
					[_vunitGroup] spawn hero_behaviour;
				};
			} else {
				if (!isNil "_mission") then {
					[_vunitGroup, _mission] spawn bandit_behaviour;
				} else {
					[_vunitGroup] spawn bandit_behaviour;
				};
			};

			_vunitGroup setBehaviour "AWARE";
			_vunitGroup setCombatMode "RED";

			if(_wpnum > 0) then {

				for "_x" from 1 to _wpnum do
				{		
					_wp = _vunitGroup addWaypoint [[(_position select 0),(_position select 1),0],_radius];
					_wp setWaypointType "SAD";
					_wp setWaypointCompletionRadius 200;
				};

			};

			_wp = _vunitGroup addWaypoint [[(_position select 0),(_position select 1),0],100];
			_wp setWaypointType "CYCLE";
			_wp setWaypointCompletionRadius 200;
			
			_vunitGroup;
			_drop = False;
		};
	};

	{
		_x doMove [(_startingpos select 0), (_startingpos select 1), 100]
	} count (units _unitGroup);
	
	_unitGroup setBehaviour "CARELESS";
	_unitGroup setSpeedMode "FULL";

	if(_aitype == "Hero") then {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn hero_behaviour;
		} else {
			[_unitGroup] spawn hero_behaviour;
		};
	} else {
		if (!isNil "_mission") then {
			[_unitGroup, _mission] spawn bandit_behaviour;
		} else {
			[_unitGroup] spawn bandit_behaviour;
		};
	};
	
	_cleanheli = true;

	while {_cleanheli} do {

		sleep 5;
		_helipos1 = getpos _helicopter;

		if ((_helipos1 distance [(_startingpos select 0),(_startingpos select 1),100] <= 200) || (!alive _helicopter)) then {
			
			deleteVehicle _helicopter;
			{
				deleteVehicle _x;
				ai_air_units = (ai_air_units -1);
			} count (units _unitgroup);

			deleteGroup _unitGroup;
			if(debug_mode) then { diag_log "WAI: Paradrop helicopter cleaned"; };
			_cleanheli = false;
		};

	};

};