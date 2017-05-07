_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
_IsNearPlot = count (_findNearestPoles);
_fuid  = [];
_allowed = [];
if(_IsNearPlot > 0)then{
	_playerUID = [player] call FNC_GetPlayerUID;
	_thePlot = _findNearestPoles select 0;
	_owner =  _thePlot getVariable ["ownerPUID","010"];
	_friends = _thePlot getVariable ["plotfriends", []];
	{
	  _friendUID = _x select 0;
	  _fuid  =  _fuid  + [_friendUID];
	} forEach _friends;
	_allowed = [_owner];    
	_allowed = [_owner] +  _fuid;	
	if ( _playerUID in _allowed) then {
		player removeAction act4; // removing stop escort
		_newCiv = _this select 3;

		sleep 1;

		detach _newCiv; // Just in case
		_newCiv setVariable ["Escort",0,true];

		player forceWalk false;
		// Animation Sitting
		[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;
	} else {
		cutText [format["You are not allowed to stop escorting a hostage in a plot you do not own."], "PLAIN"];
		systemChat ('You are not allowed to stop escorting a hostage in a plot you do not own.');
	};
} else {
	player removeAction act4; // removing stop escort
	_newCiv = _this select 3;

	sleep 1;

	detach _newCiv; // Just in case
	_newCiv setVariable ["Escort",0,true];

	player forceWalk false;
	// Animation Sitting
	[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;
};