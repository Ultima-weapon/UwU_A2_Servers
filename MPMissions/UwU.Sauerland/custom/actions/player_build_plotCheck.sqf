if(!DZE_ActionInProgress) exitWith {};
//Check if nearby plotpoles exists
private ["_passArray","_isPole","_needText","_distance","_findNearestPoles","_findNearestPole","_IsNearPlot","_requireplot","_isLandFireDZ","_canBuildOnPlot","_nearestPole","_ownerID","_friendlies", "_playerUID","_plotcheck","_isAdmin"];

//defines
_isPole = _this select 0;
_requireplot = _this select 1;
_isLandFireDZ = _this select 2;

_needText = localize "str_epoch_player_246"; //text for when requirements not met
_canBuildOnPlot = false;
_nearestPole = objNull;
_ownerID = 0;
_friendlies = [];

_plotcheck = [player, _isPole] call FNC_find_plots;
_distance = _plotcheck select 0;
_IsNearPlot = _plotcheck select 1;
_nearestPole = _plotcheck select 2;

// If item is plot pole && another one exists within 200m
if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(format [localize "str_epoch_player_44", DZE_PlotPole select 1]) , "PLAIN DOWN"]; };

// If item is plot pole && a safezone is within 500meters
_IsNearSafezone = count(nearestObjects[player, ["Sign_sphere100cm_EP1"], 600]);
if(_isPole && _IsNearSafezone > 0) exitWith { DZE_ActionInProgress = false; cutText ["You must be more than 600meters away from a safezone to place a plot pole.","PLAIN DOWN"]; };

if(_IsNearPlot == 0) then {

	// Allow building of plotpole or items not requiring a plot pole
	if(!(_requireplot) || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};

} else {
	// Since there are plot poles nearby we need to check ownership && friend status

	_buildcheck = [player, _nearestPole] call FNC_check_owner;
	_isowner = _buildcheck select 0;
	_isfriendly = _buildcheck select 1;
	_isAdmin = _buildcheck select 2;
	if ((_isowner) || (_isfriendly) || (_isAdmin)) then {
		
		_canBuildOnPlot = true;
	};
};

_passArray = [_IsNearPlot,_nearestPole,_ownerID,_friendlies,_distance]; //create new array and pass it to caller

// End script if item is plot pole and another one exists within defined radius
if(_isPole && _IsNearPlot > 0) exitWith { 
	DZE_ActionInProgress = false;
	cutText [(format [localize "str_epoch_player_44", DZE_PlotPole select 1]) , "PLAIN DOWN"];
	_passArray
};

if(!_canBuildOnPlot) exitWith { //end script if requirements were not met
	DZE_ActionInProgress = false;
	cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"];
	_passArray
};
_passArray //[int,Obj,int,array]
