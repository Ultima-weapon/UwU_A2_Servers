private["_vehicle","_sounddist"];
_vehicle = _this select 3;
_sounddist = 50;

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_37") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
s_player_lockUnlock_crtl = 1;

PVDZE_veh_Lock = [_vehicle,true];
if(player distance _vehicle < 10) then {
	if (local _vehicle) then {
		PVDZE_veh_Lock spawn local_lockUnlock
	} else {
		publicVariable "PVDZE_veh_Lock";
	};
};

_nul = [objNull, _vehicle, rSAY, "carlock", "lock", _sounddist] call RE;

s_player_lockUnlock_crtl = -1;
DZE_ActionInProgress = false;