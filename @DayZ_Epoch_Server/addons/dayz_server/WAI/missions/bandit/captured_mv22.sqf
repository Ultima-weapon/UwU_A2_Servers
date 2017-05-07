/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private			["_complete","_crate_type","_mission","_vehname","_vehicle","_position","_vehclass","_crate","_n1","_n2","_rV","_baserunover","_rndnum"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Captured MV22","MainBandit",true,true,600] call mission_init;

	diag_log 		format["WAI: [Mission:[Bandit] Captured MV22]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Medical Tent
	_baserunover 	= createVehicle ["USMC_WarfareBFieldhHospital",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	_rndnum = 2 + round (random 1);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Doctor","Random","Hero",_mission] call spawn_group;
	 
	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)+_n2+2500, 1000],100,"C130J","BMP2_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)-_n1-2500, (_position select 1)-_n2-2500, 1000],100,"C130J","BRDM2_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)-_n2-2500, 1000],100,"C130J","T72_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		
	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	
	//Spawn vehicles
	_vehclass 		= "MV22_DZ";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] captured_mv22 spawned a MV22 at %1", _position];
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle], 		// cleanup objects
		"A group of red cross volunteers are giving away medical supplies, they are heavily guarded by trained soldiers",		// mission announcement
		"Bandits have murdered the volunteers, shame on them!",					// mission success
		"The medical supplies have been given away"								// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,0,0,[80,crate_items_medical],0] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Captured MV22]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};