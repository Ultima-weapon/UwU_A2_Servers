/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	 
	private 		["_complete","_dir","_num","_num2","_crate_type","_mission","_position","_vehclass2","_vehclass3","_vehclass4","_vehicle2","_vehicle3","_vehicle4","_playerPresent","_vehicle","_vehclass","_crate","_crate2","_crate3","_crate4","_crate5","_crate6","_crate7","_crate8","_rndChopper"];
	
	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	_position		= [80] call find_position;
	[_mission,_position,"Extreme","Death Match","MainHero",true,true,900] call mission_init;
	
	diag_log 		format["WAI: Mission Death Match started at %1",_position];
	
	//Setup the crate
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
	
	// Group Spawn Examples
	// Parameters:	0: Position
	//				1: Unit Count
	//				2: Unit Skill ("supereasy","easy","medium","hard","extreme" or "random")
	//				3: Guns (gun or [gun,launcher])
	//					Guns options	: (0 = ai_wep_assault, 1 = ai_wep_machine, 2 = ai_wep_sniper, "random" = random weapon, "Unarmed" = no weapon)
	//					Launcher options: (at = ai_wep_launchers_AT, aa = ai_wep_launchers_AA or "classname")
	//				4: Magazine Count
	//				5: Backpack ("random" or "classname")
	//				6: Skin ("Hero","bandit","random","special" or "classname")
	//				7: Gear (0:ai_gear0, 1:ai_gear1, 2:ai_gear2, 3:ai_gear3, 4:ai_gear4 or "random")
	//				8: AI Type ("bandit","Hero","special" or ["type", #] format to overwrite default gain amount) ***Used to determine humanity gain or loss***
	//				9: Mission variable from line 9 (_mission)
	_num = 2 + round (random 3); 
	_num2 = 5 + round (random 25);
	[[(_position select 0)-_num2,(_position select 1)-_num2,0],_num,"random","Random",7,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	
	_num = 2 + round (random 3); 
	_num2 = 5 + round (random 25);
	[[(_position select 0)+_num2,(_position select 1)+_num2,0],_num,"random","Random",7,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	
	_num = 2 + round (random 1); 
	_num2 = 5 + round (random 25);
	[[(_position select 0)+_num2,(_position select 1)-_num2,0],_num,"random",["Random","AA"],7,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	_num = 2 + round (random 1); 
	_num2 = 5 + round (random 25);
	[[(_position select 0)+_num2,(_position select 1)-_num2,0],_num,"random",["Random","AT"],7,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	
	// Aircraft Paradrop AI Vehicle Example
	// Parameters:	0: Paradrop position
	//				1: Spawn position
	//				2: Trigger radius
	//				3: Aircraft classname
	//				4: Vehicle classname
	//				5: Number of Vehicle Waypoints
	//				6: Vehicle Patrol Radius
	//				7: Unit Skill ("easy","medium","hard","extreme" or "random") ***NO effect if ai_static_skills = true;***
	//				8: Skin ("Hero","bandit","random","special" or "classname")
	//				9: AI Type ("bandit","Hero" or "special") ***Used to determine humanity gain or loss***
	//				10: Heli stay and fight after troop deployment? (true or false)
	//				11: Mission variable from line 9 (_mission)
	_num = 50 + round (random 50); 
	_num2 = 50 + round (random 50);
	[[(_position select 0)+_num, (_position select 1)+_num2, 0],[(_position select 0)-3000,(_position select 1)-3000,1000],600,"MV22","HMMWV_Avenger_DES_EP1",2,100,"random","random","Bandit",false,_mission] spawn heli_para_veh;
	_num = 50 + round (random 50); 
	_num2 = 50 + round (random 50);
	[[(_position select 0)+_num, (_position select 1)+_num2, 0],[(_position select 0)-3000,(_position select 1)+3000,1000],500,"MV22","HMMWV_TOW_DES_EP1",2,100,"random","random","Bandit",false,_mission] spawn heli_para_veh;
	_num = 50 + round (random 50); 
	_num2 = 50 + round (random 50);
	[[(_position select 0)+_num, (_position select 1)+_num2, 0],[(_position select 0)+3000,(_position select 1)-3000,1000],400,"MV22","HMMWV_M1151_M2_DES_EP1",2,100,"random","random","Bandit",false,_mission] spawn heli_para_veh;
	_num = 50 + round (random 50); 
	_num2 = 50 + round (random 50);
	[[(_position select 0)+_num, (_position select 1)+_num2, 0],[(_position select 0)+3000,(_position select 1)+3000,1000],300,"MV22","HMMWV_M1151_M2_DES_EP1",2,100,"random","random","Bandit",false,_mission] spawn heli_para_veh;

	// Static Turret Examples
	// Parameters:	0: Spawn position
	//				1: Classname ("classname" or "random" to pick from ai_static_weapons)
	//				2: Unit Skill ("supereasy","easy","medium","hard","extreme" or "random") ***NO effect if ai_static_skills = true;***
	//				3: Skin ("Hero","bandit","random","special" or "classname")
	//				4: AI Type ("bandit","Hero" or "special") ***Used to determine humanity gain or loss***
	//				5: Gun (0:ai_wep_assault 1:ai_wep_machine 2:ai_wep_sniper or "random") ***NO effect if ai_static_useweapon = false;***
	//				6: Magazine Count ***NO effect if ai_static_useweapon = false;***
	//				7: Backpack ("random" or "classname") ***NO effect if ai_static_useweapon = false;***
	//				8: Gear (0:ai_gear0, 1:ai_gear1, 2:ai_gear2, 3:ai_gear3, 4:ai_gear4 or "random") ***NO effect if ai_static_useweapon = false;***
	//				9: Mission variable from line 9 (_mission)

	_num = 30 + round (random 10); 
	_num2 = 30 + round (random 10);
	[[[(_position select 0) - _num, (_position select 1) + _num2, 0]],"random","random","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_num = 30 + round (random 10); 
	_num2 = 30 + round (random 10);
	[[[(_position select 0) + _num, (_position select 1) - _num2, 0]],"random","random","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_num = 30 + round (random 10); 
	_num2 = 30 + round (random 10);
	[[[(_position select 0) + _num, (_position select 1) + _num2, 0]],"random","random","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_num = 30 + round (random 10); 
	_num2 = 30 + round (random 10);
	[[[(_position select 0) - _num, (_position select 1) - _num2, 0]],"random","random","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	
	// Heli Paradrop Example
	// Parameters:	0: Paradrop position
	//				1: Spawn position
	//				2: Trigger radius
	//				3: Vehicle classname
	//				4: Amount of paratroopers
	//				5: Unit Skill ("supereasy","easy","medium","hard","extreme" or "random") ***NO effect if ai_static_skills = true;***
	//				6: Gun (0:ai_wep_assault 1:ai_wep_machine 2:ai_wep_sniper or "random")
	//				7: Magazine Count
	//				8: Backpack ("random" or "classname")
	//				9: Skin ("Hero","bandit","random","special" or "classname")
	//				10: Gear (0:ai_gear0, 1:ai_gear1, 2:ai_gear2, 3:ai_gear3, 4:ai_gear4 or "random")
	//				11: AI Type ("bandit","Hero" or "special") ***Used to determine humanity gain or loss***
	//				12: Heli stay and fight after troop deployment? (true or false)
	//				13: Mission variable from line 9 (_mission)
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)-3000,(_position select 1)-3000,0],600,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)+3000,(_position select 1)+3000,0],600,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)+3000,(_position select 1)-3000,0],500,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)-3000,(_position select 1)+3000,0],500,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)-3000,(_position select 1)-3000,0],400,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)+3000,(_position select 1)+3000,0],400,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)-3000,(_position select 1)+3000,0],300,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rndChopper = air_attack_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0), (_position select 1), 0],[(_position select 0)+3000,(_position select 1)-3000,0],300,_rndChopper,0,"random","random",1,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;

	// Spawn Vehicles
	_vehclass 		= track_vehicle call BIS_fnc_selectRandom;
	_vehclass2 		= track_vehicle call BIS_fnc_selectRandom;
	_vehclass3 		= track_vehicle call BIS_fnc_selectRandom;
	_vehclass4 		= track_vehicle call BIS_fnc_selectRandom;
	_dir = floor(round(random 360));
	_vehicle = [_vehclass,[(_position select 0)-45, (_position select 1), 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360));
	_vehicle2 = [_vehclass2,[(_position select 0)+45, (_position select 1), 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360));
	_vehicle3 = [_vehclass3,[(_position select 0), (_position select 1)-45, 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360));
	_vehicle4 = [_vehclass4,[(_position select 0), (_position select 1)+45, 0],_mission,false,_dir] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Hero] death_match spawned a %1",_vehclass];
		diag_log format["WAI: [Hero] death_match spawned a %1",_vehclass2];
		diag_log format["WAI: [Hero] death_match spawned a %1",_vehclass3];
		diag_log format["WAI: [Hero] death_match spawned a %1",_vehclass4];
	};
	
	//Condition
	_complete = [
		[_mission,[_crate,_crate2,_crate3,_crate4,_crate5,_crate6,_crate7,_crate8]],			// mission number and crate
		["crate"], 											// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle,_vehicle2,_vehicle3,_vehicle4],			// cleanup objects
		"WAR IS UPON US!!! Who will be left standing?",		// mission announcement
		"Survivors have won this battle!!!",				// mission success
		"The war has ended in a cease fire.... for now."	// mission fail
	] call mission_winorfail;
	
	// Crate Spawn Example
	// Parameters:	0: _crate
	//				1: Max number of guns OR [MAX number of guns,gun_array]
	//				2: Max number of tools OR [MAX number of tools,tool_array]
	//				3: Max number of items OR [MAX number of items,item_array]
	//				4: Max number of backpacks OR [MAX number of backpacks,backpack_array]
	if (_complete) then {
		[_crate,[5,ai_wep_assault],[2,crate_tools],15,1] call dynamic_crate;
		[_crate2,[5,ai_wep_machine],[2,crate_tools],[2,crate_items_chainbullets],1] call dynamic_crate;
		[_crate3,[5,ai_wep_sniper],[2,crate_tools_sniper],[2,crate_items_sniper],1] call dynamic_crate;
		[_crate4,[1,ai_wep_launchers_AT],[2,crate_tools],15,1] call dynamic_crate;
		[_crate5,[1,ai_wep_launchers_AA],[2,crate_tools],15,1] call dynamic_crate;
		[_crate6,[2,crate_weapons_buildables],[4,crate_tools_buildable],[25,crate_items_buildables],1] call dynamic_crate;
		[_crate7,0,[5,crate_tools],[25,crate_items],1] call dynamic_crate;
		[_crate8,0,[5,crate_tools],[25,crate_items_food],1] call dynamic_crate;
	};
	
	// End of mission
	diag_log format["WAI: Mission Death Match ended at %1 ended",_position];

	h_missionsrunning = h_missionsrunning - 1;
};