/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	// Mission by Havoc302

    private ["_complete","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro","_crate_type","_n1","_n2","_n3","_rHeli","_baserunover"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position = [80] call find_position;
	[_mission,_position,"Easy","Bandit Patrol","MainHero",true,true,600] call mission_init;


	diag_log  format["WAI: [Mission:[Hero] Bandit Patrol]: Starting... %1",_position];


	//Setup the crate
	_crate_type  = crates_small call BIS_fnc_selectRandom;
	_crate  = createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];


	//Civil vehicle
	_vehclass  = civil_vehicles call BIS_fnc_selectRandom;

	//Troops
	_rndnum  = 2 + round (random 1);
	_rndgro  = 2 + round (random 1);


	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy",[2,"at"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};

	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Easy","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Easy","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	
	//Spawn vehicle
	_vehicle = [_vehclass,_position,_mission] call custom_publish;

	//Condition
	_complete = [
		[_mission,_crate], // mission number and crate
		["kill"],  // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle],  // cleanup objects
		"A bandit scout patrol is checking out a new base location, stop them before they get back and report!", // mission announcement
		"Survivors have dealt with the scout patrol!", // mission success
		"Survivors did not deal with the scout patrol in time! A bandit base might appear here soon!" // mission fail
	] call mission_winorfail;


	if(_complete) then {
		[_crate,4,8,36,2] call dynamic_crate;
	};


	diag_log format["WAI: [Mission:[Hero] Bandit Patrol]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};