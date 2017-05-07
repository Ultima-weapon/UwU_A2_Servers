if(isServer) then {
	private 		["_mission","_position","_baserunover","_crate_type","_crate","_unitGroup"];
	_mission 		= count cai_mission_data -1;
	_position		= [50] call civ_find_position;
	[_mission,_position,"SuperEasy","Neutral Trading Post","Special",false,true,150] call civ_mission_init;
	diag_log 		format["CAI: Neutral Trading Post started at %1",_position];
	_crate_type = civ_crates_small call BIS_fnc_selectRandom;
	_crate = createVehicle [_crate_type,[(_position select 0) - 0.9,(_position select 1) + 4.2,0],[],0,"CAN_COLLIDE"];
	
	// Create some Buildings
	//Buildings 
	_baserunover0 = createVehicle ["Land_Misc_Garb_Heap_EP1",[(_position select 0) - 0.9, (_position select 1) + 4.2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover1 = createVehicle ["Land_Misc_Garb_Heap_EP1",[(_position select 0) - 18, (_position select 1) + 1.5,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover2 = createVehicle ["Land_Shed_W03_EP1",[(_position select 0) - 4, (_position select 1) + 4.7,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover3 = createVehicle ["Land_Shed_M01_EP1", [(_position select 0) - 10, (_position select 1) + 5,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover4 = createVehicle ["Land_Market_shelter_EP1", [(_position select 0) - 10, (_position select 1) - 0.4,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover5 = createVehicle ["Land_Market_stalls_02_EP1", [(_position select 0) - 10, (_position select 1) - 5.8,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover6 = createVehicle ["Land_Market_stalls_01_EP1",[(_position select 0) + 11, (_position select 1) + 5,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover7 = createVehicle ["Land_Market_stalls_02_EP1",[(_position select 0) + 10, (_position select 1) - 5.8,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover8 = createVehicle ["Land_Market_shelter_EP1",[(_position select 0) + 10, (_position select 1) - 0.4,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover9 = createVehicle ["Land_transport_crates_EP1", [(_position select 0) + 22, (_position select 1) + 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover10 = createVehicle ["Fort_Crate_wood", [(_position select 0) + 18, (_position select 1) - 1,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover11 = createVehicle ["UralWreck", [(_position select 0) + 27, (_position select 1) - 3,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover12 = createVehicle ["Land_Canister_EP1",[(_position select 0) + 18, (_position select 1) + 1.4,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover13 = createVehicle ["MAP_ground_garbage_square5",[(_position select 0) + 13.6, (_position select 1) - 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover14 = createVehicle ["MAP_ground_garbage_square5",[(_position select 0) - 16, (_position select 1) - 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover15 = createVehicle ["MAP_ground_garbage_long", [(_position select 0) - 0.4, (_position select 1) - 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover16 = createVehicle ["MAP_garbage_misc", [(_position select 0) - 8, (_position select 1) - 2,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover17 = createVehicle ["HeliHEmpty", [(_position select 0) - 40, (_position select 1),-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover18 = createVehicle ["HeliHEmpty", [(_position select 0) + 40, (_position select 1),-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover19 = createVehicle ["HeliHEmpty", [(_position select 0) - 40, (_position select 1) + 40,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover20 = createVehicle ["HeliHEmpty", [(_position select 0) + 40, (_position select 1) - 40,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover21 = createVehicle ["HeliHEmpty", [(_position select 0), (_position select 1) - 40,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover22 = createVehicle ["HeliHEmpty", [(_position select 0), (_position select 1) + 40,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover23 = createVehicle ["HeliHEmpty", [(_position select 0) - 40, (_position select 1) - 40,-0.01],[], 0, "CAN_COLLIDE"];
	_baserunover24 = createVehicle ["HeliHEmpty", [(_position select 0) + 40, (_position select 1) + 40,-0.01],[], 0, "CAN_COLLIDE"];

	// Adding buildings to one variable just for tidiness
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8,_baserunover9,_baserunover10,_baserunover11,_baserunover12,_baserunover13,_baserunover14,_baserunover15,_baserunover16,_baserunover17,_baserunover18,_baserunover19,_baserunover20,_baserunover21,_baserunover22,_baserunover23,_baserunover24];
	
	// Set some directions for our buildings
	_directions = [0,0,0,0,0,-2.5,-0.34,0,2.32,-43.88,0,-67.9033,28.73,0,0,0,0,0,0,0,0,0,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;

	// Make buildings flat on terrain surface
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

	//Traders
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","CIV_EuroMan01_EP1","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","CIV_EuroMan02_EP1","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","TK_GUE_Soldier_5_EP1","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","RU_WorkWoman1","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","Doctor","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","Worker3","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],1,"Random","Unarmed",0,"None","GUE_Woodlander2","Random","Special",true,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],3,"Random","Unarmed",0,"None","Random","Random","Special",false,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],3,"Random","Unarmed",0,"None","Random","Random","Special",false,_mission] call civ_spawn_group;
	[[(_position select 0),(_position select 1),0],3,"Random","Unarmed",0,"None","Random","Random","Special",false,_mission] call civ_spawn_group;
	
	[
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover],		// cleanup objects
		"Neutral Traders have setup a trading post, check your map for the location.",						// mission announcement
		"All of the traders at the Neutral Trading Post have been slaughtered.",							// mission success
		"The Neutral Trading Post did not attract any customers, the traders have packed up their shops."	// mission fail
	] call civ_mission_winorfail;
	
	diag_log format["CAI: Neutral Trading Post ended at %1 ended",_position];

	civ_s_missionsrunning = civ_s_missionsrunning - 1;
};