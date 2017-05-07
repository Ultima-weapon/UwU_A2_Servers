/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private 		["_baserunover","_mission","_directions","_position","_crate","_crate_type","_n1","_n2","_n3","_rV","_rHeli","_num"];

	_mission 		= count wai_mission_data -1;
	// Get a safe position 80 meters from the nearest object
	_position		= [80] call find_position;
	
	// Initialise the mission variable with the following options, [position, difficulty, mission name, mission type (MainHero/Mainbandit), minefield (true or false)] call mission_init;
	[_mission,_position,"hard","Lumber Mill","MainBandit",true] call mission_init;

	diag_log 		format["WAI: Mission:[Bandit] Lumber Mill started at %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectrandom; // Choose between crates_large, crates_medium and crates_small
	_crate 			= createVehicle [_crate_type,[(_position select 0) + 5,(_position select 1) + 7,0],[],0,"CAN_COLLIDE"];

	// Create some Buildings
	//Buildings 
	_baserunover0 = createVehicle ["Land_Ind_SawMill",[(_position select 0) - 2.4, (_position select 1) + 24,-0.15],[], 0, "CAN_COLLIDE"];
	_baserunover1 = createVehicle ["Land_Ind_Timbers",[(_position select 0) + 11, (_position select 1) + 8.6,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover2 = createVehicle ["Land_Ind_Timbers",[(_position select 0) + 16, (_position select 1) + 12,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover3 = createVehicle ["Land_Ind_Timbers", [(_position select 0) + 6, (_position select 1) - 15,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover4 = createVehicle ["Misc_palletsfoiled", [(_position select 0) + 5, (_position select 1) - 9,-0.009],[], 0, "CAN_COLLIDE"];
	_baserunover5 = createVehicle ["Misc_palletsfoiled_heap", [(_position select 0) + 9, (_position select 1) - 8,-0.05],[], 0, "CAN_COLLIDE"];
	_baserunover6 = createVehicle ["Land_water_tank",[(_position select 0) - 10, (_position select 1) - 7,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover7 = createVehicle ["UralWreck",[(_position select 0) - 17, (_position select 1) + 5,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover8 = createVehicle ["MAP_t_quercus3s",[(_position select 0) + 22, (_position select 1) + 25,-0.2],[], 0, "CAN_COLLIDE"];


	// Adding buildings to one variable just for tidiness
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8];
	
	// Set some directions for our buildings
	_directions = [0,0,-10.45,104.95,0,0,0,59.2,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;

	// Make buildings flat on terrain surface
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

	_num = round (random 1) + 2;
	[[(_position select 0) + 12, (_position select 1) + 22.5, 0],_num,"extreme",["random","at"],4,"random","Hero","random",["Hero",150],_mission] call spawn_group;
	[[(_position select 0) + 21, (_position select 1) + 11, 0],2,"hard","random",4,"random","Hero","random","Hero",_mission] call spawn_group;
	[[(_position select 0) - 1.12, (_position select 1) - 0.43, 0],2,"random","random",4,"random","Hero","random","Hero",_mission] call spawn_group;
	[[(_position select 0) - 13, (_position select 1) - 23, 0],2,"random","random",4,"random","Hero","random","Hero",_mission] call spawn_group;

	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	
	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission variable (from line 9) and crate
		["crate"], 			// Mission objective type (["crate"], or ["kill"], or ["assassinate", _assassinate])
		[_baserunover], 	// buildings to cleanup after mission is complete, does not include the crate
		"Heroes are setting up a lumber mill...Check your map",	// mission announcement
		"Survivors secured the lumber",			// mission success
		"Survivors did not secure the lumber in time"	// mission fail
	] call mission_winorfail;


	 
	if(_complete) then {
		[_crate,6,[8,crate_tools_sniper],[10,crate_items_buildables],[4,crate_backpacks_large]] call dynamic_crate;
	};	
	
	// End of mission
	diag_log format["WAI: Mission:[Bandit] Lumber Mill ended at %1 ended",_position];
	b_missionsrunning = b_missionsrunning - 1;
};