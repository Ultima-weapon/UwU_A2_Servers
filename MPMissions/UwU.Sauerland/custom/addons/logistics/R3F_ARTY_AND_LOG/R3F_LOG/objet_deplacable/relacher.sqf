/**
 * Passe la variable R3F_LOG_joueur_deplace_objet à objNull pour informer le script "deplacer" d'arrêter de déplacer l'objet
 */
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
		if (R3F_LOG_mutex_local_verrou) then
		{
			player globalChat STR_R3F_LOG_mutex_action_en_cours;
		}
		else
		{
			R3F_LOG_mutex_local_verrou = true;
			
			R3F_LOG_joueur_deplace_objet = objNull;
			sleep 2;
			
			R3F_LOG_mutex_local_verrou = false;
		};
	} else {
		cutText [format["You are not allowed to release this object in a plot you do not own."], "PLAIN"];
		systemChat ('You are not allowed to release this object in a plot you do not own.');
	};
} else {
	if (R3F_LOG_mutex_local_verrou) then
	{
		player globalChat STR_R3F_LOG_mutex_action_en_cours;
	}
	else
	{
		R3F_LOG_mutex_local_verrou = true;
		
		R3F_LOG_joueur_deplace_objet = objNull;
		sleep 2;
		
		R3F_LOG_mutex_local_verrou = false;
	};
};