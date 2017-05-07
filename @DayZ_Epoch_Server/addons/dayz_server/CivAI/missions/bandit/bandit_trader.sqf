if(isServer) then {
	private 		["_mission","_position","_baserunover","_crate_type","_crate","_rnd"];
	_mission 		= count cai_mission_data -1;
	_position		= [50] call civ_find_position;
	[_mission,_position,"SuperEasy","Bandit Trading Post","MainBandit",false,true,150] call civ_mission_init;
	diag_log 		format["CAI: Bandit Trading Post started at %1",_position];
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
	_rnd = round(random(100)); if(_rnd < 10) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Warlord_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};			// Bandit (Rank 10)
	_rnd = round(random(100)); if(_rnd < 20) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Bonesetter_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 9)
	_rnd = round(random(100)); if(_rnd < 30) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_Sniper_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};	// Bandit (Rank 8)
	_rnd = round(random(100)); if(_rnd < 40) then {[[(_position select 0),(_position select 1),0],1,"extreme","Unarmed",0,"None","TK_GUE_Soldier_TL_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 7)
	_rnd = round(random(100)); if(_rnd < 50) then {[[(_position select 0),(_position select 1),0],1,"extreme","Unarmed",0,"None","TK_GUE_Soldier_AA_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 6)
	_rnd = round(random(100)); if(_rnd < 60) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_AT_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 5)
	_rnd = round(random(100)); if(_rnd < 70) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_HAT_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 4)
	_rnd = round(random(100)); if(_rnd < 80) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_AR_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 3)
	_rnd = round(random(100)); if(_rnd < 90) then {[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_AAT_EP1","Random","Bandit",true,_mission] call civ_spawn_group;};		// Bandit (Rank 2)
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_GUE_Soldier_MG_EP1","Random","Bandit",true,_mission] call civ_spawn_group;							// Bandit (Rank 1)
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_CIV_Takistani06_EP1","Random","Bandit",true,_mission] call civ_spawn_group;						// Ammo
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_CIV_Takistani04_EP1","Random","Bandit",true,_mission] call civ_spawn_group;						// Weapons
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_CIV_Takistani05_EP1","Random","Bandit",true,_mission] call civ_spawn_group;						// Vehicles
	[[(_position select 0),(_position select 1),0],1,"extreme","Unarmed",0,"None","TK_CIV_Woman03_EP1","Random","Bandit",true,_mission] call civ_spawn_group;							// General Store
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_CIV_Worker01_EP1","Random","Bandit",true,_mission] call civ_spawn_group;							// Building/Parts
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","US_Delta_Force_Undercover_Takistani06_EP1","Random","Bandit",true,_mission] call civ_spawn_group;		// Aircraft
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","TK_CIV_Worker02_EP1","Random","Bandit",true,_mission] call civ_spawn_group;							// Wholesaler
	[[(_position select 0),(_position select 1),0],1,"extreme","Random",1,"None","Dr_Hladik_EP1","Random","Bandit",true,_mission] call civ_spawn_group;									// Medical
	[[(_position select 0),(_position select 1),0],1,"extreme","Unarmed",0,"None","TK_CIV_Woman02_EP1","Random","Bandit",true,_mission] call civ_spawn_group;							// Boats
	[[(_position select 0),(_position select 1),0],3,"extreme","Unarmed",0,"None","Bandit","Random","Bandit",false,_mission] call civ_spawn_group;										// Random
	[[(_position select 0),(_position select 1),0],3,"extreme","Unarmed",0,"None","Bandit","Random","Bandit",false,_mission] call civ_spawn_group;										// Random
	
	[
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover],		// cleanup objects
		"Bandit Traders have setup a trading post, check your map for the location.",						// mission announcement
		"All of the traders at the Bandit Trading Post have been slaughtered.",							// mission success
		"The Bandit Trading Post did not attract any customers, the traders have packed up their shops."	// mission fail
	] call civ_mission_winorfail;
	
	diag_log format["CAI: Bandit Trading Post ended at %1 ended",_position];

	civ_b_missionsrunning = civ_b_missionsrunning - 1;
};