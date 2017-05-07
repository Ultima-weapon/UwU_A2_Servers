if(isServer) then {

	private["_civ_marker","_civ_unitGroup","_civ_b_missionTime","_civ_h_missionTime","_civ_s_missionTime","_civ_h_startTime","_civ_b_startTime","_civ_s_startTime","_civ_result","_civ_cnt","_civ_currTime","_civ_mission"];

	diag_log "CAI: Initialising missions";

	// Mission functions
	call 							compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\position_functions.sqf";
	civ_mission_init				= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\mission_init.sqf";
	civ_mission_winorfail			= compile preprocessFileLineNumbers "\z\addons\dayz_server\CivAI\compile\mission_winorfail.sqf";
	
	civ_trader_markers 				= call civ_get_trader_markers;
	civ_markerready 				= true;
	cai_mission_data				= [];
	cai_hero_mission				= [];
	cai_bandit_mission				= [];
	cai_special_mission				= [];
	civ_h_missionsrunning			= 0;
	civ_b_missionsrunning			= 0;
	civ_s_missionsrunning			= 0;
	_civ_h_startTime 				= floor(time);
	_civ_b_startTime 				= floor(time);
	_civ_s_startTime 				= floor(time);
	_civ_delayTime					= floor(time);
	_civ_h_missionTime				= nil;
	_civ_b_missionTime				= nil;
	_civ_s_missionTime				= nil;
	_civ_mission					= "";
	_civ_hresult 					= 0;
	_civ_bresult 					= 0;
	_civ_sresult 					= 0;

	// Set mission frequencies from config
	{
		for "_i" from 1 to (_x select 1) do {
			cai_hero_mission set [count cai_hero_mission, _x select 0];
		};
	} count cai_hero_missions;

	{
		for "_i" from 1 to (_x select 1) do {
			cai_bandit_mission set [count cai_bandit_mission, _x select 0];
		};
	} count cai_bandit_missions;
	
	{
		for "_i" from 1 to (_x select 1) do {
			cai_special_mission set [count cai_special_mission, _x select 0];
		};
	} count cai_special_missions;

	// Start mission monitor
	while {true} do
	{
		_civ_cnt 		= {alive _x} count playableUnits;
		_civ_currTime 	= floor(time);

		if (isNil "_civ_h_missionTime") then { _civ_h_missionTime = ((cai_mission_timer select 0) + random((cai_mission_timer select 1) - (cai_mission_timer select 0))); };
		if (isNil "_civ_b_missionTime") then { _civ_b_missionTime = ((cai_mission_timer select 0) + random((cai_mission_timer select 1) - (cai_mission_timer select 0))); };
		if (isNil "_civ_s_missionTime") then { _civ_s_missionTime = ((cai_mission_timer select 0) + random((cai_mission_timer select 1) - (cai_mission_timer select 0))); };

		if((_civ_currTime - _civ_h_startTime >= _civ_h_missionTime) && (civ_h_missionsrunning < cai_hero_limit)) then { _civ_hresult = 1; };
		if((_civ_currTime - _civ_b_startTime >= _civ_b_missionTime) && (civ_b_missionsrunning < cai_bandit_limit)) then { _civ_bresult = 1; };
		if((_civ_currTime - _civ_s_startTime >= _civ_s_missionTime) && (civ_s_missionsrunning < cai_bandit_limit)) then { _civ_sresult = 1; };

		if(civ_h_missionsrunning == cai_hero_limit) then { _civ_h_startTime = floor(time); };
		if(civ_b_missionsrunning == cai_bandit_limit) then { _civ_b_startTime = floor(time); };
		if(civ_S_missionsrunning == cai_special_limit) then { _civ_s_startTime = floor(time); };

		if((_civ_cnt >= cai_players_online) && (diag_fps >= cai_server_fps)) then {

			if (_civ_hresult == 1) then {
				waitUntil {_civ_currTime = floor(time);(_civ_currTime - _civ_delayTime > 10 && civ_markerready)};
				civ_markerready 		= false;
				civ_h_missionsrunning 	= civ_h_missionsrunning + 1;
				_civ_h_startTime 		= floor(time);
				_civ_delayTime			= floor(time);
				_civ_h_missionTime		= nil;
				_civ_hresult 			= 0;
				cai_mission_markers set [(count cai_mission_markers), ("MainHero" + str(count cai_mission_data))];
				cai_mission_data = cai_mission_data + [[0,"",[],[0,0,0]]];

				_civ_mission 			= cai_hero_mission call BIS_fnc_selectRandom;
				execVM format ["\z\addons\dayz_server\CivAI\missions\hero\%1.sqf",_civ_mission];
			};

			if (_civ_bresult == 1) then {
				waitUntil {_civ_currTime = floor(time);(_civ_currTime - _civ_delayTime > 10 && civ_markerready)};
				civ_markerready 		= false;
				civ_b_missionsrunning 	= civ_b_missionsrunning + 1;
				_civ_b_startTime 		= floor(time);
				_civ_delayTime			= floor(time);
				_civ_b_missionTime		= nil;
				_civ_bresult 			= 0;
				cai_mission_markers set [(count cai_mission_markers), ("MainBandit" + str(count cai_mission_data))];
				cai_mission_data = cai_mission_data + [[0,"",[],[0,0,0]]];
				
				_civ_mission 			= cai_bandit_mission call BIS_fnc_selectRandom;
				execVM format ["\z\addons\dayz_server\CivAI\missions\bandit\%1.sqf",_civ_mission];
			};
			
			if (_civ_sresult == 1) then {
				waitUntil {_civ_currTime = floor(time);(_civ_currTime - _civ_delayTime > 10 && civ_markerready)};
				civ_markerready 		= false;
				civ_s_missionsrunning 	= civ_s_missionsrunning + 1;
				_civ_s_startTime 		= floor(time);
				_civ_delayTime			= floor(time);
				_civ_s_missionTime		= nil;
				_civ_sresult 			= 0;
				cai_mission_markers set [(count cai_mission_markers), ("Special" + str(count cai_mission_data))];
				cai_mission_data = cai_mission_data + [[0,"",[],[0,0,0]]];
				
				_civ_mission 			= cai_special_mission call BIS_fnc_selectRandom;
				execVM format ["\z\addons\dayz_server\CivAI\missions\special\%1.sqf",_civ_mission];
			};

		};
		sleep 5;
	};
};