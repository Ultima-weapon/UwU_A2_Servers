_newCiv = _this select 3;

detach _newCiv;// Just incase

// removing required...
player removeMagazine"ItemWire";

sleep 1;

_newCiv setVariable ["Escort",0,true];
_newCiv setVariable ["Detain",1,true];

player forceWalk false;
// Animation Sitting
[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;

player playActionNow "Medic";
// Hint
cutText [format["Your hostage is tied up!"], "PLAIN"];
systemChat ('Your hostage is tied up!');

// Public Var

if (!isnil ("PVDZ_ply_Arrst")) then {
	// id removed from array
	_id = getPlayerUID _newCiv;
	PVDZ_ply_Arrst= [_id]+PVDZ_ply_Arrst;
	publicVariable "PVDZ_ply_Arrst";
} else {
	_id = getPlayerUID _newCiv;
	PVDZ_ply_Arrst= [_id];
	publicVariable "PVDZ_ply_Arrst";
};