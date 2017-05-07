if (isServer) then {

	private["_killedat"];

	diag_log "CAI: AI Monitor Started";

	while {true} do {
	
		if (cai_clean_dead) then {
			{
				_killedat = _x getVariable "civkilledat";
				if (!isNil "_killedat") then {
					if ((time - _killedat) >= cai_cleanup_time) then {
						deleteVehicle _x;
					};
				};
			} count allDead;
		};

		if(debug_mode) then {
			diag_log format ["CAI: %1 Active ground units", cai_ground_units];
			diag_log format ["CAI: %1 Active emplacement units", cai_emplacement_units];
			diag_log format ["CAI: %1 Active chopper patrol units (Crew)", cai_air_units];
			diag_log format ["CAI: %1 Active vehicle patrol units (Crew)", cai_vehicle_units];
		};

		sleep 60;

	};

};