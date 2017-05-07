/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_n1","_n2","_n3","_rHeli","_baserunover"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [30] call find_position;
	[_mission,_position,"Medium","Crack House","MainHero",true] call mission_init;	
	
	diag_log 		format["WAI: [Mission:[Hero] Crack House]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) + 2.3,(_position select 1) - 3,0.1],[],0,"CAN_COLLIDE"];

	// Create some Buildings
	//Buildings 
	_baserunover0 = createVehicle ["Land_dum_zboreny",[(_position select 0) - 0.01, (_position select 1) + 0.02,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover1 = createVehicle ["Land_Misc_Garb_Heap_EP1",[(_position select 0) + 5.6, (_position select 1) + 3.4,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover2 = createVehicle ["MAP_Kitchenstove_Elec",[(_position select 0) + 2, (_position select 1) + 5,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover3 = createVehicle ["MAP_P_toilet_b_02", [(_position select 0) - 4.4, (_position select 1) - 3.3,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover4 = createVehicle ["MAP_P_bath", [(_position select 0) - 4.9, (_position select 1) - 5,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover5 = createVehicle ["MAP_armchair", [(_position select 0) - 1.7, (_position select 1) - 4.6,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover6 = createVehicle ["MAP_SmallTable",[(_position select 0) + 2.6, (_position select 1) + 1.4,-0.15],[], 0, "CAN_COLLIDE"];
	_baserunover7 = createVehicle ["MAP_kitchen_chair_a",[(_position select 0) + 2.5, (_position select 1) + 2.2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover8 = createVehicle ["Land_Boots_EP1",[(_position select 0) + 8.4, (_position select 1) - 1.5,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover9 = createVehicle ["Land_Blankets_EP1", [(_position select 0) - 6.3, (_position select 1) + 4.8,+0.01],[], 0, "CAN_COLLIDE"];
	_baserunover10 = createVehicle ["Land_Bench_EP1", [(_position select 0) - 3.2, (_position select 1) - 2.2,+0.015],[], 0, "CAN_COLLIDE"];
	_baserunover11 = createVehicle ["Land_Water_pipe_EP1", [(_position select 0) - 1.4, (_position select 1) - 3,+0.01],[], 0, "CAN_COLLIDE"];
	_baserunover12 = createVehicle ["Land_Bag_EP1",[(_position select 0) - 5.9, (_position select 1) + 1.9,+0.01],[], 0, "CAN_COLLIDE"];
	_baserunover13 = createVehicle ["LADAWreck",[(_position select 0) - 8, (_position select 1) - 4,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover14 = createVehicle ["SKODAWreck",[(_position select 0) + 11, (_position select 1) - 3,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover15 = createVehicle ["MAP_tv_a", [(_position select 0) - 2.7, (_position select 1) - 0.1,+0.01],[], 0, "CAN_COLLIDE"];
	_baserunover16 = createVehicle ["MAP_Dkamna_uhli", [(_position select 0) - 0.01, (_position select 1) + 5,-0.1],[], 0, "CAN_COLLIDE"];
	_baserunover17 = createVehicle ["MAP_Skrin_opalena",[(_position select 0) + 1.2, (_position select 1) + 0.1,+0.05],[], 0, "CAN_COLLIDE"];
	_baserunover18 = createVehicle ["MAP_Dhangar_whiteskrin",[(_position select 0) + 0.9, (_position select 1) + 1.6,+0.05],[], 0, "CAN_COLLIDE"];
	_baserunover19 = createVehicle ["MAP_garbage_paleta",[(_position select 0) + 5.3, (_position select 1) - 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover20 = createVehicle ["MAP_t_salix2s", [(_position select 0) - 0.01, (_position select 1) + 15,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover21 = createVehicle ["MAP_t_salix2s", [(_position select 0) - 0.01, (_position select 1) - 17,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover22 = createVehicle ["MAP_t_salix2s", [(_position select 0) + 25, (_position select 1) - 0.01,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover23 = createVehicle ["MAP_t_salix2s", [(_position select 0) - 24, (_position select 1) - 0.01,-0.01],[], 0, "CAN_COLLIDE"];




	// Adding buildings to one variable just for tidiness
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8,_baserunover9,_baserunover10,_baserunover11,_baserunover12,_baserunover13,_baserunover14,_baserunover15,_baserunover16,_baserunover17,_baserunover18,_baserunover19,_baserunover20,_baserunover21,_baserunover22,_baserunover23];
	
	// Set some directions for our buildings
	_directions = [0,0,0,-90.84,0,179.92,0,0,-170.27,-170.27,0,105.15,0,-119.578,0,0,0,0,91.19,0,47.639,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;

	// Make buildings flat on terrain surface
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

	//Troops
	[[(_position select 0) - 12, (_position select 1) - 15,0],3,"Medium",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[(_position select 0) + 12, (_position select 1) + 15,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Medium","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Medium","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Medium","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Medium","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Medium","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Medium","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
		
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Bandits have set up a Crack House! Check your map for the location!",	// mission announcement
		"Survivors have secured the Crack House!",																	// mission success
		"Survivors did not secure the Crack House in time"															// mission fail
	] call mission_winorfail;

	diag_log format["WAI: [Mission:[Hero] Crack House]: Ended at %1",_position];

	if(_complete) then {
		[_crate,5,5,10,2] call dynamic_crate;
	};

	h_missionsrunning = h_missionsrunning - 1;
};