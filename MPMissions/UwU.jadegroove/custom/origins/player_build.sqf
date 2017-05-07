private ["_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap","_charID","_name","_objectID","_objectUID","_playerUID","_playerName","_combination","_playerID","_IsNearSafezone"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

// disallow building if too many objects are found within 30m
if((count ((getPosATL player) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"];};

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_crate = (_this select 3 select 0);
_houselevel = (_this select 3 select 1);
_classname = (_this select 3 select 2);
_neededMaterials = (_this select 3 select 3);
_name = (_this select 3 select 4);
_charID = dayz_characterID;
_playerUID = dayz_playerUID;
_playerName = (name player);
[1] call origins_removeActions;

_proceed = [_crate,_neededMaterials] call origins_checkNeededMaterial;
if(!_proceed) exitWith{DZE_ActionInProgress = false;};

// Need Near Requirements
_abort = false;
_reason = "";

_classnametmp = _classname;

_requireplot = DZE_requireplot;
_isAllowedUnderGround = 0;
if(_classname in DZE_Origins_Stronghold) then {
	_offset = [0,30,0];
} else {
	_offset = [0,10,0];
};
_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
	_distance = DZE_PlotPole select 1;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

// If item is plot pole && another one exists within 200m
if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(format [localize "str_epoch_player_44", DZE_PlotPole select 1]) , "PLAIN DOWN"]; };

// If item is plot pole && a safezone is within 500meters
_IsNearSafezone = count(nearestObjects[player, ["Sign_sphere100cm_EP1"], 600]);
if(_isPole && _IsNearSafezone > 0) exitWith { DZE_ActionInProgress = false; cutText ["You must be more than 600meters away from a safezone to place a plot pole.","PLAIN DOWN"]; };

if(_IsNearPlot == 0) then {
	// Allow building of plot
	if(_requireplot == 0 || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};
} else {
	// check nearby plots ownership && then for friend status
	_nearestPole = _findNearestPole select 0;

	// Find owner
	if(DZE_Use_PlotPole4Life) then {
		_playerID = getPlayerUID player;
		_ownerID = _nearestPole getVariable ["ownerPUID","0"];
	} else {
		_playerID = dayz_characterID;
		_ownerID = _nearestPole getVariable ["CharacterID","0"];
	};
	// check if friendly to owner
	if(_playerID == _ownerID) then {  //Keep ownership
		// owner can build anything within his plot except other plots
		if(!_isPole) then {
			_canBuildOnPlot = true;
		};
	} else {
		// disallow building plot
		if(!_isPole) then {
			_friendlies		= player getVariable ["friendlyTo",[]];
			// check if friendly to owner
			if(_ownerID in _friendlies) then {
				_canBuildOnPlot = true;
			};
		};
	};
};

// _message
if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };

_require = DZE_Origins_Build_Tools_Require;
_missing = "";
_hasrequireditem = true;
{
	_hastoolweapon = _x in weapons player;
	if(!_hastoolweapon) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); };
} count _require;

if (!_hasrequireditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_137"),_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem) then {
	_location = [0,0,0];
	_isOk = true;

	// get inital players position
	_location1 = getPosATL player;
	_dir = getDir player;

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	_object attachTo [player,_offset];
	_position = getPosATL _object;
	cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];
	_objHDiff = 0;

	while {_isOk} do {

		_zheightchanged = false;
		_zheightdirection = "";
		_rotate = false;

		if (DZE_Q) then {
			DZE_Q = false;
			_zheightdirection = "up";
			_zheightchanged = true;
		};
		if (DZE_Z) then {
			DZE_Z = false;
			_zheightdirection = "down";
			_zheightchanged = true;
		};
		if (DZE_Q_alt) then {
			DZE_Q_alt = false;
			_zheightdirection = "up_alt";
			_zheightchanged = true;
		};
		if (DZE_Z_alt) then {
			DZE_Z_alt = false;
			_zheightdirection = "down_alt";
			_zheightchanged = true;
		};
		if (DZE_Q_ctrl) then {
			DZE_Q_ctrl = false;
			_zheightdirection = "up_ctrl";
			_zheightchanged = true;
		};
		if (DZE_Z_ctrl) then {
			DZE_Z_ctrl = false;
			_zheightdirection = "down_ctrl";
			_zheightchanged = true;
		};
		if (DZE_4) then {
			_rotate = true;
			DZE_4 = false;
			_dir = 180;
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			_dir = 0;
		};

		if(_rotate) then {
			_object setDir _dir;
			_object setPosATL _position;
			//diag_log format["DEBUG Rotate BUILDING POS: %1", _position];
		};

		if(_zheightchanged) then {
			detach _object;

			_position = getPosATL _object;

			if(_zheightdirection == "up") then {
				_position set [2,((_position select 2)+0.1)];
				_objHDiff = _objHDiff + 0.1;
			};
			if(_zheightdirection == "down") then {
				_position set [2,((_position select 2)-0.1)];
				_objHDiff = _objHDiff - 0.1;
			};

			if(_zheightdirection == "up_alt") then {
				_position set [2,((_position select 2)+1)];
				_objHDiff = _objHDiff + 1;
			};
			if(_zheightdirection == "down_alt") then {
				_position set [2,((_position select 2)-1)];
				_objHDiff = _objHDiff - 1;
			};

			if(_zheightdirection == "up_ctrl") then {
				_position set [2,((_position select 2)+0.01)];
				_objHDiff = _objHDiff + 0.01;
			};
			if(_zheightdirection == "down_ctrl") then {
				_position set [2,((_position select 2)-0.01)];
				_objHDiff = _objHDiff - 0.01;
			};

			_object setDir (getDir _object);

			if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
				_position set [2,0];
			};

			_object setPosATL _position;

			//diag_log format["DEBUG Change BUILDING POS: %1", _position];

			_object attachTo [player];

		};

		sleep 0.5;

		_location2 = getPosATL player;

		if(DZE_5) exitWith {
			_isOk = false;
			detach _object;
			_dir = getDir _object;
			_position = getPosATL _object;
			//diag_log format["DEBUG BUILDING POS: %1", _position];
			deleteVehicle _object;
		};

		if(_location1 distance _location2 > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "You've moved to far away from where you started building (within 5 meters)";
			detach _object;
			deleteVehicle _object;
		};

		if(abs(_objHDiff) > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cannot move up || down more than 5 meters";
			detach _object;
			deleteVehicle _object;
		};

		if (player getVariable["combattimeout", 0] >= time) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = (localize "str_epoch_player_43");
			detach _object;
			deleteVehicle _object;
		};

		if (DZE_cancelBuilding) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cancelled building.";
			detach _object;
			deleteVehicle _object;
		};
	};

	//No building on roads unless toggled
	if (!DZE_BuildOnRoads) then {
		if (isOnRoad [(_position Select 0),(_position Select 1),0] || isOnRoad [(_position Select 0)+3,(_position Select 1),0] || isOnRoad [(_position Select 0)-3,(_position Select 1),0] || isOnRoad [(_position Select 0),(_position Select 1)+3,0] || isOnRoad [(_position Select 0),(_position Select 1)-3,0] || isOnRoad [(_position Select 0)+3,(_position Select 1)+3,0] || isOnRoad [(_position Select 0)-3,(_position Select 1)-3,0] || isOnRoad [(_position Select 0)-3,(_position Select 1)+3,0] || isOnRoad [(_position Select 0)+3,(_position Select 1)-3,0]) then {
			_cancel = true;
			_reason = "Cannot build this close to or over a road.";
		};
	};
	//No building more than 40 meters tall (No Power Towers)
	if ((_position Select 2) > 40) then {
		_cancel = true;
		_reason = "Cannot build structures more than 40meters tall."
	};

	// No building in trader zones
	if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };

	if(!_cancel) then {

		_classname = _classnametmp;

		// Start Build
		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

		_tmpbuilt setdir _dir;

		// Get position based on object
		_location = _position;

		if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setPosATL _location;
		if((_location select 2) < 0.25) then {
			_tmpbuilt setVectorUp surfaceNormal position _tmpbuilt;
		};
		_location = getPosATL _tmpbuilt;

		cutText [format[(localize "str_epoch_player_138"),_name], "PLAIN DOWN"];

		_limit = 3;

		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		}
		else {
			if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
			};
		};

		_isOk = true;
		_proceed = false;
		_counter = 0;

		while {_isOk} do {

			[10,10] call dayz_HungerThirst;
			player playActionNow "Medic";

			_dis=20;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

			r_interrupt = false;
			r_doLoop = true;
			_started = false;
			_finished = false;

			while {r_doLoop} do {
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then {
					_started = true;
				};
				if (_started && !_isMedic) then {
					r_doLoop = false;
					_finished = true;
				};
				if (r_interrupt || (player getVariable["combattimeout", 0] >= time)) then {
					r_doLoop = false;
				};
				if (DZE_cancelBuilding) exitWith {
					r_doLoop = false;
				};
				sleep 0.1;
			};
			r_doLoop = false;


			if(!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};

			if(_finished) then {
				_counter = _counter + 1;
			};

			cutText [format[(localize "str_epoch_player_139"),_name, _counter,_limit], "PLAIN DOWN"];

			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};

		};

		if (_proceed) then {
			cutText [format[localize "str_build_01",_name], "PLAIN DOWN"];

			if (_isPole) then {
				[] spawn player_plotPreview;
			};

			if(_classname in DZE_Origins_Stronghold) then {
				private["_combination_1","_combination_2","_combination_3","_combination_4","_combination_5","_combination_6"];
				_combination = "";
				_combination_1 = ceil(random 9);
				while {_combination_1 == 0} do {
					_combination_1 = ceil (random 9);
				};
				_combination_2 = ceil(random 9);
				_combination_3 = ceil(random 9);
				_combination_4 = ceil(random 9);
				_combination_5 = ceil(random 9);
				_combination_6 = ceil(random 9);
				_combination = format["%1%2%3%4%5%6",_combination_1,_combination_2,_combination_3,_combination_4,_combination_5,_combination_6];
				dayz_combination = _combination;
			
			};
			_tmpbuilt setVariable ["OEMPos",_location,true];
			_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];
			_tmpbuilt setVariable ["OwnerUID",_playerUID, true];
			_tmpbuilt setVariable ["OwnerName",_playerName, true];
			_activatingPlayer = player;
				
			_proceed = [_crate,_neededMaterials] call origins_checkNeededMaterial;
			if(_proceed) then {
				switch (_houselevel) do {
					case 'B1' : {
						owner_B1 set [count owner_B1, _playerUID];
						publicVariable "owner_B1";
						player setVariable["DZE_Origins_Level1",true,true];
					};
					case 'B2' : {
						owner_B2 set [count owner_B2, _playerUID];
						publicVariable "owner_B2";
						player setVariable["DZE_Origins_Level2",true,true];
					};
					case 'B3' : {
						owner_B3 set [count owner_B3, _playerUID];
						publicVariable "owner_B3";
						player setVariable["DZE_Origins_Level3",true,true];
					};
					case 'H1' : {
						owner_H1 set [count owner_H1, _playerUID];
						publicVariable "owner_H1";
						player setVariable["DZE_Origins_Level1",true,true];
					};
					case 'H2' : {
						owner_H2 set [count owner_H2, _playerUID];
						publicVariable "owner_H2";
						player setVariable["DZE_Origins_Level2",true,true];
					};
					case 'H3' : {
						owner_H3 set [count owner_H3, _playerUID];
						publicVariable "owner_H3";
						player setVariable["DZE_Origins_Level3",true,true];
					};
					case 'SGH';
					case 'SGB' : {
						owner_SG set [count owner_SG, _playerUID];
						publicVariable "owner_SG";
						player setVariable["DZE_Origins_SG",true,true];
					};
					case 'LGH';
					case 'LGB' : {
						owner_LG set [count owner_LG, _playerUID];
						publicVariable "owner_LG";
						player setVariable["DZE_Origins_LG",true,true];
					};
					case 'KINGH';
					case 'KINGB' : {
						owner_KING set [count owner_KING, _playerUID];
						publicVariable "owner_KING";
						player setVariable["DZE_Origins_KING",true,true];
					};
					case 'SHH';
					case 'SHB' : {
						owner_SH set [count owner_SH, _playerUID];
						publicVariable "owner_SH";
						player setVariable["DZE_Origins_SH",true,true];
					};
				};
				if(_classname in DZE_Origins_Stronghold) then {
					PVDZE_veh_Publish = [_tmpbuilt,[_dir,_location],_classname,true,_combination,_activatingPlayer];
					publicVariableServer  "PVDZE_veh_Publish";
					cutText [format[(localize "str_epoch_player_140"),_combination,_name], "PLAIN DOWN", 5];
				} else {
					PVDZE_veh_Publish = [_tmpbuilt,[_dir,_location],_classname,true,_charID,_activatingPlayer];
					publicVariableServer  "PVDZE_veh_Publish";
					cutText [format["Nice one! You now have a %1", _name], "PLAIN DOWN",5];
				};
				clearWeaponCargoGlobal  _crate;
				clearMagazineCargoGlobal  _crate;
				clearBackpackCargoGlobal _crate;
				
				_objectID = _crate getVariable["ObjectID","0"];
				_objectUID = _crate getVariable["ObjectUID","0"];
				PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
				publicVariableServer "PVDZE_obj_Delete";
				if (isServer) then {
					PVDZE_obj_Delete call server_deleteObj;
				};
				deleteVehicle _crate; 
			} else {
				deleteVehicle _tmpbuilt;
			};

		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};

			deleteVehicle _tmpbuilt;

			cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
		};

	} else {
		cutText [format[(localize "str_epoch_player_47"),_name,_reason], "PLAIN DOWN"];
	};
};

DZE_ActionInProgress = false;
