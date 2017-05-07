/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	private ["_mission","_pos","_cT","_c1","_c2","_c3","_c4","_c5","_c6","_c7","_c8","_n1","_n2","_n3","_rV","_dir","_vc1","_vc2","_vc3","_vc4","_v1","_v2","_v3","_v4","_v5","_rHeli","_complete"];
	_mission = count wai_mission_data -1;
	_pos = [80] call find_position;
	[_mission,_pos,"Extreme","ISIS Takeover","MainHero",true,true,900] call mission_init;
	diag_log format["WAI: Mission ISIS Takeover started at %1",_pos];
	// Crates
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=2+round(random 50); _n2=4+round(random 50); _c1 = createVehicle [_cT,[(_pos select 0)+_n1,(_pos select 1)+_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=2+round(random 50); _n2=4+round(random 50); _c2 = createVehicle [_cT,[(_pos select 0)+_n1,(_pos select 1)-_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=2+round(random 50); _n2=4+round(random 50); _c3 = createVehicle [_cT,[(_pos select 0)-_n1,(_pos select 1)+_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=2+round(random 50); _n2=4+round(random 50); _c4 = createVehicle [_cT,[(_pos select 0)-_n1,(_pos select 1)-_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=4+round(random 50); _n2=2+round(random 50); _c5 = createVehicle [_cT,[(_pos select 0)+_n1,(_pos select 1)+_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=4+round(random 50); _n2=2+round(random 50); _c6 = createVehicle [_cT,[(_pos select 0)+_n1,(_pos select 1)-_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=4+round(random 50); _n2=2+round(random 50); _c7 = createVehicle [_cT,[(_pos select 0)-_n1,(_pos select 1)+_n2,0],[],0,"CAN_COLLIDE"];
	_cT=crates_medium call BIS_fnc_selectRandom; _n1=4+round(random 50); _n2=2+round(random 50); _c8 = createVehicle [_cT,[(_pos select 0)-_n1,(_pos select 1)-_n2,0],[],0,"CAN_COLLIDE"];
	// Groups AI
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)-_n1,(_pos select 1)-_n2,0],_n3,"Extreme",["Random","AA"],7,"Random","Bandit","Random",["Bandit",150],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)-_n1,(_pos select 1)-_n2,0],_n3,"Extreme",["Random","AT"],7,"Random","Bandit","Random",["Bandit",100],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)+_n1,(_pos select 1)+_n2,0],_n3,"Extreme",["Random","AA"],7,"Random","Bandit","Random",["Bandit",150],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)+_n1,(_pos select 1)+_n2,0],_n3,"Extreme",["Random","AT"],7,"Random","Bandit","Random",["Bandit",100],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)+_n1,(_pos select 1)-_n2,0],_n3,"Extreme",["Random","AA"],7,"Random","Bandit","Random",["Bandit",150],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)+_n1,(_pos select 1)-_n2,0],_n3,"Extreme",["Random","AT"],7,"Random","Bandit","Random",["Bandit",100],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)-_n1,(_pos select 1)+_n2,0],_n3,"Extreme",["Random","AA"],7,"Random","Bandit","Random",["Bandit",150],_mission] call spawn_group;
	_n1=10+round(random 70); _n2=10+round(random 70); _n3=2+round(random 1); [[(_pos select 0)-_n1,(_pos select 1)+_n2,0],_n3,"Extreme",["Random","AT"],7,"Random","Bandit","Random",["Bandit",100],_mission] call spawn_group;
	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)+_n2+2500, 1000],100,"C130J","BMP2_INS",20,400,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)-_n2-2500, 1000],100,"C130J","BRDM2_INS",20,400,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)-_n2-2500, 1000],100,"C130J","T72_INS",20,400,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)+_n2+2500, 1000],100,"C130J","ZSU_INS",20,400,"Extreme","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	// Static Turrets
	_n1=30+round(random 70); _n2=30+round(random 70); [[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=50+round(random 50); _n2=50+round(random 50); [[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=30+round(random 70); _n2=30+round(random 70); [[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=50+round(random 50); _n2=50+round(random 50); [[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=30+round(random 70); _n2=30+round(random 70); [[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=50+round(random 50); _n2=50+round(random 50); [[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=30+round(random 70); _n2=30+round(random 70); [[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	_n1=50+round(random 50); _n2=50+round(random 50); [[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0]],"random","Extreme","Bandit","Bandit","random",7,"random","random",_mission] call spawn_static;
	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 500],200,_rHeli,_n3,"Extreme","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)+_n2+3050, 500],200,_rHeli,1,"Extreme","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 500],200,_rHeli,_n3,"Extreme","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)-_n2-3050, 500],200,_rHeli,1,"Extreme","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 500],200,_rHeli,_n3,"Extreme","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)-_n2-3050, 500],200,_rHeli,1,"Extreme","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 500],200,_rHeli,_n3,"Extreme","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)+_n2+3050, 500],200,_rHeli,1,"Extreme","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	// Spawn Vehicles
	_vc1 = track_vehicle call BIS_fnc_selectRandom; _vc2 = track_vehicle call BIS_fnc_selectRandom; _vc3 = track_vehicle call BIS_fnc_selectRandom; _vc4 = track_vehicle call BIS_fnc_selectRandom;
	_dir = floor(round(random 360)); _n1=10+round(random 50); _n2=round(random 50); _v1 = [_vc1,[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360)); _n1=10+round(random 50); _n2=round(random 50); _v2 = [_vc2,[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360)); _n1=round(random 50); _n2=10+round(random 50); _v3 = [_vc3,[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],_mission,false,_dir] call custom_publish;
	_dir = floor(round(random 360)); _n1=round(random 50); _n2=10+round(random 50); _v4 = [_vc4,[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],_mission,false,_dir] call custom_publish;
	if(debug_mode) then {diag_log format["WAI: [Bandit] isis_takeover spawned a %1",_vc1]; diag_log format["WAI: [Bandit] isis_takeover spawned a %1",_vc2]; diag_log format["WAI: [Bandit] isis_takeover spawned a %1",_vc3]; diag_log format["WAI: [Bandit] isis_takeover spawned a %1",_vc4];};
	// Condition
	_complete = [[_mission,[_c1,_c2,_c3,_c4,_c5,_c6,_c7,_c8]],["crate"],[_v1,_v2,_v3,_v4],"This is an ISIS Takeover!!! All who resist will be shot on sight...","Survivors have pushed ISIS back!!!","ISIS has moved on.... for now."] call mission_winorfail;
	// Load Crates
	if (_complete) then {
		[_c1,[20,ai_wep_assault],[10,crate_tools],50,2] call dynamic_crate;
		[_c2,[20,ai_wep_machine],[10,crate_tools],[8,crate_items_chainbullets],2] call dynamic_crate;
		[_c3,[20,ai_wep_sniper],[10,crate_tools_sniper],[8,crate_items_sniper],2] call dynamic_crate;
		[_c4,[3,ai_wep_launchers_AT],[10,crate_tools],50,2] call dynamic_crate;
		[_c5,[3,ai_wep_launchers_AA],[10,crate_tools],50,2] call dynamic_crate;
		[_c6,[10,crate_weapons_buildables],[8,crate_tools_buildable],[100,crate_items_buildables],2] call dynamic_crate;
		[_c7,0,[10,crate_tools],[100,crate_items],2] call dynamic_crate;
		[_c8,0,[10,crate_tools],[100,crate_items_food],2] call dynamic_crate;
		_dir = floor(round(random 360)); _v5 = ["BAF_FV510_W",[(_pos select 0), (_pos select 1), 0],_mission,false,_dir] call custom_publish;
	};
	// End of mission
	diag_log format["WAI: Mission ISIS Takeover ended at %1 ended",_pos];
	h_missionsrunning = h_missionsrunning - 1;
};