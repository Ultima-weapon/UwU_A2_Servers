scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private ["_isWreckBuilding","_temp_keys","_magazinesPlayer","_isPZombie","_vehicle","_inVehicle","_hasFuelE","_hasRawMeat","_hasKnife","_hasToolbox","_onLadder","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_traderType","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_Unlock","_lock","_buy","_dogHandle","_lieDown","_warn","_hastinitem","_allowedDistance","_menu","_menu1","_humanity_logic","_low_high","_cancel","_metals_trader","_traderMenu","_isWreck","_isRemovable","_isDisallowRepair","_rawmeat","_humanity","_speed","_dog","_hasbottleitem","_isAir","_isShip","_playersNear","_findNearestGens","_findNearestGen","_IsNearRunningGen","_cursorTarget","_isnewstorage","_itemsPlayer","_ownerKeyId","_typeOfCursorTarget","_hasKey","_oldOwner","_combi","_key_colors","_player_deleteBuild","_player_flipveh","_player_lockUnlock_crtl","_player_butcher","_player_studybody","_player_cook","_player_boil","_hasFuelBarrelE","_hasHotwireKit","_player_SurrenderedGear","_isSurrendered","_isModular","_isModularDoor","_ownerKeyName","_temp_keys_names","_hasAttached","_allowTow","_liftHeli","_found","_posL","_posC","_height","_liftHelis","_attached","_playerUID","_characterID","_plotDistance","_PlotsNear", "_classname","_isowner","_hasNOSinstalled","_isaCar","_hasnositems","_side","_string","_isPlotPole"];

if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.

_vehicle = vehicle player;
_isPZombie = player isKindOf "PZombie_VB";
_inVehicle = (_vehicle != player);
_cursorTarget = cursorTarget;
_side = side _cursorTarget == west; //so only Players can be detained
_string = "ItemWire" in magazines player;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
_weapons = [currentWeapon player] + (weapons player) + (magazines player);
_mags = magazines player;

if(_cursorTarget isKindOf "AllVehicles") then {
	_cursorTarget addEventHandler ["GetIn", {
	if (_this select 0 getVariable ["MFTowInTow", false]) then {
		player action ["eject", _this select 0];
		cutText [format["Can`t sit in a car if car towing"], "PLAIN DOWN"];
	};}];
};

//Nitro action
_hasNOSinstalled = _vehicle getVariable["nitroinstalled",0];
if (_inVehicle and _vehicle isKindOf "Car" and speed _vehicle >= 1) then {
	if (_inVehicle and _hasNOSinstalled == 1) then {
		if (isnil("NITRO_Cond")) then {NITRO_Cond = false;};
		if (s_player_nitrobooston <0) then {
			if (NITRO_Cond) then {
				s_player_nitrobooston = _vehicle addAction [("<t color=""#39C1F3"">" + ("Nitro Off") + "</t>"),"custom\addons\NOS\nitro.sqf", [_vehicle], 999, false,true,"","driver _target == _this"];
			} else {
				s_player_nitrobooston = _vehicle addAction [("<t color=""#39C1F3"">" + ("Nitro On") + "</t>"),"custom\addons\NOS\nitro.sqf", [_vehicle], 999, false,true,"","driver _target == _this"];
			};
		};
	} else {
		_vehicle removeAction s_player_nitrobooston;
		s_player_nitrobooston = -1;
	};
} else {
	_vehicle removeAction s_player_nitrobooston;
	s_player_nitrobooston = -1;
	if (_hasNOSinstalled == 1) then {
		_vehicle setVariable ["nitroinstalled", 1, true];
	};
};

// Krixes Self Bloodbag
if ("ItemBloodbag" in _mags) then {
	hasBagItem = true;
} else { hasBagItem = false;};
if((speed player <= 1) && hasBagItem && _canDo) then {
	if (s_player_selfBloodbag < 0) then {
		s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"custom\actions\player_selfbloodbag.sqf","",5,false,true,"", ""];
	};
} else {
	player removeAction s_player_selfBloodbag;
	s_player_selfBloodbag = -1;
};

_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;
if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};

//Grab Flare
if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

#include "compile\animatedVehicles.sqf"

if (DZE_HeliLift) then {
	_hasAttached = _vehicle getVariable["hasAttached",false];
	if(_inVehicle && (_vehicle isKindOf "Air") && ((([_vehicle] call FNC_getPos) select 2) < 30) && (speed _vehicle < 5) && (typeName _hasAttached == "OBJECT")) then {
		if (s_player_heli_detach < 0) then {
			dayz_myLiftVehicle = _vehicle;
			s_player_heli_detach = dayz_myLiftVehicle addAction ["Detach Vehicle","\z\addons\dayz_code\actions\player_heliDetach.sqf",[dayz_myLiftVehicle,_hasAttached],2,false,true,"",""];
		};
	} else {
		dayz_myLiftVehicle removeAction s_player_heli_detach;
		s_player_heli_detach = -1;
	};
};

// Earplugs
if (_inVehicle && (!Earplugs)) then {
    if (s_player_put_earplugs_on < 0) then {
        airvehicle = _vehicle;
        s_player_put_earplugs_on = airvehicle addAction ["Earplugs on","custom\addons\Earplugs\earplugs_on.sqf","",5,false,true];
    };
        } else {
            if (!isNil "airvehicle") then {
                airvehicle removeAction s_player_put_earplugs_on;
                s_player_put_earplugs_on = -1;
            };
        };
    
if (_inVehicle && (Earplugs)) then {
    if (s_player_put_earplugs_off < 0) then {
        airvehicle = _vehicle;
        s_player_put_earplugs_off = airvehicle addAction ["Earplugs off","custom\addons\Earplugs\earplugs_off.sqf","",5,false,true];
    };
        } else {
            if (!isNil "airvehicle") then {
                airvehicle removeAction s_player_put_earplugs_off;
                s_player_put_earplugs_off = -1;

            };

        };

if(DZE_HaloJump) then {
	if(_inVehicle && (_vehicle isKindOf "Air") && ((([_vehicle] call FNC_getPos) select 2) > 400)) then {
		if (s_halo_action < 0) then {
			DZE_myHaloVehicle = _vehicle;
			s_halo_action = DZE_myHaloVehicle addAction [localize "STR_EPOCH_ACTIONS_HALO","\z\addons\dayz_code\actions\halo_jump.sqf",[],2,false,true,"",""];
		};
	} else {
		DZE_myHaloVehicle removeAction s_halo_action;
		s_halo_action = -1;
	};
};

if (!DZE_ForceNameTagsOff) then {
	if (s_player_showname < 0 && !_isPZombie) then {
		if (DZE_ForceNameTags) then {
			s_player_showname = 1;
			player setVariable["DZE_display_name",true,true];
		} else {
			s_player_showname = player addAction [localize "STR_EPOCH_ACTIONS_NAMEYES", "\z\addons\dayz_code\actions\display_name.sqf",true, 0, true, false, "",""];
			s_player_showname1 = player addAction [localize "STR_EPOCH_ACTIONS_NAMENO", "\z\addons\dayz_code\actions\display_name.sqf",false, 0, true, false, "",""];
		};
	};
};

if(DZE_Origins_Building_System) then {
    if(isnil "s_player_build_origins_house") then {s_player_build_origins_house = -1;};
    if(isnil "s_player_build_origins_garage") then {s_player_build_origins_garage = -1;};
    if(isnil "s_player_build_origins_stronghold") then {s_player_build_origins_stronghold = -1;};
    if(isnil "s_player_origins_unlock") then {s_player_origins_unlock = -1;};
    if(isnil "s_player_origins_stronghold_doors") then {s_player_origins_stronghold_doors = -1;};
    _cursorTarget = cursorTarget;
    if (!isNull _cursorTarget) then {
        _typeOfCursorTarget = (typeOf _cursorTarget);
        if(_typeOfCursorTarget == DZE_Origins_Container ) then {
            if((player distance _cursorTarget) < DZE_Origins_Build_Distance) then {
                private["_humanity","_playerUID","_hasLevel1","_hasLevel2","_hasLevel3","_hasSG","_hasLG","_hasKING","_hasSH","_canBuildHouse","_houselevel","_humanityNeed","_actionText","_classname","_neededMaterials","_canBuildSH","_canBuildGarage"];
                _humanity = player getVariable["humanity",0];
                _playerUID = [player] call FNC_GetPlayerUID;
                _hasLevel1 = (_playerUID in owner_H1 || _playerUID in owner_B1);
                _hasLevel2 = (_playerUID in owner_H2 || _playerUID in owner_B2);
                _hasLevel3 = (_playerUID in owner_H3 || _playerUID in owner_B3);
                _hasSG = (_playerUID in owner_SG);
                _hasLG = (_playerUID in owner_LG);
                _hasKING = (_playerUID in owner_KING);
                _hasSH = (_playerUID in owner_SH);
                {
                    _houselevel = _x select 0;
                    _humanityNeed = _x select 1;
                    _actionText = _x select 2;
                    _classname = _x select 3;
                    _neededMaterials = _x select 4;
                    _canBuildHouse = false;
                    _canBuildGarage = false;
                    _canBuildSH = false;
                    if((_humanityNeed > 0 && _humanity >= _humanityNeed) || (_humanityNeed < 0 && _humanity <= _humanityNeed)) then {
                        if(_houselevel in ["H1","B1"] && !_hasLevel1) then {
                            _canBuildHouse = true;
                        };
                        if(_houselevel in ["H2","B2"] && !_hasLevel2) then {
                            _canBuildHouse = true;
                        };
                        if(_houselevel in ["H3","B3"] && !_hasLevel3) then {
                            _canBuildHouse = true;
                        };
                        if(_houselevel in ["SGH","SGB"] && _hasLevel1 && !_hasSG) then {
                            _canBuildGarage = true;
                        };
                        if(_houselevel in ["LGH","LGB"] && _hasLevel3 && !_hasLG) then {
                            _canBuildGarage = true;
                        };
                        if(_houselevel in ["KINGH","KINGB"] && _hasLevel3 && _hasLG && !_hasKING) then {
                            _canBuildGarage = true;
                        }; 
                        if(_houselevel in ["SHH","SHB"] && _hasLevel1 && _hasLevel2 && _hasLevel3 && !_hasSH) then {
                            _canBuildSH = true;
                        };
                    };
                    if(_canBuildHouse) then {
                        if(s_player_build_origins_house < 0) then {
                            s_player_build_origins_house = player addAction ["Build " + _actionText, "custom\origins\player_build.sqf", [_cursorTarget, _houselevel, _classname, _neededMaterials, _actionText]];
                        };
                    };
                    if(_canBuildGarage) then {
                        if(s_player_build_origins_garage < 0) then {
                            s_player_build_origins_garage = player addAction ["Build " + _actionText, "custom\origins\player_build.sqf", [_cursorTarget, _houselevel, _classname, _neededMaterials, _actionText]];
                        };
                    };
                    if(_canBuildSH) then {
                        if(s_player_build_origins_stronghold < 0) then {
                            s_player_build_origins_stronghold = player addAction ["Build " + _actionText, "custom\origins\player_build.sqf", [_cursorTarget, _houselevel, _classname, _neededMaterials, _actionText]];
                        };
                    };
                } forEach DZE_Origins_Build_HousesGarages;
            } else {
                [1] call origins_removeActions;
            };
        };
        if(_typeOfCursorTarget in DZE_Origins_Buildings && (player distance _cursorTarget) < DZE_Origins_LockUnlock_Distance) then {
            private["_ownerUID","_ownerName","_playerUID","_state","_openClose"];
            _playerUID = [player] call FNC_GetPlayerUID;
            _ownerUID = _cursorTarget getVariable ["OwnerUID","0"];
            _ownerName = _cursorTarget getVariable ["OwnerName","0"];
            if(_playerUID != _ownerUID && !(_playerUID in DoorAdminList) && !(_typeOfCursorTarget in DZE_Origins_Stronghold)) exitWith {
                cutText [format["This house was built by %1", _ownerName], "PLAIN DOWN",5];
                sleep 5;
            };
            _state = (_cursorTarget getVariable ["CanBeUpdated",false]);
            if(_typeOfCursorTarget in DZE_Origins_Stronghold && _state) then {
                private["_strongholdDoorsOpen"];
                _strongholdDoorsOpen = (_cursorTarget getVariable ["DoorsOpen",false]);
                if(_strongholdDoorsOpen) then {
                    if(s_player_origins_stronghold_doors < 0) then {
                        s_player_origins_stronghold_doors = player addAction [ "Close Doors","custom\origins\origins_strongholdDoors.sqf",[_cursorTarget,0]];
                    };
                } else {
                    if(s_player_origins_stronghold_doors < 0)then {
                        s_player_origins_stronghold_doors = player addAction [ "Open Doors","custom\origins\origins_strongholdDoors.sqf",[_cursorTarget,1]];
                    };
                };
            } else {
                player removeAction s_player_origins_stronghold_doors;
				s_player_origins_stronghold_doors = -1;
            };
            if(s_player_origins_unlock < 0) then {
                _matched = false;
                {
                    if(_typeOfCursorTarget == (_x select 0)) then {
                        if(_state) then {
                            _openClose = format["Lock %1", _X select 1];
                        } else {
                            _openClose = format["Unlock %1", _X select 1];
                        };
                        _matched = true;
                    };
                    if (_matched) exitWith {
                        s_player_origins_unlock = player addAction [_openClose, "custom\origins\player_lockUnlock.sqf", [_cursorTarget,_typeOfCursorTarget,_state]];
                    };
                } count DZE_Origins_NameLookup;
            };
        } else {
            player removeAction s_player_origins_unlock;
            s_player_origins_unlock = -1;
        };
    } else {
        player removeAction s_player_origins_unlock;
        s_player_origins_unlock = -1;
    };
};

if(_isPZombie) then {
	if (s_player_callzombies < 0) then {
		s_player_callzombies = player addAction [localize "STR_EPOCH_ACTIONS_RAISEHORDE", "\z\addons\dayz_code\actions\call_zombies.sqf",player, 5, true, false, "",""];
	};
	if (DZE_PZATTACK) then {
		call pz_attack;
		DZE_PZATTACK = false;
	};
	if (s_player_pzombiesvision < 0) then {
		s_player_pzombiesvision = player addAction [localize "STR_EPOCH_ACTIONS_NIGHTVIS", "\z\addons\dayz_code\actions\pzombie\pz_vision.sqf", [], 4, false, true, "nightVision", "_this == _target"];
	};
	if (!isNull cursorTarget && (player distance cursorTarget < 3)) then {	//Has some kind of target
		_isAnimal = cursorTarget isKindOf "Animal";
		_isZombie = cursorTarget isKindOf "zZombie_base";
		_isHarvested = cursorTarget getVariable["meatHarvested",false];
		_isMan = cursorTarget isKindOf "Man";
		// Pzombie Gut human corpse || animal
		if (!alive cursorTarget && (_isAnimal || _isMan) && !_isZombie && !_isHarvested) then {
			if (s_player_pzombiesfeed < 0) then {
				s_player_pzombiesfeed = player addAction [localize "STR_EPOCH_ACTIONS_FEED", "\z\addons\dayz_code\actions\pzombie\pz_feed.sqf",cursorTarget, 3, true, false, "",""];
			};
		} else {
			player removeAction s_player_pzombiesfeed;
			s_player_pzombiesfeed = -1;
		};
	} else {
		player removeAction s_player_pzombiesfeed;
		s_player_pzombiesfeed = -1;
	};
};

// Increase distance only if AIR || SHIP
_allowedDistance = 4;
_isAir = cursorTarget isKindOf "Air";
_isShip = cursorTarget isKindOf "Ship";
if(_isAir || _isShip) then {
	_allowedDistance = 8;
};

if (!isNull cursorTarget && !_inVehicle && !_isPZombie && (player distance cursorTarget < _allowedDistance) && _canDo) then {	//Has some kind of target

	// set cursortarget to variable
	_cursorTarget = cursorTarget;

	// get typeof cursortarget once
	_typeOfCursorTarget = typeOf _cursorTarget;

	// hintsilent _typeOfCursorTarget;

	_isVehicle = _cursorTarget isKindOf "AllVehicles";
	_isVehicletype = _typeOfCursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isnewstorage = _typeOfCursorTarget in DZE_isNewStorage;
	
	// get items && magazines only once
	_magazinesPlayer = magazines player;

	//boiled Water
	_hasbottleitem = "ItemWaterbottle" in _magazinesPlayer;
	_hastinitem = false;
	{
		if (_x in _magazinesPlayer) then {
			_hastinitem = true;
		};
	} count boil_tin_cans;
	_hasFuelE = 	"ItemJerrycanEmpty" in _magazinesPlayer;
	_hasFuelBarrelE = 	"ItemFuelBarrelEmpty" in _magazinesPlayer;
	_hasHotwireKit = 	"ItemHotwireKit" in _magazinesPlayer;

	_itemsPlayer = items player;
	
	_temp_keys = [];
	_temp_keys_names = [];
	// find available keys
	_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
	{
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _key_colors) then {
			_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
			_ownerKeyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_temp_keys_names set [_ownerKeyId,_ownerKeyName];
			_temp_keys set [count _temp_keys,str(_ownerKeyId)];
		};
	} count _itemsPlayer;

	_hasKnife = 	"ItemKnife" in _itemsPlayer;
	_hasToolbox = 	"ItemToolbox" in _itemsPlayer;

	if (DZE_APlotforLife) then {
		_playerUID = [player] call FNC_GetPlayerUID;
	}else{
		_playerUID = dayz_characterID;
	};
	
	_isMan = _cursorTarget isKindOf "Man";
	_traderType = _typeOfCursorTarget;
	_ownerID = _cursorTarget getVariable ["ownerPUID","0"];
	_characterID = _cursorTarget getVariable ["CharacterID","0"];
	_isAnimal = _cursorTarget isKindOf "Animal";
	_isDog =  (_cursorTarget isKindOf "DZ_Pastor" || _cursorTarget isKindOf "DZ_Fin");
	_isZombie = _cursorTarget isKindOf "zZombie_base";
	_isDestructable = _cursorTarget isKindOf "BuiltItems";
	_isWreck = _typeOfCursorTarget in DZE_isWreck;
	_isWreckBuilding = _typeOfCursorTarget in DZE_isWreckBuilding;
	_isModular = (_cursorTarget isKindOf "ModularItems") or ((typeOf _cursorTarget) in Custom_Buildables);
	_isModularDoor = _typeOfCursorTarget in ["Land_DZE_WoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_GarageWoodDoor","CinderWallDoor_DZ","CinderWallDoorSmall_DZ"];
	_isPlotPole = _typeOfCursorTarget in ["Plastic_Pole_EP1_DZ"];

	_isRemovable = _typeOfCursorTarget in DZE_isRemovable;
	_isDisallowRepair = _typeOfCursorTarget in ["M240Nest_DZ"];

	_isTent = _cursorTarget isKindOf "TentStorage";
	
	_isAlive = alive _cursorTarget;
	
	_text = getText (configFile >> "CfgVehicles" >> _typeOfCursorTarget >> "displayName");
	
	_rawmeat = meatraw;
	_hasRawMeat = false;
	{
		if (_x in _magazinesPlayer) then {
			_hasRawMeat = true;
		};
	} count _rawmeat; 
	
	_isFuel = false;
	if (_hasFuelE || _hasFuelBarrelE) then {
		{
			if(_cursorTarget isKindOf _x) exitWith {_isFuel = true;};
		} count dayz_fuelsources;
	};

	// diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));
	
	// logic vars
	_player_flipveh = false;
	_player_deleteBuild = false;
	_player_lockUnlock_crtl = false;

	// VIRTUAL GARAGE START
	private ["_garageowner","_garagefriends","_garageallowed","_friend","_garageadminList"];
	_garageadminList = DoorAdminList;
	_garageowner = _cursorTarget getVariable ["ownerPUID","0"]; //<-- We get the PUID of the owner. Here with P4L
	_friend = _cursorTarget getVariable ["GarageFriends",[]];
	_garagefriends = [];
	{
		_garagefriends set [count _garagefriends,(_x select 0)];
	} count _friend;
	_garageallowed = [_garageowner] + _garagefriends + _garageadminList;
	if ((_typeOfCursorTarget in DZE_Garage) && (speed player <= 1) && _canDo) then {
		if (s_player_garage < 0) then {
			if ((getPlayerUID player) in _garageallowed) then {
				s_player_garage =  player addAction ["<t color='#FFAA00'>Garage Menu</t>", "custom\addons\Garage\player_virtualgarage.sqf", _cursorTarget, 2, false];
			} else {
				s_player_garage = player addAction ["<t color='#FF0000'>Garage Locked</t>", "",_cursorTarget, 2, true, true, "", ""];   
			};
		};
	} else {
		player removeAction s_player_garage;
		s_player_garage = -1;       
	};
	// VIRTUAL GARAGE END
	
	 if (_canDo && (speed player <= 1) && (_cursorTarget isKindOf "Plastic_Pole_EP1_DZ")) then {
		 if (s_player_plotManagement < 0) then {
			_adminList = DoorAdminList; // Add admins here if you admins to able to manage all plotpoles
			_owner = _cursorTarget getVariable ["ownerPUID","0"];
			_friends = _cursorTarget getVariable ["plotfriends", []];
			_fuid = [];
			{
				_friendUID = _x select 0;
				_fuid = _fuid + [_friendUID];
			} forEach _friends;
			_allowed = [_owner];    
			_allowed = [_owner] + _adminList + _fuid;
			if((getPlayerUID player) in _allowed)then{            
			s_player_plotManagement = player addAction ["<t color='#0059FF'>Manage Plot</t>", "custom\actions\initPlotManagement.sqf", [], 5, false];
			};
		};
		 
		 if (s_player_maintain_area < 0) then {
		  	s_player_maintain_area = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_MAINTAREA"], "\z\addons\dayz_code\actions\maintain_area.sqf", "maintain", 5, false];
		 	s_player_maintain_area_preview = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_MAINTPREV"], "\z\addons\dayz_code\actions\maintain_area.sqf", "preview", 5, false];
		 };
		 
		_plotDistance = ((DZE_PlotPole select 0)+3);
		_PlotsmarkersNear = count (_cursorTarget nearEntities ["Land_coneLight", _PlotDistance]);

		if (s_player_plot_boundary_on < 0) then {
			If (_PlotsmarkersNear == 0 ) then{
				s_player_plot_boundary_on = player addAction ["Show plot boundary", "custom\actions\object_showPlotRadius.sqf", "", 1, false];
			};
		 };	
		 if (s_player_plot_boundary_off < 0) then {
			If (_PlotsmarkersNear > 0 ) then{
				s_player_plot_boundary_off = player addAction ["Remove plot boundary", "custom\actions\object_removePlotRadius.sqf", "", 1, false];
			};
		};
		if (s_player_plot_take_ownership < 0) then {
			if (DZE_PlotOwnership) then {
				_isowner = [player, _cursorTarget] call FNC_check_owner;
				If (( _isowner select 0 )) then{
					s_player_plot_take_ownership = player addAction ["Take plot items ownership", "custom\actions\plot_take_ownership.sqf", "", 1, false];
				};
			};
		};
	 } else {
	 	player removeAction s_player_plotManagement;
		s_player_plotManagement = -1;
   		player removeAction s_player_maintain_area;
   		s_player_maintain_area = -1;
   		player removeAction s_player_maintain_area_preview;
   		s_player_maintain_area_preview = -1;
		player removeAction s_player_plot_boundary_on;
		s_player_plot_boundary_on = -1;
		player removeAction s_player_plot_boundary_off;
		s_player_plot_boundary_off = -1;
		player removeAction s_player_plot_take_ownership;
		s_player_plot_take_ownership = -1;
	 };

	// CURSOR TARGET ALIVE
	if(_isAlive) then {
		
		//Allow player to delete objects
		if(_isDestructable || _isWreck || _isRemovable || _isWreckBuilding) then {
			if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
				_player_deleteBuild = true;
			};
		};
		
		///Allow owners to delete modulars
		if(_isModular && !(_isPlotPole)) then {
			if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
				_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
				_IsNearPlot = count (_findNearestPoles);
				_fuid  = [];
				_allowed = [];
				if(_IsNearPlot > 0)then{
					_thePlot = _findNearestPoles select 0;
					_adminList = DoorAdminList;
					_owner =  _thePlot getVariable ["ownerPUID","010"];
					_friends = _thePlot getVariable ["plotfriends", []];
					{
					  _friendUID = _x select 0;
					  _fuid  =  _fuid  + [_friendUID];
					} forEach _friends;
					_allowed = [_owner];    
					_allowed = [_owner] +  _fuid + _adminList;	
					if ( _playerUID in _allowed && _ownerID in _allowed ) then {  
						_player_deleteBuild = true;
					};					
				}else{
					if(_ownerID == _playerUID)then{
						_player_deleteBuild = true;
					};
				};						                  
			};
		};
		//Allow owners to delete modular doors without locks
		if(_isModularDoor) then {
			if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {			
				_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
				_IsNearPlot = count (_findNearestPoles);
				_fuid  = [];
				_allowed = [];
				if(_IsNearPlot > 0)then{
					_thePlot = _findNearestPoles select 0;
					_adminList = DoorAdminList;
					_owner =  _thePlot getVariable ["ownerPUID","010"];
					_friends = _thePlot getVariable ["plotfriends", []];
					{
					  _friendUID = _x select 0;
					  _fuid  =  _fuid  + [_friendUID];
					} forEach _friends;
					_allowed = [_owner];    
					_allowed = [_owner] +  _fuid + _adminList;	
					if ( _playerUID in _allowed && _ownerID in _allowed) then {
						_player_deleteBuild = true;
					};					
				}else{
					if(_ownerID == _playerUID)then{
						_player_deleteBuild = true;
					};
				};								
			};      
		};
	
		// CURSOR TARGET VEHICLE
		if(_isVehicle) then {
			
			//flip vehicle small vehicles by your self && all other vehicles with help nearby
			if (!(canmove _cursorTarget) && (player distance _cursorTarget >= 2) && (count (crew _cursorTarget))== 0 && ((vectorUp _cursorTarget) select 2) < 0.5) then {
				_playersNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]);
				if(_isVehicletype || (_playersNear >= 2)) then {
					_player_flipveh = true;	
				};
			};


			if(!_isMan && _characterID != "0" && !(_cursorTarget isKindOf "Bicycle")) then {
				_player_lockUnlock_crtl = true;
			};

		};
	
	};

	if(_player_deleteBuild) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "custom\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	
	if (DZE_HeliLift) then {
		_liftHeli = objNull;
		_found = false;
	
		_allowTow = false;
		if ((count (crew _cursorTarget)) == 0) then {
			{
				if(!_allowTow) then {
					_allowTow = _cursorTarget isKindOf _x;
				};
			} count DZE_HeliAllowToTow;
		};

		//diag_log format["CREW: %1 ALLOW: %2",(count (crew _cursorTarget)),_allowTow];

		if (_allowTow) then {
			_liftHelis = (position player) nearEntities [DZE_HeliAllowTowFrom, 15];
			{
				if(!_found) then {
					_posL = [_x] call FNC_getPos;
					_posC = [_cursorTarget] call FNC_getPos;
					_height = (_posL select 2) - (_posC select 2);
					_hasAttached = _x getVariable["hasAttached",false];
					if(_height < 15 && _height > 5 && (typeName _hasAttached != "OBJECT")) then {
						if(((abs((_posL select 0) - (_posC select 0))) < 10) && ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
							_liftHeli = _x;
							_found = true;
						};
					};
				};
			} count _liftHelis;
		};

		//diag_log format["HELI: %1 TARGET: %2",_found,_cursorTarget];

		_attached = _cursorTarget getVariable["attached",false];
		if(_found && _allowTow && _canDo && !locked _cursorTarget && !_isPZombie && (typeName _attached != "OBJECT")) then {
			if (s_player_heli_lift < 0) then {
				s_player_heli_lift = player addAction ["Attach to Heli", "\z\addons\dayz_code\actions\player_heliLift.sqf",[_liftHeli,_cursorTarget], -10, false, true, "",""];
			};
		} else {
			player removeAction s_player_heli_lift;
			s_player_heli_lift = -1;
		};
	};
	
	// Allow Owner to lock && unlock vehicle  
	if(_player_lockUnlock_crtl) then {
		if (s_player_lockUnlock_crtl < 0) then {
			_hasKey = _characterID in _temp_keys;
			_oldOwner = (_characterID == dayz_playerUID);
			if(locked _cursorTarget) then {
				if(_hasKey || _oldOwner) then {
					_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "custom\actions\unlock_veh.sqf",[_cursorTarget,(_temp_keys_names select (parseNumber _characterID))], 2, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				} else {
					if(_hasHotwireKit) then {
						_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_HOTWIRE",_text], "\z\addons\dayz_code\actions\hotwire_veh.sqf",_cursorTarget, 2, true, true, "", ""];
					} else {
						_Unlock = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_VEHLOCKED"], "",_cursorTarget, 2, true, true, "", ""];
					};
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				};
			} else {
				if(_hasKey || _oldOwner) then {
					_lock = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "custom\actions\lock_veh.sqf",_cursorTarget, 1, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_lock];
					if (!(_typeOfCursorTarget in ColourVehicles) and !(_cursorTarget isKindOf "StaticWeapon")) then {
						private ["_paint"];
						_paint = player addAction ["Paint", "custom\addons\Paint\player_paint_init.sqf",_cursorTarget, 2, true, true, "", ""];
						s_player_lockunlock set [count s_player_lockunlock,_paint];
					};
					s_player_lockUnlock_crtl = 1;
				};
			};
		};
		 
	} else {
		{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
		s_player_lockUnlock_crtl = -1;
	};

	if(DZE_AllowForceSave) then {
		//Allow player to force save
		if((_isVehicle || _isTent) && !_isMan) then {
			if (s_player_forceSave < 0) then {
				s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_forceSave;
			s_player_forceSave = -1;
		};
	};

	
	
	If(DZE_AllowCargoCheck) then {
		if((_isVehicle || _isTent || _isnewstorage || _typeOfCursorTarget in DZE_Origins_Buildings) && _isAlive && !_isMan && !locked _cursorTarget) then {
			if (s_player_checkGear < 0) then {
				s_player_checkGear = player addAction [localize "STR_EPOCH_PLAYER_CARGO", "\z\addons\dayz_code\actions\cargocheck.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_checkGear;
			s_player_checkGear = -1;
		};
	};
	
	
	//flip vehicle small vehicles by your self && all other vehicles with help nearby
	if(_player_flipveh) then {
		if (s_player_flipveh  < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",_cursorTarget, 1, true, true, "", ""];		
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	}; 
	
	//Allow player to fill jerrycan
	if((_hasFuelE || _hasFuelBarrelE) && _isFuel) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	// logic vars for addactions
	_player_butcher = false;
	_player_studybody = false;
	_player_SurrenderedGear = false;

	// CURSOR TARGET NOT ALIVE
	if (!_isAlive) then {

		// Gut animal/zed
		if((_isAnimal || _isZombie) && _hasKnife) then {
			_isHarvested = _cursorTarget getVariable["meatHarvested",false];
			if (!_isHarvested) then {
				_player_butcher = true;
			};
		};

		// Study body
		if (_isMan && !_isZombie && !_isAnimal) then {
			_player_studybody = true;
		}
	} else {
		// unit alive

		// gear access on surrendered player
		if(_isMan && !_isZombie && !_isAnimal) then {
			_isSurrendered = _cursorTarget getVariable ["DZE_Surrendered",false];
			if (_isSurrendered) then {
				_player_SurrenderedGear = true;
			};
		};
	};


	// Human Gut animal || zombie
	if (_player_butcher) then {
		if (s_player_butcher < 0) then {
			if(_isZombie) then {
				s_player_butcher = player addAction [localize "STR_EPOCH_ACTIONS_GUTZOM", "\z\addons\dayz_code\actions\gather_zparts.sqf",_cursorTarget, 0, true, true, "", ""];
			} else {
				s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};

	// Study Body
	if (_player_studybody) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "custom\actions\study_body.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
	
	// Check Wallet (Single Currency)
	if (_player_studybody || _player_butcher) then {
		if (s_player_checkwallet < 0) then {
			s_player_checkwallet = player addAction [("<t color=""#FF0000"">"+("Check Wallet") + "</t>"), "custom\actions\check_wallet.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_checkwallet;
		s_player_checkwallet = -1;
	};
	
	//Remove CLOTHES
	if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
		if (s_clothes < 0) then {
			s_clothes = player addAction [("" + ("Take Clothes") + ""), "custom\actions\removeclothes.sqf",cursorTarget, 1, false, true, "",""];
		};
	} else {
		player removeAction s_clothes;
		s_clothes = -1;
	};
	
	
	//NUKE
	if (cursorTarget == LAPTOP) then {
		if (player getVariable['humanity', 0] >= 250000 || player getVariable['humanity', 0] <=-250000) then {
			_lap = cursorTarget;
			if (s_player_nuke < 0) then {
				cutText ["You have found what looks like the Presidential 'Football'. It appears like the launch codes have already been entered.","PLAIN DOWN",1];
				s_player_nuke = player addAction [("<t color=""#FF0000"">" + ("Launch Nuke") +"</t>"),"custom\addons\Nuke\nuke_On.sqf",_lap, 5, false, true, "",""];
			};
		} else {
			if (s_player_nuke < 0) then {
				cutText ["You are not a high enough rank to use this device.","PLAIN DOWN",1];
			};
		};
	} else {
		player removeAction s_player_nuke;
		s_player_nuke = -1;
	};

	//--------------------------------------ARREST----------------------------------------------------------------
	if (player getVariable "Detain" == 1) then {
		player removeAction s_player_arrest;
		if (s_player_breakfree < 0) then {
			s_player_breakfree = player addaction [("<t color=""#0074E8"">" + ("Break Free") +"</t>"), "custom\addons\arrest\BreakFree.sqf",player,1,false,true,"", ""];
		};
	} else {
		player removeAction s_player_breakfree;
		s_player_breakfree = -1;
	};
	if(_isMan && !_isZombie && _canDo && _isAlive && !_isAnimal && _string && _side && !inSafeZone) then {
		_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
		_IsNearPlot = count (_findNearestPoles);
		_fuid  = [];
		_allowed = [];
		if(_IsNearPlot > 0)then{
			player removeAction s_player_arrest;
			s_player_arrest = -1;
			_thePlot = _findNearestPoles select 0;
			_adminList = DoorAdminList;
			_owner =  _thePlot getVariable ["ownerPUID","010"];
			_friends = _thePlot getVariable ["plotfriends", []];
			{
			  _friendUID = _x select 0;
			  _fuid  =  _fuid  + [_friendUID];
			} forEach _friends;
			_allowed = [_owner];    
			_allowed = [_owner] +  _fuid + _adminList;	
			if ( _playerUID in _allowed) then {
				if (_cursorTarget getVariable "Detain" == 1) exitWith {};
				if (s_player_arrest < 0) then {
					s_player_arrest = player addaction [("<t color=""#0074E8"">" + ("Detain") +"</t>"), "custom\addons\arrest\Detain.sqf",_cursorTarget,100,false,true,"", ""];
				};
			};					
		}else{
			if (_cursorTarget getVariable "Detain" == 1) exitWith {};
			if (s_player_arrest < 0) then {
				s_player_arrest = player addaction [("<t color=""#0074E8"">" + ("Detain") +"</t>"), "custom\addons\arrest\Detain.sqf",_cursorTarget,100,false,true,"", ""];
			};
		};
	} else {
		player removeAction s_player_arrest;
		s_player_arrest = -1;
	};
	
	if ((_cursorTarget getVariable "Detain" == 1) && cursorTarget distance player < 2 ) then {
		_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
		_IsNearPlot = count (_findNearestPoles);
		_fuid  = [];
		_allowed = [];
		if(_IsNearPlot > 0)then{
			player removeAction s_player_escort;
			s_player_escort = -1;
			player removeAction s_player_search;
			s_player_search = -1;
			player removeAction s_player_release;
			s_player_release = -1;
			_thePlot = _findNearestPoles select 0;
			_adminList = DoorAdminList;
			_owner =  _thePlot getVariable ["ownerPUID","010"];
			_friends = _thePlot getVariable ["plotfriends", []];
			{
			  _friendUID = _x select 0;
			  _fuid  =  _fuid  + [_friendUID];
			} forEach _friends;
			_allowed = [_owner];    
			_allowed = [_owner] +  _fuid + _adminList;	
			if ( _playerUID in _allowed) then {
				if(_isMan && !_isZombie && _canDo && _isAlive) then {
					if (s_player_escort < 0) then {
						s_player_escort = player addaction [("<t color=""#0074E8"">" + ("Escort") +"</t>"), "custom\addons\arrest\Escort.sqf",_cursorTarget, 1, true, true, "", ""];
						};
				} else {
					player removeAction s_player_escort;
					s_player_escort = -1;
					};
				if(_isMan && !_isZombie && _canDo && _isAlive) then {
					if (s_player_search < 0) then {
						s_player_search = player addaction [("<t color=""#0074E8"">" + ("Search") +"</t>"), "custom\addons\arrest\Search.sqf",_cursorTarget, 1, true, true, "", ""];
						};
				} else {
					player removeAction s_player_search;
					s_player_search = -1;
					};
				if(_isMan && !_isZombie && _canDo && _isAlive) then {
					if (s_player_release < 0) then {
						s_player_release = player addaction [("<t color=""#0074E8"">" + ("Release") +"</t>"), "custom\addons\arrest\release.sqf",_cursorTarget, 1, true, true, "", ""];
						};
				} else {
					player removeAction s_player_release;
					s_player_release = -1;
				};
			};					
		}else{
			if(_isMan && !_isZombie && _canDo && _isAlive) then {
				if (s_player_escort < 0) then {
					s_player_escort = player addaction [("<t color=""#0074E8"">" + ("Escort") +"</t>"), "custom\addons\arrest\Escort.sqf",_cursorTarget, 1, true, true, "", ""];
					};
			} else {
				player removeAction s_player_escort;
				s_player_escort = -1;
				};
			if(_isMan && !_isZombie && _canDo && _isAlive) then {
				if (s_player_search < 0) then {
					s_player_search = player addaction [("<t color=""#0074E8"">" + ("Search") +"</t>"), "custom\addons\arrest\Search.sqf",_cursorTarget, 1, true, true, "", ""];
					};
			} else {
				player removeAction s_player_search;
				s_player_search = -1;
				};
			if(_isMan && !_isZombie && _canDo && _isAlive) then {
				if (s_player_release < 0) then {
					s_player_release = player addaction [("<t color=""#0074E8"">" + ("Release") +"</t>"), "custom\addons\arrest\release.sqf",_cursorTarget, 1, true, true, "", ""];
					};
			} else {
				player removeAction s_player_release;
				s_player_release = -1;
			};
		};
	};
	
	
	//-------------------------------------------------------------------------------------------------------------
	
	// logic vars
	_player_cook = false;
	_player_boil = false;

	// CURSOR TARGET IS FIRE
	if (inflamed _cursorTarget) then {
		
		//Fireplace Actions check
		if (_hasRawMeat) then {
			_player_cook = true;	
		};
		
		// Boil water
		if (_hasbottleitem && _hastinitem) then {
			_player_boil = true;
		};
	};

	if (_player_SurrenderedGear) then {
		if (s_player_SurrenderedGear < 0) then {
			s_player_SurrenderedGear = player addAction [localize "STR_EPOCH_ACTIONS_GEAR", "\z\addons\dayz_code\actions\surrender_gear.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_SurrenderedGear;
		s_player_SurrenderedGear = -1;
	};

	//Fireplace Actions check
	if (_player_cook) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	
	// Boil water
	if (_player_boil) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};
	
	if(_cursorTarget == dayz_hasFire) then {
		if ((s_player_fireout < 0) && !(inflamed _cursorTarget) && (player distance _cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	
	//Packing my tent (Burn/Destroy)
	if(_isTent && (player distance _cursorTarget < 3)) then {
		if (_ownerID == _playerUID) then {
			if (s_player_packtent < 0) then {
				s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
			};
			if ("ItemMatchbox_DZE" in weapons player) then {
				if (s_player_igniteTent < 0) then {
					s_player_igniteTent = player addAction [format["Ignite Tent"], "custom\actions\tent_ignite.sqf",cursorTarget, 1, true, true, "", ""];
				};
			}
		} else {
			if (("ItemJerrycan" in _magazinesPlayer) && ("ItemMatchbox_DZE" in weapons player)) then {
				if (s_player_packtent < 0) then {
					s_player_packtent = player addAction [localize "STR_EPOCH_ACTIONS_DESTROYTENT", "custom\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			};
			if ("ItemMatchbox_DZE" in weapons player) then {
				if (s_player_igniteTent < 0) then {
					s_player_igniteTent = player addAction [format["Ignite Tent"], "custom\actions\tent_ignite.sqf",cursorTarget, 1, true, true, "", ""];
				};
			}
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
		player removeAction s_player_igniteTent;
        s_player_igniteTent = -1;
	};

	//Allow manage door
	if((_typeOfCursorTarget in DZE_DoorsLocked)) then {
		if (s_player_manageDoor < 0) then {		 
		 s_player_manageDoor = player addAction ["<t color='#0059FF'>Manage Door</t>", "custom\actions\initDoorManagement.sqf", _cursorTarget, 5, false];
		};
	} else {
			player removeAction s_player_manageDoor;
			s_player_manageDoor = -1;
	};
	
	//Allow owner to unlock vault
	if((_typeOfCursorTarget in DZE_LockableStorage) && _characterID != "0" && (player distance _cursorTarget < 3)) then {
		if (s_player_unlockvault < 0) then {
			if(_typeOfCursorTarget in DZE_LockedStorage) then {
				if(_characterID == dayz_combination || _ownerID == _playerUID) then {
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_OPEN",_text], "\z\addons\dayz_code\actions\vault_unlock.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				} else {
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				};
				s_player_unlockvault = 1;
			} else {
				if(_characterID != dayz_combination && _ownerID != _playerUID) then {
					_combi = player addAction [localize "STR_EPOCH_ACTIONS_RECOMBO", "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
					s_player_unlockvault = 1;
				};
			};
		};
	} else {
		{player removeAction _x} count s_player_combi;s_player_combi = [];
		s_player_unlockvault = -1;
	};
	
	// Single Currency
	if(_typeOfCursorTarget in ZSC_MoneyStorage && (player distance _cursorTarget < 3) && !DZE_ActionInProgress) then {
		if (s_bank_dialog < 0) then {
				s_bank_dialog = player addAction ["Money Storage", "custom\actions\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];	
		};
	} else {
     	player removeAction s_bank_dialog;
		s_bank_dialog = -1;
	};

	// Single Currency - Cars 
	if( _isVehicle && !_isMan &&_isAlive && !_isMan && !locked _cursorTarget && !(_cursorTarget isKindOf "Bicycle") && (player distance _cursorTarget < 5) && !DZE_ActionInProgress) then {		
		if (s_bank_dialog2 < 0) then {
			s_bank_dialog2 = player addAction ["Money Storage", "custom\actions\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
		};			
	} else {		
		player removeAction s_bank_dialog2;
		s_bank_dialog2 = -1;
	};
	
	//Allow owner to pack vault
	if(_typeOfCursorTarget in DZE_UnLockedStorage && _characterID != "0" && (player distance _cursorTarget < 3)) then {

		if (s_player_lockvault < 0) then {
			if(_characterID == dayz_combination || _ownerID == dayz_playerUID) then {
				s_player_lockvault = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "\z\addons\dayz_code\actions\vault_lock.sqf",_cursorTarget, 0, false, true, "",""];
			};
		};
		if (s_player_packvault < 0 && (_characterID == dayz_combination || _ownerID == dayz_playerUID)) then {
			s_player_packvault = player addAction [format["<t color='#ff0000'>%1</t>",(format[localize "STR_EPOCH_ACTIONS_PACK",_text])], "\z\addons\dayz_code\actions\vault_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packvault;
		s_player_packvault = -1;
		player removeAction s_player_lockvault;
		s_player_lockvault = -1;
	};

	

    //Player Deaths
	if(_typeOfCursorTarget == "Info_Board_EP1") then {
		if (s_player_information < 0) then {
			s_player_information = player addAction [localize "STR_EPOCH_ACTIONS_MURDERS", "\z\addons\dayz_code\actions\list_playerDeaths.sqf",[], 7, false, true, "",""];
		};
	} else {
		player removeAction s_player_information;
		s_player_information = -1;
	};
	
	// Single Currency - Give Money
	if (_isMan and _isAlive and !_isZombie and !_isAnimal and !(_traderType in serverTraders)) then {
		if (s_givemoney_dialog < 0) then {
			s_givemoney_dialog = player addAction [format["Give Money to %1", (name _cursorTarget)], "custom\actions\give_player_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_givemoney_dialog;
		s_givemoney_dialog = -1;
	};
	
	//Fuel Pump
	if(_typeOfCursorTarget in dayz_fuelpumparray) then {	
		if (s_player_fuelauto < 0) then {
			
			// check if Generator_DZ is running within 30 meters
			_findNearestGens = (position player) nearEntities ["Generator_DZ", 30];
			_findNearestGen = [];
			{
				if (alive _x && (_x getVariable ["GeneratorRunning", false])) then {
					_findNearestGen set [(count _findNearestGen),_x];
				};
			} count _findNearestGens;
			_IsNearRunningGen = count (_findNearestGen);
			
			// show that pump needs power if no generator nearby.
			if(_IsNearRunningGen > 0) then {
				s_player_fuelauto = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",objNull, 0, false, true, "",""];
			} else {
				s_player_fuelauto = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto;
		s_player_fuelauto = -1;
	};

	//Fuel Pump on truck
	if(_typeOfCursorTarget in DZE_fueltruckarray && alive _cursorTarget) then {	
		if (s_player_fuelauto2 < 0) then {
			// show that fuel truck pump needs power.
			if(isEngineOn _cursorTarget) then {
				s_player_fuelauto2 = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",_cursorTarget, 0, false, true, "",""];
			} else {
				s_player_fuelauto2 = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto2;
		s_player_fuelauto2 = -1;
	};

	// inplace upgrade tool
	if ((_cursorTarget isKindOf "ModularItems") || (_cursorTarget isKindOf "Land_DZE_WoodDoor_Base") || (_cursorTarget isKindOf "CinderWallDoor_DZ_Base")) then {
		if ((s_player_lastTarget select 0) != _cursorTarget) then {
			if (s_player_upgrade_build > 0) then {
				player removeAction s_player_upgrade_build;
				s_player_upgrade_build = -1;
			};
		};
		if (s_player_upgrade_build < 0) then {
			// s_player_lastTarget = _cursorTarget;
			s_player_lastTarget set [0,_cursorTarget];
			s_player_upgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_UPGRADE",_text], "custom\actions\player_upgrade.sqf",_cursorTarget, -1, false, true, "",""];
		};
	} else {
		player removeAction s_player_upgrade_build;
		s_player_upgrade_build = -1;
	};
	
	// downgrade system
	if((_isDestructable || _cursorTarget isKindOf "Land_DZE_WoodDoorLocked_Base" || _cursorTarget isKindOf "CinderWallDoorLocked_DZ_Base") && (DZE_Lock_Door == _ownerID)) then {
		if ((s_player_lastTarget select 1) != _cursorTarget) then {
			if (s_player_downgrade_build > 0) then {	
				player removeAction s_player_downgrade_build;
				s_player_downgrade_build = -1;
			};
		};

		if (s_player_downgrade_build < 0) then {
			s_player_lastTarget set [1,_cursorTarget];
			s_player_downgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_REMLOCK",_text], "custom\actions\player_buildingDowngrade.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_downgrade_build;
		s_player_downgrade_build = -1;
	};

	// inplace maintenance tool
	if((_cursorTarget isKindOf "ModularItems" || _cursorTarget isKindOf "DZE_Housebase" || _typeOfCursorTarget == "LightPole_DZ") && (damage _cursorTarget >= DZE_DamageBeforeMaint)) then {
		if ((s_player_lastTarget select 2) != _cursorTarget) then {
			if (s_player_maint_build > 0) then {	
				player removeAction s_player_maint_build;
				s_player_maint_build = -1;
			};
		};

		if (s_player_maint_build < 0) then {
			s_player_lastTarget set [2,_cursorTarget];
			s_player_maint_build = player addAction [format[localize "STR_EPOCH_ACTIONS_MAINTAIN",_text], "\z\addons\dayz_code\actions\player_buildingMaint.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_maint_build;
		s_player_maint_build = -1;
	};


	//Start Generator
	if(_cursorTarget isKindOf "Generator_DZ") then {
		if (s_player_fillgen < 0) then {
			
			// check if not running 
			if((_cursorTarget getVariable ["GeneratorRunning", false])) then {
				s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR1", "\z\addons\dayz_code\actions\stopGenerator.sqf",_cursorTarget, 0, false, true, "",""];				
			} else {
			// check if not filled && player has jerry.
				if((_cursorTarget getVariable ["GeneratorFilled", false])) then {
					s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR2", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
				} else {
					if("ItemJerrycan" in _magazinesPlayer) then {
						s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR3", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
					};
				};
			};
		};
	} else {
		player removeAction s_player_fillgen;
		s_player_fillgen = -1;
	};

	//Towing with tow truck
	/*
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true, "",""];				
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true, "",""];				
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	*/

    //Sleep
	if(_isTent && _ownerID == _playerUID) then {
		if ((s_player_sleep < 0) && (player distance _cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "custom\actions\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	
	//Repairing Vehicles
	if ((dayz_myCursorTarget != _cursorTarget) && _isVehicle && !_isMan && _hasToolbox && (damage _cursorTarget < 1) && !_isDisallowRepair) then {
		if (s_player_repair_crtl < 0) then {
			dayz_myCursorTarget = _cursorTarget;
			_menu = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_REPAIRV", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			_menu1 = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_SALVAGEV", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];
			s_player_repair_crtl = 1;
		} else {
			{dayz_myCursorTarget removeAction _x} count s_player_repairActions;s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};

	// All Traders
	if (_isMan && !_isPZombie && _traderType in serverTraders) then {
		
		if (s_player_parts_crtl < 0) then {

			// get humanity
			_humanity = player getVariable ["humanity",0];
			_traderMenu = call compile format["menu_%1;",_traderType];

			// diag_log ("TRADER = " + str(_traderMenu));
			
			_low_high = "low";
			_humanity_logic = false;
			if((_traderMenu select 2) == "friendly") then {_humanity_logic = (_humanity < -5000);};
			if((_traderMenu select 2) == "hostile") then {_low_high = "high";_humanity_logic = (_humanity > -5000);};
			if((_traderMenu select 2) == "bandit1") then {_low_high = "high";_humanity_logic = (_humanity > -5000);};
			if((_traderMenu select 2) == "bandit2") then {_low_high = "high";_humanity_logic = (_humanity > -10000);};
			if((_traderMenu select 2) == "bandit3") then {_low_high = "high";_humanity_logic = (_humanity > -15000);};
			if((_traderMenu select 2) == "bandit4") then {_low_high = "high";_humanity_logic = (_humanity > -25000);};
			if((_traderMenu select 2) == "bandit5") then {_low_high = "high";_humanity_logic = (_humanity > -40000);};
			if((_traderMenu select 2) == "bandit6") then {_low_high = "high";_humanity_logic = (_humanity > -60000);};
			if((_traderMenu select 2) == "bandit7") then {_low_high = "high";_humanity_logic = (_humanity > -90000);};
			if((_traderMenu select 2) == "bandit8") then {_low_high = "high";_humanity_logic = (_humanity > -130000);};
			if((_traderMenu select 2) == "bandit9") then {_low_high = "high";_humanity_logic = (_humanity > -185000);};
			if((_traderMenu select 2) == "bandit10") then {_low_high = "high";_humanity_logic = (_humanity > -250000);};
			if((_traderMenu select 2) == "hero") then {_humanity_logic = (_humanity < 5000);};
			if((_traderMenu select 2) == "hero1") then {_humanity_logic = (_humanity < 5000);};
			if((_traderMenu select 2) == "hero2") then {_humanity_logic = (_humanity < 10000);};
			if((_traderMenu select 2) == "hero3") then {_humanity_logic = (_humanity < 15000);};
			if((_traderMenu select 2) == "hero4") then {_humanity_logic = (_humanity < 25000);};
			if((_traderMenu select 2) == "hero5") then {_humanity_logic = (_humanity < 40000);};
			if((_traderMenu select 2) == "hero6") then {_humanity_logic = (_humanity < 60000);};
			if((_traderMenu select 2) == "hero7") then {_humanity_logic = (_humanity < 90000);};
			if((_traderMenu select 2) == "hero8") then {_humanity_logic = (_humanity < 130000);};
			if((_traderMenu select 2) == "hero9") then {_humanity_logic = (_humanity < 185000);};
			if((_traderMenu select 2) == "hero10") then {_humanity_logic = (_humanity < 250000);};
			if(_humanity_logic) then {
				_cancel = player addAction [format[localize "STR_EPOCH_ACTIONS_HUMANITY",_low_high], "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
				s_player_parts set [count s_player_parts,_cancel];
			} else {
				
				// Static Menu
				{
					//diag_log format["DEBUG TRADER: %1", _x];
					_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
					s_player_parts set [count s_player_parts,_buy];
				
				} count (_traderMenu select 1);
				_buyV = player addAction ["<t color='#0059FF'>Advanced Trading</t>", "custom\actions\initAdvancedTrading.sqf",(_traderMenu select 0), 999, true, false, "",""];
				s_player_parts set [count s_player_parts,_buyV];
				// Database menu
				LastTraderMenu = (_traderMenu select 0);
				_buy = player addAction [localize "STR_EPOCH_PLAYER_289", "\z\addons\dayz_code\actions\show_dialog.sqf",(_traderMenu select 0), 999, true, false, "",""];
				s_player_parts set [count s_player_parts,_buy];

			};
			s_player_parts_crtl = 1;
			
		};
	} else {
		{player removeAction _x} count s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
	};

	
	if(dayz_tameDogs) then {
		
		//Dog
		if (_isDog && _isAlive && (_hasRawMeat) && _characterID == "0" && player getVariable ["dogID", 0] == 0) then {
			if (s_player_tamedog < 0) then {
				s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", _cursorTarget, 1, false, true, "", ""];
			};
		} else {
			player removeAction s_player_tamedog;
			s_player_tamedog = -1;
		};
		if (_isDog && _characterID == dayz_characterID && _isAlive) then {
			_dogHandle = player getVariable ["dogID", 0];
			if (s_player_feeddog < 0 && _hasRawMeat) then {
				s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
			};
			if (s_player_waterdog < 0 && "ItemWaterbottle" in _magazinesPlayer) then {
				s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
			};
			if (s_player_staydog < 0) then {
				_lieDown = _dogHandle getFSMVariable "_actionLieDown";
				if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
				s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
			};
			if (s_player_trackdog < 0) then {
				s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
			};
			if (s_player_barkdog < 0) then {
				s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", _cursorTarget, 3, false, true,"",""];
			};
			if (s_player_warndog < 0) then {
				_warn = _dogHandle getFSMVariable "_watchDog";
				if (_warn) then { _text = (localize "str_epoch_player_247"); _warn = false; } else { _text = (localize "str_epoch_player_248"); _warn = true; };
				s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];		
			};
			if (s_player_followdog < 0) then {
				s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
			};
		} else {
			player removeAction s_player_feeddog;
			s_player_feeddog = -1;
			player removeAction s_player_waterdog;
			s_player_waterdog = -1;
			player removeAction s_player_staydog;
			s_player_staydog = -1;
			player removeAction s_player_trackdog;
			s_player_trackdog = -1;
			player removeAction s_player_barkdog;
			s_player_barkdog = -1;
			player removeAction s_player_warndog;
			s_player_warndog = -1;
			player removeAction s_player_followdog;
			s_player_followdog = -1;
		};
	};

} else {
	//Engineering
	player removeAction s_player_plotManagement;
	s_player_plotManagement = -1;
	
	{dayz_myCursorTarget removeAction _x} count s_player_repairActions;s_player_repairActions = [];
	s_player_repair_crtl = -1;

	{player removeAction _x} count s_player_combi;s_player_combi = [];
		
	dayz_myCursorTarget = objNull;
	s_player_lastTarget = [objNull,objNull,objNull,objNull,objNull];

	{player removeAction _x} count s_player_parts;s_player_parts = [];
	s_player_parts_crtl = -1;

	{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
	s_player_lockUnlock_crtl = -1;

	player removeAction s_player_checkGear;
	s_player_checkGear = -1;

	player removeAction s_player_SurrenderedGear;
	s_player_SurrenderedGear = -1;

	//Others
	player removeAction s_player_maintain_area;
    s_player_maintain_area = -1;
    player removeAction s_player_maintain_area_preview;
    s_player_maintain_area_preview = -1;
	player removeAction s_player_plot_boundary_on;
	s_player_plot_boundary_on = -1;
	player removeAction s_player_plot_boundary_off;
	s_player_plot_boundary_off = -1;
	player removeAction s_player_plot_take_ownership;
	s_player_plot_take_ownership = -1;
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_igniteTent;
	s_player_igniteTent = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_clothes;
	s_clothes = -1;
	player removeAction s_player_nuke;
	s_player_nuke = -1;
	//Dog
	player removeAction s_player_tamedog;
	s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
    player removeAction s_player_manageDoor;
	s_player_manageDoor = -1;

    // vault
	player removeAction s_player_unlockvault;
	s_player_unlockvault = -1;
	player removeAction s_player_packvault;
	s_player_packvault = -1;
	player removeAction s_player_lockvault;
	s_player_lockvault = -1;

	player removeAction s_player_information;
	s_player_information = -1;
	player removeAction s_player_fillgen;
	s_player_fillgen = -1;
	player removeAction s_player_upgrade_build;
	s_player_upgrade_build = -1;
	player removeAction s_player_maint_build;
	s_player_maint_build = -1;
	player removeAction s_player_downgrade_build;
	s_player_downgrade_build = -1;
	player removeAction s_player_towing;
	s_player_towing = -1;
	player removeAction s_player_fuelauto;
	s_player_fuelauto = -1;
	player removeAction s_player_fuelauto2;
	s_player_fuelauto2 = -1;
	player removeAction s_player_checkwallet;
	s_player_checkwallet = -1;
	player removeAction s_givemoney_dialog;
	s_givemoney_dialog = -1;
	player removeAction s_bank_dialog;
	s_bank_dialog = -1;
	player removeAction s_bank_dialog2;
	s_bank_dialog2 = -1;
	player removeAction s_player_fillbottlewithrain;
    s_player_fillbottlewithrain = -1;
	player removeAction s_player_arrest;
	s_player_arrest = -1;
	player removeAction s_player_escort;
	s_player_escort = -1;
	player removeAction s_player_search;
	s_player_search = -1;
	player removeAction s_player_release;
	s_player_release = -1;
	player removeAction s_player_breakfree;
	s_player_breakfree = -1;
	player removeAction s_player_garage;
	s_player_garage = -1; 
};

//Nitro
_isaCar = _cursorTarget in ["Octavia_ACR","UAZ_Unarmed_ACR","policecar","VolhaLimo_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VWGolf","Skoda","SkodaBlue","SkodaGreen","SkodaRed","car_hatchback","car_sedan","Lada1","Lada1_TK_CIV_EP1","Lada2","Lada2_TK_CIV_EP1","LadaLM","LandRover_ACR","LandRover_Ambulance_ACR","LandRover_Ambulance_Des_ACR","BAF_Offroad_W","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow","UAZ_CDF","UAZ_INS","UAZ_MG_TK_EP1_DZE","UAZ_RU","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1","S1203_ambulance_EP1","S1203_TK_CIV_EP1","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","Offroad_DSHKM_Gue_DZE","LAndRover_CZ_EP1","LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","LandRover_TK_CIV_EP1","Ikarus","Ikarus_TK_CIV_EP1","ArmoredSUV_PMC","ArmoredSUV_PMC_DZ","ArmoredSUV_PMC_DZE","UAZ_Unarmed_TK_CIV_EP1","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","hilux1_civil_3_open_EP1","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open"];
if (_isaCar) then {
	if (("ItemJerrycan" in _mags) && ("ItemSodaRbull" in _mags)) then {
	   _hasNOSitems = true;
	} else {
	   _hasNOSitems = false;
	};
	_hasNOSinstalled = _cursorTarget getVariable ["nitroinstalled", 0];
	if (_isaCar && (!locked _cursorTarget) && _hasNOSitems && (_hasNOSinstalled == 0)) then {
		if (s_player_nitroInstall < 0) then {
			s_player_nitroInstall = player addAction [("<t color=""#39C1F3"">" + ("Install NOS boost") +"</t>"), "custom\addons\NOS\nitroinstall.sqf",_cursorTarget, 999, true, false, "",""];
		};
	} else {
		player removeAction s_player_nitroInstall;
		s_player_nitroInstall = -1;
	};
};

//Dog actions on player self
_dogHandle = player getVariable ["dogID", 0];
if (_dogHandle > 0) then {
	_dog = _dogHandle getFSMVariable "_dog";
	_characterID = "0";
	if (!isNull cursorTarget) then { _characterID = cursorTarget getVariable ["CharacterID","0"]; };
	if (_canDo && !_inVehicle && alive _dog && _characterID != dayz_characterID) then {
		if (s_player_movedog < 0) then {
			s_player_movedog = player addAction [localize "str_actions_movedog", "\z\addons\dayz_code\actions\dog\move.sqf", player getVariable ["dogID", 0], 1, false, true, "", ""];
		};
		if (s_player_speeddog < 0) then {
			_text = (localize "str_epoch_player_249");
			_speed = 0;
			if (_dog getVariable ["currentSpeed",1] == 0) then { _speed = 1; _text = (localize "str_epoch_player_250"); };
			s_player_speeddog = player addAction [format[localize "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player getVariable ["dogID", 0],_speed], 0, false, true, "", ""];
		};
		if (s_player_calldog < 0) then {
			s_player_calldog = player addAction [localize "str_actions_calldog", "\z\addons\dayz_code\actions\dog\follow.sqf", [player getVariable ["dogID", 0], true], 2, false, true, "", ""];
		};
	};
} else {
	player removeAction s_player_movedog;		
	s_player_movedog =		-1;
	player removeAction s_player_speeddog;
	s_player_speeddog =		-1;
	player removeAction s_player_calldog;
	s_player_calldog = 		-1;
};

if (_inVehicle && (_vehicle isKindOf "ori_excavator")) then {
	if (bucketOut < 0) then {
		ExcavateVeh = _vehicle;
		bucketOut = ExcavateVeh addAction ["Bucket Out","custom\origins\bucketOut.sqf","",5,false,true];
	};
	if (bucketIn < 0) then {
		ExcavateVeh = _vehicle;
		bucketIn = ExcavateVeh addAction ["Bucket In","custom\origins\bucketIn.sqf","",5,false,true];
	};
} else {
	ExcavateVeh removeAction bucketOut;
	bucketOut = -1;
	ExcavateVeh removeAction bucketIn;
	bucketIn = -1;
};

//Origins Submarine Up/Down
if (_inVehicle && (_vehicle isKindOf "ori_submarine")) then {
	if (s_sub_down < 0) then {
		thesub = _vehicle;
		s_sub_down = thesub addAction ["Rise","custom\origins\sub_down.sqf","",5,false,true];
	};
	if (s_sub_up < 0) then {
		thesub = _vehicle;
		s_sub_up = thesub addAction ["Submerge","custom\origins\sub_up.sqf","",5,false,true];
	};
} else {
   thesub removeAction s_sub_up;
   s_sub_up = -1;
   thesub removeAction s_sub_down;
   s_sub_down = -1;
};

// ZOMBIE SHIELD START
if (("PartEngine" in magazines player) && ("ItemJerrycan" in magazines player) && ("ItemToolbox" in items player)) then {
    hasShield = true;
} else {
    hasShield = false;
};
if (hasShield) then {
    if (zombieShield < 0) then {
    zombieShield = player addAction [("<t color=""#00c362"">" + ("Anti-Zombie Freq Emitter") +"</t>"),"custom\actions\zombieshield.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieShield;
    zombieShield = -1;
};
// ZOMBIE SHIELD END

//------------------- Drink Water --------------------------------
private["_playerPos","_canDrink","_isPond","_isWell","_isOcean","_pondPos","_objectsWell","_objectsPond","_display"];
 
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

if (_canDrink) then {
	if (s_player_drinkWater < 0) then {
		s_player_drinkWater = player addaction[("<t color=""#0000c7"">" + ("Drink water") +"</t>"),"custom\actions\drink_water.sqf"];
	};
} else {
	player removeAction s_player_drinkWater;
	s_player_drinkWater = -1;
};
 
//-------------------------Drink Water End ----------------------------------------------