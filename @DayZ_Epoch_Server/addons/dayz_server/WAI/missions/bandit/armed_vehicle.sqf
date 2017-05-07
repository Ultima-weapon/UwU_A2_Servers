/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private 		["_complete","_crate","_mission","_static_gun","_crate_type","_n1","_n2","_n3","_rV","_rHeli","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	//Armed Land Vehicle
	_vehclass 		= armed_vehicle call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

	_position		= [80] call find_position;
	[_mission,_position,"Medium",format["Disabled %1",_vehname],"MainBandit",true,true,600] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Armed Vehicle]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	
	//Troops
	_rndnum = (2 + round (random 2));
	[[_position select 0,_position select 1,0],_rndnum,"Medium",["Random","AT"],3,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_group;

	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Medium","Hero","Hero",false,_mission] spawn heli_para_veh;

	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Medium","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Medium","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	
	//Static Guns
	_static_gun = ai_static_weapons call BIS_fnc_selectRandom;
	[[
		[(_position select 0),(_position select 1) + 10, 0]
	],_static_gun,"Medium","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Spawn vehicles
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] armed_vehicle spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"Heroes have taken an armed vehicle from the bandits! Check your map for the location!",	// mission announcement
		"Bandits have secured the armed vehicle!",													// mission success
		"Bandits did not secure the armed vehicle in time"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,0,0,[25,crate_items_chainbullets],2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Armed Vehicle]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};