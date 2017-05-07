private["_stronghold", "_action"];
_stronghold = (_this select 3 select 0);
_action = (_this select 3 select 1);
_stronghold animate ["dvere1", _action];

if(_action == 0) then {
	_stronghold setVariable["DoorsOpen",false,true];
} else {
	_stronghold setVariable["DoorsOpen",true,true];
};
[nil, _stronghold, rSAY, "origins_door_creak", 20] call RE;
sleep 1;
[3] call origins_removeActions;