if(isServer) then {
	
	private ["_mines","_difficulty","_mission","_type","_color","_dot","_position","_marker","_name","_show_marker","_rad"];

	_mission	= _this select 0;
	_position 	= _this select 1;
	_difficulty = _this select 2;
	_name		= _this select 3;
	_type		= _this select 4;
	_mines		= _this select 5;
	if(count _this > 6) then {
		_show_marker = _this select 6;
	} else {
		_show_marker = true;
	};
	if(count _this > 7) then {
		_rad = _this select 7;
	} else {
		_rad = 300;
	};
	
	if(debug_mode) then { diag_log("CAI: Starting Mission number " + str(_mission)); };
	cai_mission_data select _mission set [1, _type];
	cai_mission_data select _mission set [3, _position];
	
	if(cai_enable_minefield && _mines) then {
		call {
			if(_difficulty == "supereasy") 	exitWith {_mines = [_position,10,25,10] call civ_minefield;};
			if(_difficulty == "easy") 		exitWith {_mines = [_position,20,37,20] call civ_minefield;};
			if(_difficulty == "medium") 	exitWith {_mines = [_position,35,52,50] call civ_minefield;};
			if(_difficulty == "hard") 		exitWith {_mines = [_position,50,75,100] call civ_minefield;};
			if(_difficulty == "extreme") 	exitWith {_mines = [_position,60,90,150] call civ_minefield;};
		};
		cai_mission_data select _mission set [2, _mines];
	};
	
	_marker 	= "";
	_dot 		= "";
	_color		= "";
	
	call {
		if(_difficulty == "supereasy")	exitWith {_color = "ColorPink"};
		if(_difficulty == "easy")		exitWith {_color = "ColorPink"};
		if(_difficulty == "medium")		exitWith {_color = "ColorPink"};
		if(_difficulty == "hard")		exitWith {_color = "ColorPink"};
		if(_difficulty == "extreme") 	exitWith {_color = "ColorPink"};
		_color = _difficulty;
	};
	
	call {
		if(_type == "mainhero")		exitWith { _name = _name; };
		if(_type == "mainbandit")	exitWith { _name = _name; };
		if(_type == "special")		exitWith { _name = _name; };
	};
	
	if(_show_marker) then {

		[_position, _color, _name, _mission, _rad] spawn {

			private["_position","_color","_name","_running","_mission","_type","_marker","_dot","_rad"];

			_position	= _this select 0;
			_color 		= _this select 1;
			_name 		= _this select 2;
			_mission 	= _this select 3;
			_running 	= true;
			_rad		= _this select 4;
			
			while {_running} do {

				_type	= (cai_mission_data select _mission) select 1;
				
				_marker 		= createMarker [_type + str(_mission), _position];
				_marker 		setMarkerColor _color;
				_marker 		setMarkerShape "ELLIPSE";
				_marker 		setMarkerBrush "Solid";
				_marker 		setMarkerSize [_rad,_rad];
				_marker 		setMarkerText _name;

				_dot 			= createMarker [_type + str(_mission) + "dot", _position];
				_dot 			setMarkerColor "ColorBlack";
				_dot 			setMarkerType "mil_dot";
				_dot 			setMarkerText _name;

				sleep 1;

				deleteMarker 	_marker;
				deleteMarker 	_dot;

				_running = (typeName (cai_mission_data select _mission) == "ARRAY");

			};
		};
	
	};

	if(debug_mode) then { diag_log("CAI: Mission Data: " + str(cai_mission_data)); };
	
};