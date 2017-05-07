/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	private ["_mission","_pos","_cT","_c1","_complete"];
	_mission = count wai_mission_data -1;
	_pos = [5] call find_position;
	[_mission,_pos,"supereasy","Supply Drop","MainHero",true,true,150] call mission_init;
	diag_log format["WAI: Mission Ambush started at %1",_pos];
	// Crates
	_cT=crates_large call BIS_fnc_selectRandom; _c1 = createVehicle [_cT,[_pos select 0,_pos select 1,0],[],0,"CAN_COLLIDE"];
	// Condition
	_complete = [[_mission,_c1],["crate"],[],"...","The trap has been tripped...","No one fell for the trap..."] call mission_winorfail;
	// Load Crates
	if (_complete) then {
		private ["_mission2","_pos2","_complete2"];
		_pos2 = _pos;
		_mission2 = count wai_mission_data -1;
		[_mission2,_pos2,"easy","Supply Drop Trap","MainHero",true,true,150] call mission_init;
		diag_log format["WAI: Mission Ambush Trap Triggered at %1",_pos2];
		[[(_pos2 select 0)-100,(_pos2 select 1)-100,0],1,"easy",["Random","AA"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)-125,(_pos2 select 1)-50,0],1,"easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)-150,(_pos2 select 1),0],1,"easy",["Random","AA"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)-50,(_pos2 select 1)-125,0],1,"easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0),(_pos2 select 1)-150,0],1,"easy",["Random","AA"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)+50,(_pos2 select 1)-125,0],1,"easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)+100,(_pos2 select 1)-100,0],1,"easy",["Random","AA"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)+125,(_pos2 select 1)-50,0],1,"easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		[[(_pos2 select 0)+150,(_pos2 select 1),0],1,"easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission2] call spawn_group;
		_complete2 = [[_mission2,_c1],["kill"],[],"The trap has been tripped...","The enemy ambush was unsuccessful.","The enemy ambush worked."] call mission_winorfail;
		if (_complete2) then {
			[_c1,10,5,20,1] call dynamic_crate;
		};
	};
	// End of mission
	diag_log format["WAI: Mission Ambush 1 ended at %1 ended",_pos];
	h_missionsrunning = h_missionsrunning - 1;
};