/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private			["_complete","_dir","_rndnum","_crate_type","_n1","_n2","_n3","_rV","_rHeli","_mission","_position","_vehclass3","_vehclass2","_vehicle3","_vehicle2","_playerPresent","_vehicle","_vehclass","_crate"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Lunch break Convoy","MainBandit",true,true,600] call mission_init;

	diag_log 		format["WAI: [Mission:[Bandit] Lunch break Convoy]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Troops
	_rndnum = 2 + round (random 1);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
	[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)+_n2+2500, 1000],100,"C130J","BMP2_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;

	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	
	//Static Guns
	[[
		[(_position select 0) + 25, (_position select 1) + 25, 0],
		[(_position select 0) - 25, (_position select 1) - 25, 0],
		[(_position select 0) + 25, (_position select 1) - 25, 0]
	],"M2StaticMG","Hard","Hero","Hero",1,2,"Random","Random",_mission] call spawn_static;

	//Heli Para Drop
	[[(_position select 0),(_position select 1),0],[(_position select 0)-3000,(_position select 1)-3000,0],400,"BAF_Merlin_HC3_D",10,"Random","Random",4,"Random","Hero","Random","Hero",false,_mission] spawn heli_para;

	// Spawn Vehicles
	_dir 			= floor(round(random 360));

	_vehclass 		= cargo_trucks 		call BIS_fnc_selectRandom;		// Cargo Truck
	_vehclass2 		= refuel_trucks 	call BIS_fnc_selectRandom;		// Refuel Truck
	_vehclass3 		= military_unarmed 	call BIS_fnc_selectRandom;		// Military Unarmed

	_vehicle		= [_vehclass,_position,_mission,false,_dir] call custom_publish;
	_vehicle2		= [_vehclass2,_position,_mission,false,_dir] call custom_publish;
	_vehicle3		= [_vehclass3,_position,_mission,false,_dir] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass];
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass3];
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass2];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],				// mission number and crate
		["crate"], 						// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle,_vehicle2,_vehicle3],	// cleanup objects
		"A heavily guarded Ikea convoy is taking a lunch break, heroes are securing the parameter. See if you can make the building supplies yours.",	// mission announcement
		"Bandits have successfully ambushed the Ikea convoy and secured the building supplies!",			// mission success
		"Bandits were unable to surprise the heroes on their lunchbreak"									// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[1,crate_weapons_buildables],[4,crate_tools_buildable],[30,crate_items_buildables],4] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Lunch break Convoy]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};