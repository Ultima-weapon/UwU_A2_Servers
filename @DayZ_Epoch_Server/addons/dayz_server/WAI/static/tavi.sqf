/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	private ["_pos","_n1","_n2","_n3","_n4","_rV","_rHeli"];
	diag_log "WAI: Sector B loading";
	_pos = [22558.5,19594,0];

			//Custom Spawns file//
			/*
			Custom group spawns Eg.
			[
			  [953.237,4486.48,0.001],   // Position
			  4,         // Number Of units
			  "Random",       // Skill level of unit (easy, medium, hard, extreme, Random)
			  "Random",       // Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
			  4,         // Number of magazines
			  "Random",       // Backpack classname, use "Random" or classname here
			  "Random",       // Skin classname, use "Random" or classname here
			  "Random",       // Gearset number. "Random" for random gear set
			  "Bandit"       // AI Type, "Hero" or "Bandit".
			] call spawn_group;
			Place your custom group spawns below
			*/

	//Sector B
	[[22487.2,20048.4,0],5,"extreme","Random",8,"Random","Mercenary_Default22","Random","Bandit"] call spawn_group;
	[[22394.4,20038.6,0],5,"extreme","Random",8,"Random","Mercenary_Default27","Random","Bandit"] call spawn_group;
	[[22645.1,20042.2,0],5,"extreme","Random",8,"Random","Mercenary_Default28","Random","Bandit"] call spawn_group;
	[[22645.1,20042.2,0],5,"extreme","Random",8,"Random","Mercenary_Default11","Random","Bandit"] call spawn_group;
	[[22439.3,19852.6,0],5,"extreme","Random",8,"Random","Mercenary_Default14","Random","Bandit"] call spawn_group;
	[[22203.9,19845.1,0],5,"extreme","Random",8,"Random","Mercenary_Default9a","Random","Bandit"] call spawn_group;
	[[22184.6,19650.3,0],5,"extreme","Random",8,"Random","Mercenary_Default22","Random","Bandit"] call spawn_group;
	[[22531.8,19695.3,0],5,"extreme","Random",8,"Random","Mercenary_Default27","Random","Bandit"] call spawn_group;
	[[22192,19364.6,0],5,"extreme","Random",8,"Random","Mercenary_Default28","Random","Bandit"] call spawn_group;
	[[22430.2,19258.2,0],5,"extreme","Random",8,"Random","Mercenary_Default11","Random","Bandit"] call spawn_group;
	[[22470.4,19129.3,0],5,"extreme","Random",8,"Random","Mercenary_Default14","Random","Bandit"] call spawn_group;
	[[22470.4,19129.3,0],5,"extreme","Random",8,"Random","Mercenary_Default9a","Random","Bandit"] call spawn_group;
	[[22072.1,19631.7,0],5,"extreme","Random",8,"Random","Mercenary_Default22","Random","Bandit"] call spawn_group;
	[[23045.6,19239.9,0],5,"extreme","Random",8,"Random","Mercenary_Default27","Random","Bandit"] call spawn_group;
	[[23162.9,19346.6,0],5,"extreme","Random",8,"Random","Mercenary_Default28","Random","Bandit"] call spawn_group;
	[[22513.9,18981.5,0],5,"extreme","Random",8,"Random","Mercenary_Default11","Random","Bandit"] call spawn_group;
	[[22508.6,19880.9,0],5,"extreme","Random",8,"Random","Mercenary_Default14","Random","Bandit"] call spawn_group;
	[[22237.7,20206.5,0],5,"extreme","Random",8,"Random","Mercenary_Default9a","Random","Bandit"] call spawn_group;
	[[22735.4,19276.7,0],5,"extreme","Random",8,"Random","Mercenary_Default22","Random","Bandit"] call spawn_group;
	[[22462.5,19475.5,0],5,"extreme","Random",8,"Random","Mercenary_Default27","Random","Bandit"] call spawn_group;
	diag_log "WAI: Sector B - AI Groups Loaded";
	
	// Dropped Vehicle AI
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)+_n2+2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)+_n2+2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
		
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)-_n2-2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)-_n2-2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
		
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)-_n2-2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+2500, (_pos select 1)-_n2-2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;

	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = armed_armored_vehicles call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 1000],_n3,"MV22",_rV,20,300,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;	
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)+_n2+2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	_n1=round(random 200)+round(random 300); _n2=round(random 200)+round(random 300); _n3=50+round(random 300); _rV = track_vehicle call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-2500, (_pos select 1)+_n2+2500, 1000],_n3,"C130J",_rV,20,400,"Extreme","Bandit","Bandit",false] spawn heli_para_veh;
	diag_log "WAI: Sector B - Random Vehicle Drop Triggers Loaded";
	
	// Chopper Patrols & Paratroopers
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)+_n2+3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;	
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)+_n2+3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)+_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)+_n2+3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
		
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)-_n2-3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;	
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)-_n2-3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)-_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)-_n2-3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
		
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3000, (_pos select 1)-_n2-3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)-_n2-3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)+_n1, (_pos select 1)-_n2, 0],[(_pos select 0)+_n1+3050, (_pos select 1)-_n2-3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
		
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3000, (_pos select 1)+_n2+3000, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;	
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)+_n2+3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	_n1=round(random 100)+round(random 200); _n2=round(random 100)+round(random 200); _n3=100+round(random 200); _n4=3+round(random 5); _rHeli = armed_chopper call BIS_fnc_selectRandom;
		[[(_pos select 0)-_n1, (_pos select 1)+_n2, 0],[(_pos select 0)-_n1-3050, (_pos select 1)+_n2+3050, 500],_n3,_rHeli,_n4,"Extreme","random",7,"random","Bandit","random","Bandit",true] spawn heli_para;
	diag_log "WAI: Sector B - Random Para Drop Triggers Loaded";
	
			/*
			Custom static weapon spawns Eg. (with multiple positions)
			[
			  [         // Position(s) (can be multiple)
			   [911.21,4532.76,2.62],
			   [921.21,4542.76,2.62]
			  ],
			  "M2StaticMG",      // Classname of turret
			  "easy",        // Skill level of unit (easy, medium, hard, extreme, Random)
			  "Bandit2_DZ",      // Skin classname, use "Random" or classname here
			  "Bandit",       // AI Type, "Hero" or "Bandit".
			  "Random",       // Primary gun set number. "Random" for random weapon set
			  2,         // Number of magazines
			  "Random",       // Backpack classname, use "Random" or classname here
			  "Random"       // Gearset classname, use "Random" or classname here
			] call spawn_static;
			Place your custom static weapon spawns below
			*/

	//SectorB Hotel
	[[[22879.6,19838.4,10.365]],"M2StaticMG","extreme","Mercenary_Default22","Bandit","Random",2,"Random","Random"] call spawn_static;
	[[[22879.8,19874.6,10.365]],"M2StaticMG","extreme","Mercenary_Default28","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Hotel Static loaded";

	//Large Apt. North
	[[[22335.8,19734.4,23.602]],"M2StaticMG","extreme","Mercenary_Default11","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Large Apt North Static loaded";

	//Large Apt. South
	[[[22332.9,19667.9,23.602]],"M2StaticMG","extreme","Mercenary_Default14","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Sector B Large Apt South loaded";

	//Small Apt. West
	[[[22188.7,19786.9,12.8022]],"M2StaticMG","extreme","Mercenary_Default9a","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Small Apt West Static loaded";

	//Wall
	[[[22143,19314,10.0014]],"M2StaticMG","extreme","Mercenary_Default22","Bandit","Random",2,"Random","Random"] call spawn_static;
	[[[22378.8,19070.3,10.0014]],"M2StaticMG","extreme","Mercenary_Default22","Bandit","Random",2,"Random","Random"] call spawn_static;
	[[[22919.4,20091.2,10.0001]],"M2StaticMG","extreme","Mercenary_Default22","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Wall Static loaded";

	// Courtyard
	[[[22453.6,19501.5,0]],"M2StaticMG","extreme","Mercenary_Default28","Bandit","Random",2,"Random","Random"] call spawn_static;
	// Courtyard
	[[[22218.6,19784.9,9.502]],"M2StaticMG","extreme","Mercenary_Default11","Bandit","Random",2,"Random","Random"] call spawn_static;
	[[[22213.8,19786.9,12.8022]],"M2StaticMG","extreme","Mercenary_Default14","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Small Apt East Static loaded";

	// Mayor MG
	[[[22140,19841.9,1.37462]],"M2StaticMG","extreme","Mercenary_Default9a","Bandit","Random",2,"Random","Random"] call spawn_static;    
	diag_log "WAI: Sector B - Mayor Static loaded";

	// Hospital MG
	[[[22211.7,19977.7,10.5]],"M2StaticMG","extreme","Mercenary_Default11","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Hospital Static loaded";

	// Industrial
	[[[22511.9,20015.6,6.6822]],"M2StaticMG","extreme","Mercenary_Default14","Bandit","Random",2,"Random","Random"] call spawn_static;
	diag_log "WAI: Sector B - Industrial Static loaded";

	// Tank Farm
	[[[23033.3,19399.7,10.0015]],"M2StaticMG","extreme","Mercenary_Default22","Bandit","Random",2,"Random","Random"] call spawn_static;   
	diag_log "WAI: Sector B - Tank Farm Static loaded";
	
			/*
			Custom Chopper Patrol spawn Eg.
			[
			  [725.391,4526.06,0],    // Position to patrol
			  [0,0,0],       // Position to spawn chopper at
			  2000,        // Radius of patrol
			  10,         // Number of waypoints to give
			  "UH1H_DZ",       // Classname of vehicle (make sure it has driver and two gunners)
			  "Random",       // Skill level of units (easy, medium, hard, extreme, Random)
			  "Random",       // Skin classname, use "Random" or classname here
			  "Bandit"       // AI Type, "Hero" or "Bandit".
			] spawn heli_patrol;
			Place your heli patrols below
			*/
	[
	  [22690.6,20000.0,0],    // Northern Position to patrol
	  [22690.6,20000.0,0],    // Position to spawn chopper at
	  750,        // Radius of patrol
	  10,         // Number of waypoints to give
	  "UH1H_DZ",       // Classname of vehicle (make sure it has driver and two gunners)
	  "extreme",       // Skill level of units (easy, medium, hard, extreme, Random)
	  "Random",       // Skin classname, use "Random" or classname here
	  "Bandit"       // AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	[
	  [22584.8,19625.1,0],    //Central Position to patrol
	  [22584.8,19625.1,0], // Position to spawn chopper at
	  1000,     //Radius of patrol
	  10,                     //Number of waypoints to give
	  "UH1H_TK_EP1",          //Classname of vehicle (make sure it has driver and two gunners)
	  "extreme",      //Skill level of units
	  "Random",    // Skin classname, use "Random" or classname here
	  "Bandit"    // AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	[
	  [22673.9,19215.4,0],    //Southern Position to patrol
	  [22673.9,19215.4,0],      // Position to spawn chopper at
	  750,     //Radius of patrol
	  10,                     //Number of waypoints to give
	  "Mi17_rockets_RU",  //Classname of vehicle (make sure it has driver and two gunners)
	  "extreme",      //Skill level of units
	  "Random",    // Skin classname, use "Random" or classname here
	  "Bandit"    // AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	diag_log "WAI: Sector B - Air Patrols Loaded";

	//Sector B
	[[22125.4,20431.6,0],[22125.4,20431.6,0],300,10,"RHIB2Turret","hard","FR_OHara_DZ","Bandit"] spawn vehicle_patrol;
	[[22704.2,18720.1,0],[22859.9,18800.1,0],1000,10,"RHIB2Turret","hard","FR_OHara_DZ","Bandit"] spawn vehicle_patrol;
	diag_log "WAI: Sector B - Boat Patrols Loaded";
	diag_log "WAI: Sector B loaded";
};