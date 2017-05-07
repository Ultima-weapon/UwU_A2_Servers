Private ["_random","_humRank","_escapeChance"];
_newCiv = _this select 3;
_random = round(random(100));
cutText [format["You are attempting to escape..."], "PLAIN"];
sleep 15; // 15 seconds to get away

_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {_escapeChance = 10;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {_escapeChance = 15;};
if(_humRank >= 10000 && _humRank < 15000) then {_escapeChance = 20;};
if(_humRank >= 15000 && _humRank < 25000) then {_escapeChance = 25;};
if(_humRank >= 25000 && _humRank < 40000) then {_escapeChance = 30;};
if(_humRank >= 40000 && _humRank < 60000) then {_escapeChance = 35;};
if(_humRank >= 60000 && _humRank < 90000) then {_escapeChance = 40;};
if(_humRank >= 90000 && _humRank < 130000) then {_escapeChance = 45;};
if(_humRank >= 130000 && _humRank < 185000) then {_escapeChance = 50;};
if(_humRank >= 185000 && _humRank < 250000) then {_escapeChance = 55;};
if(_humRank >= 250000) then {_escapeChance = 60;};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {_escapeChance = 10;};
if(_humRank <= -10000 && _humRank > -15000) then {_escapeChance = 9;};
if(_humRank <= -15000 && _humRank > -25000) then {_escapeChance = 8;};
if(_humRank <= -25000 && _humRank > -40000) then {_escapeChance = 7;};
if(_humRank <= -40000 && _humRank > -60000) then {_escapeChance = 6;};
if(_humRank <= -60000 && _humRank > -90000) then {_escapeChance = 5;};
if(_humRank <= -90000 && _humRank > -130000) then {_escapeChance = 4;};
if(_humRank <= -130000 && _humRank > -185000) then {_escapeChance = 3;};
if(_humRank <= -185000 && _humRank > -250000) then {_escapeChance = 2;};
if(_humRank <= -250000) then {_escapeChance = 1;};

If(_random < _escapeChance) then {
	detach _newCiv; // Just in case
	_newCiv setVariable ["Detain",0,true];
	_newCiv setVariable ["Escort",0,true];
	if (!isnil ("PVDZ_ply_Arrst")) then {
		// id removed from array
		_id = getPlayerUID _newCiv;
		PVDZ_ply_Arrst= PVDZ_ply_Arrst-[_id];
		publicVariable "PVDZ_ply_Arrst";
	} else {
		_id = getPlayerUID _newCiv;
		PVDZ_ply_Arrst= nil;
		publicVariable "PVDZ_ply_Arrst";
	};
	[objNull, _newCiv, rswitchmove ,""] call RE;
	cutText [format["Your escape attempt was a success!"], "PLAIN"];
} else {
	cutText [format["Your escape attempt failed."], "PLAIN"];
};