/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {


private  ["_complete","_mission","_position","_crate","_num","_crate_type","_n1","_n2","_n3","_rV","_rHeli","_baserunover","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8","_baserunover9","_baserunover10","_baserunover11","_baserunover12","_baserunover13","_baserunover14","_baserunover15","_baserunover16","_baserunover17","_baserunover18","_baserunover19","_baserunover20","_baserunover21","_baserunover22","_baserunover23","_baserunover24"];


// Get mission number, important we do this early
_mission  = count wai_mission_data -1;


_position = [80] call find_position;
[_mission,_position,"Hard","Drone Pilot","MainBandit",true] call mission_init;


diag_log  format["WAI: [Mission:[Bandit] Drone Pilot]: Starting... %1",_position];


//Setup the crate
_crate_type  = crates_large call BIS_fnc_selectRandom;
_crate  = createVehicle [_crate_type,[(_position select 0) + 2,(_position select 1),0],[],0,"CAN_COLLIDE"];


//Buildings
_baserunover0 = createVehicle ["RU_WarfareBUAVterminal",[(_position select 0) - 6, (_position select 1) - 15,-0.1],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["Land_budova4_in",[(_position select 0) - 13, (_position select 1) + 3.5,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_Vysilac_FM",[(_position select 0) - 10, (_position select 1) - 7,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["MAP_runway_poj_draha",[(_position select 0) + 10, (_position select 1) + 5,0],[], 0, "CAN_COLLIDE"];
_baserunover4 = createVehicle ["MQ9PredatorB",[(_position select 0) + 11, (_position select 1) - 28,0],[], 0, "CAN_COLLIDE"];
_baserunover5 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 36,0],[], 0, "CAN_COLLIDE"];
_baserunover6 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 30,0],[], 0, "CAN_COLLIDE"];
_baserunover7 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 24,0],[], 0, "CAN_COLLIDE"];
_baserunover8 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 18,0],[], 0, "CAN_COLLIDE"];
_baserunover9 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 12,0],[], 0, "CAN_COLLIDE"];
_baserunover10 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 6,0],[], 0, "CAN_COLLIDE"];
_baserunover11 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) + 0.1,0],[], 0, "CAN_COLLIDE"];
_baserunover12 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) - 6,0],[], 0, "CAN_COLLIDE"];
_baserunover13 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) - 12,0],[], 0, "CAN_COLLIDE"];
_baserunover14 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) - 18,0],[], 0, "CAN_COLLIDE"];
_baserunover15 = createVehicle ["ClutterCutter_EP1",[(_position select 0) + 10, (_position select 1) - 24,0],[], 0, "CAN_COLLIDE"];
_baserunover16 = createVehicle ["ClutterCutter_EP1",[(_position select 0) - 4, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7,_baserunover8,_baserunover9,_baserunover10,_baserunover11,_baserunover12,_baserunover13,_baserunover14,_baserunover15,_baserunover16];

	_directions = [-153.81,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;

//Group Spawning
_num = 2 + round (random 1);
[[(_position select 0) + 17, (_position select 1) - 18, 0],_num,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
[[(_position select 0) - 11, (_position select 1) + 9, 0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
[[(_position select 0) + 15, (_position select 1) - 15, 0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
[[(_position select 0) + 2, (_position select 1) + 18, 0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
[[_position select 0, _position select 1, 0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

// Dropped Vehicle AI
_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)+_n2+2500, 1000],100,"C130J","BRDM2_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;

// Chopper Patrols & Paratroopers
_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;

//Humvee Patrol
// [[(_position select 0) + 55, _position select 1, 0],[(_position select 0) + 17, _position select 1, 0],50,2,"HMMWV_Armored","Hard","Hero","Hero",_mission] call vehicle_patrol;
[[(_position select 0) + 55, _position select 1, 0],[(_position select 0)+3000, (_position select 1)+3000, 1000],500,"MV22","HMMWV_Armored",20,50,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;


//Static Guns
[[[(_position select 0) - 7, (_position select 1) + 19, 0]],"KORD_high_TK_EP1","Hard","US_Soldier_Medic_EP1","Hero",0,2,"Random","Random",_mission] call spawn_static;


//Condition
_complete = [
[_mission,_crate], // mission number and crate
["crate"],  // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
[_baserunover],  // cleanup objects
"Heroes are training drone pilots at a secret airfield...check your map", // mission announcement
"Survivors have secured the drones", // mission success
"Survivors did not secure the drones...time is up!" // mission fail
] call mission_winorfail;


if(_complete) then {
[_crate,[14,ai_wep_assault],[8,crate_tools_sniper],[3,crate_items_high_value],[2,crate_backpacks_large]] call dynamic_crate;
};

diag_log format["WAI: [Mission:[Bandit] Drone Pilot]: Ended at %1",_position];


b_missionsrunning = b_missionsrunning - 1;
};