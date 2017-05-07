private["_playerPos","_canDrink","_isPond","_isWell","_isOcean","_pondPos","_objectsWell","_objectsPond","_display","_humRank","_scale"];
 
call gear_ui_init;
_playerPos = getPosATL player;
_canDrink = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank","Land_Misc_Well_C_EP1","Land_Misc_Well_L_EP1","MAP_Misc_Well","MAP_Misc_WellPump","MAP_pumpa","MAP_barrel_water"], 4] > 0;
_isPond = false;
_isWell = false;
_isOcean = false;
_pondPos = [];
_objectsWell = [];
 
if (!_canDrink) then {
        _objectsWell = nearestObjects [_playerPos, [], 4];
        {
                //Check for Well
                _isWell = ["_well",str(_x),false] call fnc_inString;
                if (_isWell) then {_canDrink = true};
        } forEach _objectsWell;
};
 
if (!_canDrink) then {
        _objectsPond = nearestObjects [_playerPos, [], 50];
        {
                //Check for pond
                _isPond = ["pond",str(_x),false] call fnc_inString;
                if (_isPond) then {
                        _pondPos = (_x worldToModel _playerPos) select 2;
                        if (_pondPos < 0) then {
                                _canDrink = true;
                        };
                };
        } forEach _objectsPond;
};
 
if (!_canDrink) then {
		_isOcean = (surfaceIsWater (_playerPos));
		if (_isOcean) then {
				_canDrink = true;
		};
};

_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {_scale = 100;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {_scale = 90;};
if(_humRank >= 10000 && _humRank < 15000) then {_scale = 80;};
if(_humRank >= 15000 && _humRank < 25000) then {_scale = 70;};
if(_humRank >= 25000 && _humRank < 40000) then {_scale = 60;};
if(_humRank >= 40000 && _humRank < 60000) then {_scale = 50;};
if(_humRank >= 60000 && _humRank < 90000) then {_scale = 40;};
if(_humRank >= 90000 && _humRank < 130000) then {_scale = 30;};
if(_humRank >= 130000 && _humRank < 185000) then {_scale = 20;};
if(_humRank >= 185000 && _humRank < 250000) then {_scale = 10;};
if(_humRank >= 250000) then {_scale = 0;};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {_scale = 99;};
if(_humRank <= -10000 && _humRank > -15000) then {_scale = 98;};
if(_humRank <= -15000 && _humRank > -25000) then {_scale = 97;};
if(_humRank <= -25000 && _humRank > -40000) then {_scale = 96;};
if(_humRank <= -40000 && _humRank > -60000) then {_scale = 95;};
if(_humRank <= -60000 && _humRank > -90000) then {_scale = 94;};
if(_humRank <= -90000 && _humRank > -130000) then {_scale = 93;};
if(_humRank <= -130000 && _humRank > -185000) then {_scale = 92;};
if(_humRank <= -185000 && _humRank > -250000) then {_scale = 91;};
if(_humRank <= -250000) then {_scale = 90;};

if (_canDrink) then {
	if (_isOcean) then {
		if ((floor (random 100) < _scale)) then {	
			player playActionNow "PutDown";
			dayz_thirst = dayz_thirst + 5000;
			_canDrink = false;
			
			//Ensure Control is visible
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			(_display displayCtrl 1302) ctrlShow true;
			cutText ["The water tastes very salty, you are now more thirsty than ever.", "PLAIN DOWN"];
		};
	};
};

if (_canDrink) then {
	if ((floor (random 100) < 5)) then {
		player playActionNow "PutDown";
		r_player_infected = true;
		player setVariable["USEC_infected",true,true];
		player setVariable ["messing",[dayz_hunger,dayz_thirst],true];

		dayz_lastDrink = time;
		dayz_thirst = 0;

		//Ensure Control is visible
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		(_display displayCtrl 1302) ctrlShow true;
		cutText ["The water is warm and tastes kinda strange, but your thirst is quenched.", "PLAIN DOWN"];
	} else {
		player playActionNow "PutDown";
		dayz_lastDrink = time;
		dayz_thirst = 0;

		//Ensure Control is visible
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		(_display displayCtrl 1302) ctrlShow true;
		cutText ["The water is cool and tastes a bit stale, but your thirst is quenched.", "PLAIN DOWN"];
	};
};