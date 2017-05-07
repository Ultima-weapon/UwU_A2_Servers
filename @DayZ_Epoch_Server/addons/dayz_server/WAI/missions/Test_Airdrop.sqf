/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_crate_type","_num"];
	_position		= [80] call find_position;
	[_mission,_position,"Extreme","Test Mission","MainHero",true,true,900] call mission_init;
	diag_log 		format["WAI: Mission Test Mission started at %1",_position];

	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0)+2,(_position select 1)+4,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate2 		= createVehicle [_crate_type,[(_position select 0)+2,(_position select 1)-4,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate3 		= createVehicle [_crate_type,[(_position select 0)-2,(_position select 1)+4,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate4 		= createVehicle [_crate_type,[(_position select 0)-2,(_position select 1)-4,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate5 		= createVehicle [_crate_type,[(_position select 0)+4,(_position select 1)+2,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate6 		= createVehicle [_crate_type,[(_position select 0)+4,(_position select 1)-2,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate7 		= createVehicle [_crate_type,[(_position select 0)-4,(_position select 1)+2,0],[],0,"CAN_COLLIDE"];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate8 		= createVehicle [_crate_type,[(_position select 0)-4,(_position select 1)-2,0],[],0,"CAN_COLLIDE"];

	// Humvee Patrol Example
	// Parameters:	0: Patrol position
	//				1: Starting position
	//				2: Patrol radius
	//				3: Number of Waypoints
	//				4: Vehicle classname
	//				5: Unit Skill ("easy","medium","hard","extreme" or "random")
	//				6: Skin ("Hero","bandit","random","special" or "classname")
	//				7: AI Type ("bandit","Hero" or "special") ***Used to determine humanity gain or loss***
	//				8: Mission variable from line 9 (_mission)
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","random","bandit","bandit",_mission] call vehicle_patrol;

	// Heli Paradrop Example
	// Parameters:	0: Paradrop position
	//				1: Spawn position
	//				2: Trigger radius
	//				3: Vehicle classname
	//				4: Amount of paratroopers
	//				5: Unit Skill ("easy","medium","hard","extreme" or "random") ***NO effect if ai_static_skills = true;***
	//				6: Gun (0:ai_wep_assault 1:ai_wep_machine 2:ai_wep_sniper or "random")
	//				7: Magazine Count
	//				8: Backpack ("random" or "classname")
	//				9: Skin ("Hero","bandit","random","special" or "classname")
	//				10: Gear (0:ai_gear0, 1:ai_gear1, 2:ai_gear2, 3:ai_gear3, 4:ai_gear4 or "random")
	//				11: AI Type ("bandit","Hero" or "special") ***Used to determine humanity gain or loss***
	//				12: Heli stay and fight after troop deployment? (true or false)
	//				13: Mission variable from line 9 (_mission)
	[[(_position select 0), (_position select 1), 0],[0,0,0],400,"UH1H_DZ",10,"random","random",4,"random","bandit","random","bandit",true,_mission] spawn heli_para;

	// Mission objective options and messages
	[
		[_mission,_crate],	// mission variable (from line 9) and crate
		["crate"], 			// Mission objective type (["crate"], or ["kill"], or ["assassinate", _assassinate])
		[_baserunover], 	// buildings to cleanup after mission is complete, does not include the crate
		"A Mission has spawned, hurry up to claim the loot!",	// mission announcement
		"The mission was complete/objective reached",			// mission success
		"The mission timed out and nobody was in the vicinity"	// mission fail
	] call mission_winorfail;

	// End of mission
	diag_log format["WAI: Mission bandit base ended at %1 ended",_position];

	h_missionsrunning = h_missionsrunning - 1;
};