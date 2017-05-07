/*

	Bridges around Skal Island
	By: j0k3r5 / www.j0k3r5.com
	If modified and released give credits where due, thank you.
	
*/


//The script to build objects//
//Do not alter, unless you know what your doing//
// You need to have a FUNTIONS MODULE added to your mission file//


//START//

if (isNil "oneTime") then { 

oneTime = true; 


fnc_bridgeA2 = { 
	private ["_start","_obj"]; 
	_start = createVehicle [ 
			_this select 2, 
			_this select 0, 
			[], 
			0, "
			CAN_COLLIDE" 
	]; 
	_start setVectorUp [0,0,1]; 
	_start setDir (_this select 1); 
	_start setPosATL (_this select 0); 
	for "_i" from 1 to (_this select 3) do { 
	_obj = createVehicle [ 
			_this select 2, 
			_this select 0, 
			[], 
			0, 
			"CAN_COLLIDE" 
		]; 
		_obj attachTo [_start, [ 
			_i*(_this select 4), 
			_i*(_this select 5), 
			_i*(_this select 6) 
		]]; 
	}; 
};

//END//



//Placement of objects//
//[startingPosition, direction, objectClass, repeats, offsetX, offsetY, offsetZ]

[ [13640.5,3862.64,-1], 105, "Land_nav_pier_m_2", 11, 40, 0, 0 ] call fnc_bridgeA2;

[ [13556,3836,2.5], 192, "Land_Nav_Boathouse_PierT", 11, 3.5, 30.65, 0 ] call fnc_bridgeA2;

[ [13057.858,3764.8315,-3.7], 70, "Land_nav_pier_m_2", 11, 40, 0, 0 ] call fnc_bridgeA2;

[ [12402.359,3503.8438,-4.3], 180, "Land_Nav_Boathouse_PierT", 5, 3.5, 30.65, 0 ] call fnc_bridgeA2;

[ [12333.089,3254.707,-2], -127.72684, "Land_Nav_Boathouse_PierT", 3, 3.5, 30.65, 0 ] call fnc_bridgeA2;

[ [11946.711,3096.6877,-2], -69.292145, "Land_Nav_Boathouse_PierT", 5, 3.5, 30.65, 0 ] call fnc_bridgeA2;

[ [11497.502,3197.7043,-2], -24.819931, "Land_Nav_Boathouse_PierT", 4, 3.5, 30.65, 0 ] call fnc_bridgeA2;

};