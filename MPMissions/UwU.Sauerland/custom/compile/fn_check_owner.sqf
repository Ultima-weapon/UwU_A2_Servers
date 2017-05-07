// Check Ownership by RimBlock (http://epochmod.com/forum/index.php?/user/12612-rimblock/)

private ["_player","_object","_playerUID","_ObjectOwner","_owner","_friendlies","_friendly","_return","_fuid","_nearestPole","_PlotAdmin","_adminList"];

_player = _this select 0;
_Object = _this select 1;
_Owner = false;
_friendly = false;
_PlotAdmin = false;

_playerUID = [_player] call FNC_GetPlayerUID;
_ObjectOwner = _object getVariable ["ownerPUID","0"];

_nearestPole = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],((DZE_PlotPole Select 0) / 2) + 3] Select 0;
_friendlies	= _nearestPole getVariable ["plotfriends",[]];
_fuid  = [];
	{
		  _friendUID = _x select 0;
		  _fuid  =  _fuid  + [_friendUID];
	} forEach _friendlies;
_adminList = DoorAdminList;

if (_playerUID == _ObjectOwner) then {
	_owner = true;
};

if (_playerUID in _fuid) then {
	_friendly = true;
};
if (_playerUID in _adminList) then {
	_PlotAdmin = true;
};

_return = [_owner, _friendly, _PlotAdmin];
_return
