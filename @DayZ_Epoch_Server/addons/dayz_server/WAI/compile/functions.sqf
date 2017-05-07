/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

getParaVehicleHeight = {
    private ["_height","_chopper","_cargo","_cargo_position","_cargo_position_asl","_objects"];
    _chopper = _this select 0;
	_cargo = _this select 1;
	
	_cargo_position = getpos(_cargo);
	_cargo_position_asl = getposASL(_cargo);
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos: %1", _cargo_position];
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos ASL: %1", _cargo_position_asl];
	_height = 0;

	//diag_log ("DEBUG BTC LIFT: Getting Objects");
	_objects = lineIntersectsWith [_cargo_position_asl, [(_cargo_position_asl select 0), (_cargo_position_asl select 1), -2000], _chopper, _cargo, true];
	//diag_log format ["DEBUG BTC LIFT: Objects: %1", _objects];
	if ((count _objects) > 0) then {
		//diag_log ("DEBUG BTC LIFT: Object count check true");
		_height = _cargo distance (_objects select 0);
	} else {
		//diag_log ("DEBUG BTC LIFT: Object count check false");
		_height = _cargo_position select 2;
	};
	//diag_log format ["DEBUG BTC LIFT: Pre _height: %1", _height];
	_height
};

find_suitable_ammunition = {

	private["_weapon","_result","_ammoArray"];

	_result 	= false;
	_weapon 	= _this;
	_ammoArray 	= getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

	if (count _ammoArray > 0) then {
		_result = _ammoArray select 0;
		call {
			if(_result == "20Rnd_556x45_Stanag") 	exitWith { _result = "30Rnd_556x45_Stanag"; };
			if(_result == "30Rnd_556x45_G36") 		exitWith { _result = "30Rnd_556x45_Stanag"; };
			if(_result == "30Rnd_556x45_G36SD") 	exitWith { _result = "30Rnd_556x45_StanagSD"; };
		};
	};

	_result

};

hero_warning = {

	private ["_warned"];
	_position = _this select 0;
	_mission = _this select 1;
	_running = (typeName (wai_mission_data select _mission) == "ARRAY");

	while {_running} do {
		{
			_warning_one = _x getVariable ["warning_one", false];
			_warning_two = _x getVariable ["warning_two", false];
			_warning_bandit = _x getVariable ["warning_bandit", false];
			if((isPlayer _x) && ((_x distance _position) <= 1200) && (_x getVariable ["humanity", 0] > player_bandit)) then {

				if (_x distance _position > ai_hero_engage_range) then {

					if (!_warning_one && (_x distance _position <= 150)) then {

						_msg = format ["Warning! This is a restricted area! Come closer and we will engage!"];
						[nil,_x,rTitleText,_msg,"PLAIN",10] call RE;
						_x setVariable ["warning_one", true];
					};

				} else {

					if (!_warning_two) then {
						_msg = format ["You were warned %1.", name _x];
						[nil,_x,rTitleText,_msg,"PLAIN",10] call RE;
						_x setVariable ["warning_two", true];
					};

				};
			};
		} forEach playableUnits;
	_running = (typeName (wai_mission_data select _mission) == "ARRAY");
	};
};

KK_fnc_inString = {

	private ["_needle","_haystack","_needleLen","_hay","_found"]; 

	_needle 	= [_this, 0, "", [""]] call BIS_fnc_param; 
	
	_haystack 	= toArray ([_this, 1, "", [""]] call BIS_fnc_param); 
	_needleLen 	= count toArray _needle;
	
	_hay 		= +_haystack; 
	_hay 		resize _needleLen;
	_found 		= false; 

	for "_i" from _needleLen to count _haystack do { 

		if (toString _hay == _needle) exitWith {_found = true};
		_hay set [_needleLen, _haystack select _i]; 
		_hay set [0, "x"]; _hay = _hay - ["x"]
	 }; 

	_found
};