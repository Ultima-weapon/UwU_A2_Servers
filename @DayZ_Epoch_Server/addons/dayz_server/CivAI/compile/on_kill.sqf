if (isServer) then {

	private ["_rockets","_launcher","_type","_skin","_gain","_mission","_ainum","_unit","_player","_humanity","_banditkills","_humankills","_humanitygain"];
	
	_unit 		= _this select 0;
	_player 	= _this select 1;
	_type 		= _this select 2;
	_launcher 	= secondaryWeapon _unit;

	call {
		if(_type == "civground") 	exitWith { cai_ground_units = (cai_ground_units -1); };
		if(_type == "civair") 		exitWith { cai_air_units = (cai_air_units -1); };
		if(_type == "civvehicle") 	exitWith { cai_vehicle_units = (cai_vehicle_units -1); };
		if(_type == "civstatic") 	exitWith { cai_emplacement_units = (cai_emplacement_units -1); };
	};
	
	_unit setVariable["civmissionclean", nil];
	
	_mission = _unit getVariable ["civmission", nil];
		
	if (!isNil "_mission") then {
		if (typeName(cai_mission_data select _mission) == "ARRAY") then {
			cai_mission_data select _mission set [0, ((cai_mission_data select _mission) select 0) - 1];
		};
	};
	_unit setVariable ["civkilledat", time];

	if(cai_add_skin) then {

		_skin = (typeOf _unit);
		_skin = "Skin_" + _skin;

		if (isClass (configFile >> "CfgMagazines" >> _skin)) then {
			[_unit,_skin] call BIS_fnc_invAdd;
		};

	};

	if (isPlayer _player) then {

		private ["_banditkills","_humanity","_humankills"];

		_humanity 		= _player getVariable["humanity",0];
		_banditkills 	= _player getVariable["banditKills",0];
		_humankills 	= _player getVariable["humanKills",0];

		if (cai_humanity_gain) then {
			_gain = _unit getVariable ["humanity", 0];
			call {
				if (_unit getVariable ["Hero", false]) exitWith { _player setVariable ["humanity",(_humanity - _gain),true]; };
				if (_unit getVariable ["Bandit", false]) exitWith { _player setVariable ["humanity",(_humanity + _gain),true]; };					
				if (_unit getVariable ["Special", false]) exitWith { if (_humanity < 0) then { _player setVariable ["humanity",(_humanity - _gain),true]; } else { _player setVariable ["humanity",(_humanity + _gain),true]; }; };
			};
		};

		if (cai_kills_gain) then {
			if (_unit getVariable ["Hero", false]) then {
				_player setVariable ["humanKills",(_humankills + 1),true];
			} else {
				_player setVariable ["banditKills",(_banditkills + 1),true];
			};
		};

		if (cai_clear_body) then {
			{_unit removeMagazine _x;} count (magazines _unit);
			{_unit removeWeapon _x;} count (weapons _unit);
		};

		if (cai_share_info) then {
			{
				if (((position _x) distance (position _unit)) <= cai_share_distance) then {
					_x reveal [_player, 4.0];
				};
			} count allUnits;
		};

	} else {

		if (cai_clean_roadkill) then {

			removeBackpack _unit;
			removeAllWeapons _unit;

			{
				_unit removeMagazine _x
			} count magazines _unit;

		} else {

			if ((random 100) <= cai_roadkill_damageweapon) then {

				removeAllWeapons _unit;
				
			};

		};

	};

	if(cai_remove_launcher && _launcher != "") then {

		_rockets = _launcher call civ_find_suitable_ammunition;
		_unit removeWeapon _launcher;
		
		{
			if(_x == _rockets) then {
				_unit removeMagazine _x;
			};
		} count magazines _unit;
		
	};

	if(_unit hasWeapon "NVGoggles" && floor(random 100) < 20) then {
		_unit removeWeapon "NVGoggles";
	};

};