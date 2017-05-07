/*
 DROP BODY SCRIPT

 Allows players to drop unconscious bodies

 JULY 2010 - norrin
*****************************************************************************************************************************
Start drop_body.sqf
*/

private ["_dragee","_unit","_wallTypes"];
_dragee	= _this select 3; 
allowDropPlayer = true;

_wallTypes = nearestObjects [player, dayz_allowedObjects, 16];


if (count _wallTypes > 0) then {
		_wall = [_wallTypes, player] call BIS_fnc_nearestPosition;
		if ((vehicle player) distance _wall < 10) then {
				cutText [format[">>>Anti-Glitch script<<< (Admin notified) Cant drop a player near an epoch building."], "PLAIN DOWN"];
				titleFadeOut 2;
				diag_log format[">>>Anti-Glitch script<<< Player: %1 tried to drop Player: %2 near an epoch building", player, _dragee];
				allowDropPlayer = false;
				sleep 1;
		};
};

if (allowDropPlayer) then {
	player removeAction NORRN_dropAction;
	player removeAction NORRN_carryAction;
	NORRN_remove_drag = true;  
	r_drag_sqf = false;
	r_carry_sqf = false;
	r_action = false;
	_unit = player;
	
	detach _unit;
	detach _dragee;
	_unit switchMove "";
	_dragee switchMove "";
	NORRN_Dragged_body = objNull;
	_dragee setVariable ["NORRN_unit_dragged", false, true]; 
	
	//lie on back
	_dragee playMoveNow "ainjppnemstpsnonwrfldnon";
	norrnRalie = _dragee;
	publicVariable "norrnRalie";
};