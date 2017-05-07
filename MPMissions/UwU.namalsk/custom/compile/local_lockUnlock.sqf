private ["_vehicle","_status","_tvih"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
		player action ["lightOn", _vehicle];
		_vehicle setVariable ["MF_Tow_Cannot_Tow",true,true];
		_vehicle setVariable ["BTC_Cannot_Lift",true,true];
		sleep 0.5;
		player action ["lightOff", _vehicle];
		cutText ["This Vehicle's God Mode: ON","PLAIN DOWN",2];		
	} else {
		_vehicle setVehicleLock "UNLOCKED";
		player action ["lightOn", _vehicle];
		_vehicle setVariable ["MF_Tow_Cannot_Tow",false,true];
		_vehicle setVariable ["BTC_Cannot_Lift",false,true];
		sleep 0.5;
		player action ["lightOff", _vehicle];
		cutText ["UNLOCKED VEHICLE WARNING: This Vehicle's God Mode: OFF (Unless in a Trader Safe Zone.)","PLAIN DOWN",2];		
	};
};
//[_vehicle,500,true,(getPosATL _vehicle)] spawn player_alertZombies;