/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_n1","_n2","_n3","_rV","_rHeli","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Hero Base","MainBandit",true,true,600] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Hero Base]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Buildings
	_baserunover0 	= createVehicle ["land_fortified_nest_big",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["land_fortified_nest_big",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover6 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover7 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];
	
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Group Spawning
	_num = 2 + round (random 1);
	[[_position select 0,_position select 1,0],_num,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)-_n2-2500, 1000],100,"C130J","T72_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)-_n1, (_position select 1)+_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)-_n1-2500, (_position select 1)+_n2+2500, 1000],100,"C130J","ZSU_INS",20,400,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	
	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Hero","random","Hero",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Hard","random",7,"random","Hero","random","Hero",true,_mission] spawn heli_para;
	
	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0)-3000,(_position select 0)-3000,1000],600,"MV22","HMMWV_M1151_M2_DES_EP1",2,50,"Hard","Hero","Hero",false,_mission] spawn heli_para_veh;
	 
	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Heli Paradrop
	[[(_position select 0), (_position select 1), 0],[(_position select 0)-3000,(_position select 1)-3000,0],400,"UH1H_DZ",10,"Hard","Random",4,"Random","Hero","Random","Hero",true,_mission] spawn heli_para;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"Heroes have setup a heavily fortified base, are you bandit enough to take them down?",	// mission announcement
		"Bandits have captured the Hero base",										// mission success
		"Bandits did not capture the base in time"									// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[16,ai_wep_sniper],[8,crate_tools_sniper],[3,crate_items_high_value],[4,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Hero Base]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};