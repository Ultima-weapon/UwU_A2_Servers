/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_n1","_n2","_n3","_rHeli","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8","_baserunover9","_baserunover10","_baserunover11","_baserunover12","_baserunover13","_baserunover14"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Hard","The Farm","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] The Farm]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) + 0.02,(_position select 1),0.1], [], 0, "CAN_COLLIDE"];

	//The Farm
	//Buildings 
	_baserunover0 = createVehicle ["MAP_sara_stodola",[(_position select 0) + 4, (_position select 1) - 5,-0.12],[], 0, "CAN_COLLIDE"];
	_baserunover1 = createVehicle ["MAP_HouseV_2T2",[(_position select 0) + 18, (_position select 1) - 11,-0.14],[], 0, "CAN_COLLIDE"];
	_baserunover2 = createVehicle ["MAP_t_quercus3s",[(_position select 0) + 32.4, (_position select 1) - 32,-0.14],[], 0, "CAN_COLLIDE"];
	_baserunover3 = createVehicle ["MAP_t_quercus2f", [(_position select 0) + 14, (_position select 1) - 3,-0.14],[], 0, "CAN_COLLIDE"];
	_baserunover4 = createVehicle ["MAP_t_pinusN2s", [(_position select 0) - 12, (_position select 1) + 5,-0.14],[], 0, "CAN_COLLIDE"];
	_baserunover5 = createVehicle ["datsun01Wreck", [(_position select 0) - 10, (_position select 1) - 1,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover6 = createVehicle ["Haystack",[(_position select 0) - 1, (_position select 1) - 32,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover7 = createVehicle ["Haystack_small",[(_position select 0) - 25, (_position select 1) - 36,-0.16],[], 0, "CAN_COLLIDE"];
	_baserunover8 = createVehicle ["Haystack_small",[(_position select 0) + 33, (_position select 1) - 43,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover9 = createVehicle ["Haystack_small", [(_position select 0) + 10, (_position select 1) - 49,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover10 = createVehicle ["Haystack_small", [(_position select 0) + 13, (_position select 1) + 60,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover11 = createVehicle ["Haystack_small", [(_position select 0) - 33, (_position select 1) - 51,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover12 = createVehicle ["Haystack_small",[(_position select 0) + 20, (_position select 1) - 67,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover13 = createVehicle ["Land_Shed_wooden",[(_position select 0) + 10, (_position select 1) - 24,-0.02],[], 0, "CAN_COLLIDE"];
	_baserunover14 = createVehicle ["fiberplant",[(_position select 0) + 12, (_position select 1) - 23,-0.02],[], 0, "CAN_COLLIDE"];

	_baserunover 	= [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8,_baserunover9,_baserunover10,_baserunover11,_baserunover12,_baserunover13,_baserunover14];
	
	_directions = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position  _x; } count _baserunover;

	//Troops
	[[(_position select 0) - 1, (_position select 1) - 10, 0],3,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[(_position select 0) - 2, (_position select 1) - 50, 0],3,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[(_position select 0) - 1, (_position select 1) + 11, 0],3,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	
	//Humvee Patrol
	// [[(_position select 0) - 27, (_position select 1) - 18, 0],[(_position select 0) + 32, (_position select 1) + 1, 0],50,2,"Offroad_DSHKM_Gue_DZ","Hard","Hero","Hero",_mission] call vehicle_patrol;
	[[(_position select 0) - 27, (_position select 1) - 18, 0],[(_position select 0)-3000,(_position select 0)-3000,1000],600,"MV22","Offroad_DSHKM_Gue_DZ",2,50,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	
	//Static Guns
	[[[(_position select 0) - 12, (_position select 1) - 18, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	
	//Condition
	_complete = [
		[_mission,_crate],				// mission number and crate
		["crate"],						// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 				// cleanup objects
		"Old MacDonald has a weed farm...check your map",	// mission announcement
		"Survivors have secured The Farm",								// mission success
		"Survivors were unable to clear the The Farm....mission failed"							// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,9,5,[15,crate_items_crop_raider],2] call dynamic_crate;
			};

	diag_log format["WAI: [Mission:[Bandit] The Farm]: Ended at %1",_position];

	b_missionsrunning = b_missionsrunning - 1;
};