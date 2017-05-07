private["_type"];
_type = _this select 0;
if(_type == 0 || _type == 1) then {
	player removeAction s_player_build_origins_house;
	s_player_build_origins_house = -1;
	player removeAction s_player_build_origins_garage;
	s_player_build_origins_garage = -1;
	player removeAction s_player_build_origins_stronghold;
	s_player_build_origins_stronghold = -1;
};
if(_type == 0 || _type == 2) then {
	player removeAction s_player_origins_unlock;
	s_player_origins_unlock = -1;
};
if(_type == 0 || _type == 3) then {
	player removeAction s_player_origins_stronghold_doors;
	s_player_origins_stronghold_doors = -1;
};
sleep 2;
true