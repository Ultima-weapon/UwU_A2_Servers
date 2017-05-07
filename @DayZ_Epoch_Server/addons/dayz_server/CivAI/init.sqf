if(isServer) then {

	civ_spawn_group			= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\spawn_group.sqf";
	civ_spawn_static		= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\spawn_static.sqf";
	civ_group_waypoints		= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\group_waypoints.sqf";

	civ_on_kill				= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\on_kill.sqf";
	civ_hero_behaviour		= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\hero_behaviour.sqf";
	civ_bandit_behaviour	= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\bandit_behaviour.sqf";

	civ_ai_monitor			= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\ai_monitor.sqf";
	civ_find_position		= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\find_position.sqf";
	civ_load_ammo			= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\load_ammo.sqf";

	call 					compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\functions.sqf";

	if(isNil("DZMSInstalled")) then {

		createCenter			EAST;
		createCenter			RESISTANCE;
	
		WEST					setFriend [EAST,0];
		WEST					setFriend [RESISTANCE,0];
	
		EAST					setFriend [WEST,0];
		EAST					setFriend [RESISTANCE,0];
		
		RESISTANCE				setFriend [EAST,0];
		RESISTANCE				setFriend [WEST,0];

	} else {
	
		createCenter			RESISTANCE;
		
		EAST					setFriend [RESISTANCE,0];
		WEST					setFriend [RESISTANCE,0];
		
		RESISTANCE				setFriend [EAST,0];
		RESISTANCE				setFriend [WEST,0];	
	};
	
	cai_staticloaded 		= false;
	CAIconfigloaded			= false;

	cai_ground_units		= 0;
	cai_emplacement_units	= 0;
	cai_air_units			= 0;
	cai_vehicle_units		= 0;
	
	//Load config
	ExecVM "\z\addons\dayz_server\CivAI\config.sqf";
	waitUntil {CAIconfigloaded};
	/*
	if ((preProcessFileLineNumbers ("\z\addons\dayz_server\CivAI\customsettings.sqf")) != "") then {
		ExecVM "\z\addons\dayz_server\CivAI\customsettings.sqf";
		diag_log "CAI: Custom Config File Loaded";
	};
	*/
	diag_log "CAI: AI Config File Loaded";
	
	[] spawn civ_ai_monitor;

	if(civ_static_missions) then {
		ExecVM "\z\addons\dayz_server\CivAI\static\init.sqf";
		waitUntil {civ_wai_staticloaded};
	};
	
	if (cai_mission_system) then {
		ExecVM "\z\addons\dayz_server\CivAI\missions\init.sqf";
	};

};