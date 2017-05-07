_newCiv = _this select 3;

[objNull, _newCiv, rSwitchMove,""] call RE; // Just incase

detach _newCiv; // Just incase

_newCiv setVariable ["Escort",1,true];
// standing arrested animation
[objNull, _newCiv, rswitchmove ,"ActsPercMstpSnonWrflDnon_interrogate02_forgoten"] call RE;
player forceWalk true;

// Attaching to player for escort
_newCiv attachto [player,[-0.2, 0.7, 0]];
act4 = player addaction ['<t color="#00ff00">' + "Stop Escorting" + '</t>', "custom\addons\arrest\stop_escort.sqf",_newCiv, 1, true, true, "", ""]; // Adds action to re-detain.
while { (_newCiv getVariable "Escort" == 1) } do {
	if (vehicle player != player) then {
		_newCiv attachto [player,[0, 0, 0]];
		detach _newCiv;
		_newCiv setVariable ["Escort",0,true];
		[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;
		player removeAction act4;
	};
};