/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private			["_room","_complete","_mayor_himself","_crate_type","_mission","_position","_crate","_n1","_n2","_n3","_rV","_rHeli","_baserunover","_mayor"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [80] call find_position;
	[_mission,_position,"Hard","Mayors Mansion","MainHero",true,true, 600] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Mayors Mansion]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	//Mayors Mansion
	_baserunover 	= createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],2,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],2,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	// Dropped Vehicle AI
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 1000],300,"MV22",_rV,20,300,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)+_n2+2500, 1000],100,"C130J","BMP2_INS",20,400,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)-_n1-2500, (_position select 1)-_n2-2500, 1000],100,"C130J","BRDM2_INS",20,400,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	_n1=50+round(random 50); _n2=50+round(random 50); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)-_n2-3000, 1000],300,"MV22",_rV,20,300,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
		[[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+2500, (_position select 1)-_n2-2500, 1000],100,"C130J","T72_INS",20,400,"Hard","Bandit","Bandit",false,_mission] spawn heli_para_veh;
	
	// Chopper Patrols & Paratroopers
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)+_n2+3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)+_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)+_n2+3050, 500],200,_rHeli,1,"Hard","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)-_n1, (_position select 1)-_n2, 0],[(_position select 0)-_n1-3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Hard","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
	_rHeli = armed_chopper call BIS_fnc_selectRandom; _n1=50+round(random 100); _n2=50+round(random 100); 
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3000, (_position select 1)-_n2-3000, 500],200,_rHeli,_n3,"Hard","random",7,"random","Bandit","random","Bandit",false,_mission] spawn heli_para;
		_n3=3+round(random 5); [[(_position select 0)+_n1, (_position select 1)-_n2, 0],[(_position select 0)+_n1+3050, (_position select 1)-_n2-3050, 500],200,_rHeli,1,"Hard","random",7,"random","Bandit","random","Bandit",true,_mission] spawn heli_para;
		
	//The Mayor Himself
	_mayor = [_position,1,"Hard","Random",4,"Random","Special","Random",["Bandit",500],_mission] call spawn_group;
	_mayor_himself = (units _mayor) select 0;
	
	//Put the Mayor in his room
	_room = (6 + ceil(random(3)));
	_mayor_himself disableAI "MOVE";
	_mayor_himself setPos (_baserunover buildingPos _room);
	
	//Let him move once player is near
	_mayor_himself spawn {
		private ["_mayor","_player_near"];
		_mayor = _this;
		_player_near = false;
		waitUntil {
			{
				if (isPlayer _x && (_x distance (position _mayor) < 20)) then { _player_near = true; };
			} count playableUnits;
			sleep .1;
			(_player_near)
		};
		_mayor enableAI "MOVE";
	};

	//Static mounted guns
	[[
		[(_position select 0) - 15, (_position select 1) + 15, 8],
		[(_position select 0) + 15, (_position select 1) - 15, 8]
	],"M2StaticMG","Easy","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	_complete = [
		[_mission,_crate],		// mission number and crate
		["assassinate",_mayor], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"The Mayor has gone rogue, go take him and his task force out to claim the black market weapons!",	// mission announcement
		"The rogue mayor has been taken out, who will be the next Mayor?",						// mission success
		"Survivors were unable to capture the mansion, time is up"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,16,4,0,4] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Mayors Mansion]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};