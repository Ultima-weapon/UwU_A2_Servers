/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private			["_complete","_baserunover","_crate_type","_crate","_n1","_n2","_n3","_rHeli","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Easy","Ural Attack","MainBandit",true,true,600] call mission_init;

	diag_log 		format["WAI: [Mission:[Bandit] Ural Attack]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0],[],10,"FORM"];

	//Base
	_baserunover 	= createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],14,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	_rndnum 	= 2 + round (random 2);
	_rndgro 	= 1 + round (random 2);

	[[_position select 0,_position select 1,0],_rndnum,"Easy",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	};
	
	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Easy","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
	_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Easy","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;

	//Condition
	_complete = [
		[_mission,_crate],		// mission number and crate
		["kill"], 				// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"Heroes are defending a broken down Ural! Check your map for the location!",	// mission announcement
		"The supplies have been secured by bandits!",									// mission success
		"Bandits failed to secure the supplies"											// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,4,8,36,2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Ural Attack]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};