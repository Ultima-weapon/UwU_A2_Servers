if(isServer) then {

	diag_log "CAI: Initialising static missions";

	if(civ_custom_per_world) then {

		ExecVM format["\z\addons\dayz_server\CivAI\static\%1.sqf",toLower(worldName)];

	} else {

		ExecVM "\z\addons\dayz_server\CivAI\static\default.sqf";

	};
	cai_staticloaded = true;
};