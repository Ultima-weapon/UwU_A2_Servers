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
		_newCiv = _this select 3;
		// Global animation
		_newCiv attachto [player,[0, 0, 0]];
		detach _newCiv; // Just in case
		_newCiv setVariable ["Detain",0,true];
		player forceWalk false;
		// Animation Sitting
		[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;
		if(_newCiv getVariable "Escort" == 1) then {
			_newCiv setVariable ["Escort",0,true];
			player removeAction act4;
		};
		player removeAction s_player_escort;
		s_player_escort = -1;
		player removeAction s_player_search;
		s_player_search = -1;
		player removeAction s_player_release;
		s_player_release = -1;

		player playActionNow "Medic";

		sleep 15; // 15 seconds to get away

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
	} else {
		cutText [format["You are not allowed to release a hostage in a plot you do not own."], "PLAIN"];
		systemChat ('You are not allowed to release a hostage in a plot you do not own.');
	};
} else {
		_newCiv = _this select 3;
		// Global animation
		_newCiv attachto [player,[0, 0, 0]];
		detach _newCiv; // Just in case
		_newCiv setVariable ["Detain",0,true];
		player forceWalk false;
		// Animation Sitting
		[objNull, _newCiv, rswitchmove ,"CivilSitting"] call RE;
		if(_newCiv getVariable "Escort" == 1) then {
			_newCiv setVariable ["Escort",0,true];
			player removeAction act4;
		};
		player removeAction s_player_escort;
		s_player_escort = -1;
		player removeAction s_player_search;
		s_player_search = -1;
		player removeAction s_player_release;
		s_player_release = -1;

		player playActionNow "Medic";

		sleep 15; // 15 seconds to get away

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
};