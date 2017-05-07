if (isServer) then {

	private ["_wp","_skill","_mission","_wp_rad","_wp","_pos_x","_pos_y","_pos_z","_unitGroup","_position"];

	_unitGroup 		= _this select 0;
	_position 		= _this select 1;
	_pos_x 			= _position select 0;
	_pos_y 			= _position select 1;
	_pos_z 			= _position select 2;
	_wp_rad 		= 5;

	if(count _this > 2) then {

		_skill = _this select 2;
	
		call {
			if(_skill == "supereasy") 	exitWith { _wp_rad = 1; };
			if(_skill == "easy") 	exitWith { _wp_rad = 2; };
			if(_skill == "medium") 	exitWith { _wp_rad = 3; };
			if(_skill == "hard") 	exitWith { _wp_rad = 4; };
			if(_skill == "extreme") exitWith { _wp_rad = 5; };
			if(_skill == "random") 	exitWith { _wp_rad = random(5); };
		};

	};

	{
		_wp = _unitGroup addWaypoint [_x,5];
		_wp setWaypointType "HOLD";
		_wp setWaypointSpeed "LIMITED";

	} count [[_pos_x,(_pos_y+_wp_rad),0],[(_pos_x+_wp_rad),_pos_y,0],[_pos_x,(_pos_y-_wp_rad),0],[(_pos_x-_wp_rad),_pos_y,0]];

	_wp = _unitGroup addWaypoint [[_pos_x,_pos_y,0],_wp_rad];
	_wp setWaypointType "GUARD";
	_wp setWaypointSpeed "LIMITED"

};