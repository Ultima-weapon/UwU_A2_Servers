/*
DayZ Custom Buildables
Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
 
Edits by Mike of http://www.petuniaserver.com/ - Original file & all kudos to the EPOCH devs! http://www.dayzepoch.com
Edits and re-writes by hogscraper:
Added code to see if player has tools and materials required to build item
Removed a lot of code referencing lockables, plot pole placement and construction multiplier since part of that code was already removed
Cleaned up a lot of old code that wasn't needed any more for this custom crafting
Removed irrelevant variables from private block
This file is called with zero parameters
*/
private ["_HT_temp","_HM_temp","_location","_dir","_classname","_cancel","_reason","_isMedic","_dis","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_zheightchanged","_rotate","_zheightdirection","_isNear","_objHupDiff","_vehicle","_inVehicle","_requireplot","_objHDiff","_ownerPUID","_playerUID"];
 
 _AdminCraft=false;
 _PUID = getPlayerUID player;
 
 
if(_PUID in Admin_Crafting) then {
 _AdminCraft=true;
 };
 
_lbIndex = lbCurSel 3901;
_classname = lbText [3901,_lbIndex];
 
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
 
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater =  dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;
_playerUID = getPlayerUID player;
 
 //create arrays for checking whether or not the player
 //has the correct tools and materials to make the desired item
_requiredtools = getArray (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requiredtools");
_requiredmaterials = getArray (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requiredmaterials");
_RT_temp=getArray (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requiredtools");
_RM_temp=getArray (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requiredmaterials");
_hastools = false;
_hasmaterials = false;
_weaps=[];
_mags=[];
 
_weaps=weapons player;
_mags=magazines player;
_tmp_Pos=0;
_counter=0;
 
{
_tmp_Pos= _weaps find _x;
if (_tmp_Pos > -1) then {
_requiredtools set [_counter,objNull];
_weaps set [_tmp_Pos,objNull];
};
_counter = _counter + 1;
}
forEach _RT_temp;
 
_requiredtools=_requiredtools-[objNull];
_weaps=_weaps-[objNull];
 
_tmp_Pos=0;
_counter=0;
{
_tmp_Pos= _mags find _x;
if (_tmp_Pos > -1) then {
_requiredmaterials set [_counter,objNull];
_mags set [_tmp_Pos,objNull];
};
_counter = _counter + 1;
}
forEach _RM_temp;
_requiredmaterials=_requiredmaterials-[objNull];
_mags=_mags-[objNull];
 
if(((count _requiredmaterials) == 0) or (_AdminCraft)) then {
_hasmaterials=true;
};
if(((count _requiredtools) == 0) or (_AdminCraft)) then {
_hastools=true;
};
 
//Create the message to display if player is missing any of the required tools
if (!_hasTools) then{
_HT_temp="You are missing the following tools:";
{  
_HT_temp=_HT_temp+" " + getText (configFile >> "CfgWeapons" >> _x >> "displayName");
}foreach _requiredtools;
};
 
//Create the message to display if player is missing any of the required materials
if (!_hasMaterials) then{
_HM_temp="You are missing the following materials:";
{  
if(getText (configFile >> "CfgMagazines" >> _x >> "displayName")=="Supply Crate") then{
_HM_temp=_HM_temp+" " + getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort");
}else{
_HM_temp=_HM_temp+" " + getText (configFile >> "CfgMagazines" >> _x >> "displayName");
};
}foreach _requiredmaterials;
};
 
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
helperDetach = false;
_canDo = (!r_drag_sqf and !r_player_unconscious);

DZE_Q = false;
DZE_Z = false;
 
DZE_Q_alt = false;
DZE_Z_alt = false;
 
DZE_Q_ctrl = false;
DZE_Z_ctrl = false;
 
DZE_5 = false;
DZE_4 = false;
DZE_6 = false;
DZE_F = false;
 
DZE_cancelBuilding = false;
 
call gear_ui_init;
closeDialog 1;
 
if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};
if (!_hasTools) exitWith {DZE_ActionInProgress = false; cutText [format["%1",_HT_temp], "PLAIN DOWN"];};
if (!_hasMaterials) exitWith {DZE_ActionInProgress = false; cutText [format["%1",_HM_temp], "PLAIN DOWN"];};
 
_text =  getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
 
_requireplot = DZE_requireplot;
if(isNumber (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requireplot")) then {
_requireplot = getNumber(missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "requireplot");
};
if(_AdminCraft) then {
_requireplot=0;
};
 
_offset =  getArray (missionConfigFile >> "Custom_Buildables" >> "Buildables" >> ComboBoxResult >> _classname >> "offset");
if((count _offset) <= 0) then {
_offset = [0,3,0];
};
 
_distance = DZE_PlotPole select 0;
 
// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];
 
{
if (alive _x) then {
_findNearestPole set [(count _findNearestPole),_x];
};
} foreach _findNearestPoles;
 
_IsNearPlot = count (_findNearestPole);
 
// check nearby plot's ownership and then for friend status
//if plot does not belong to player
_nearestPole = _findNearestPole select 0;
 
if(_AdminCraft) then {
	_ownerID = _playerUID
} else {
	_ownerID = _nearestPole getVariable["ownerPUID","0"];
};
 
if(_playerUID == _ownerID) then {  //Keep ownership
        _canBuildOnPlot = true;
} else {
_friendlies     = player getVariable ["friendlyTo",[]];
if(_ownerID in _friendlies) then {
        _canBuildOnPlot = true;
        };
};
//if plotpole is needed and none are within range or if what's in range does belong
//to the player or a friendly we need to exit now
 
if((_requireplot>0) and ((_IsNearPlot==0)||(!_canBuildOnPlot))) exitWith {DZE_ActionInProgress = false; cutText ["Building of this item requires a plot pole within range!" , "PLAIN DOWN"]; };
 
_location = [0,0,0];
_isOk = true;
 
// get inital players position
_location1 = getPosATL player;
_dir = getDir player;
 
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
//Build gizmo
_objectHelper = "Sign_sphere10cm_EP1" createVehicle _location;
_helperColor = "#(argb,8,8,3)color(0,0,0,0,ca)";
_objectHelper setobjecttexture [0,_helperColor];
_objectHelper attachTo [player,_offset];
_object attachTo [_objectHelper,[0,0,0]];
_position = getPosATL _objectHelper;
 
if(_AdminCraft) then{
} else {
{
player removeMagazine _x;
} foreach _RM_temp;
};
 
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
if (helperDetach) then {
_dir = -45;
} else {
_dir = 180;
    };
};
                if (DZE_6) then {
                        _rotate = true;
                        DZE_6 = false;
                        if (helperDetach) then {
                                _dir = 45;
                        } else {
                                _dir = 0;
                        };
                };
//Number keys above qwerty
//1=turn clockwise 1/16th of a circle
//2=detaches object from player - OBJECT MUST BE COMPLETELY ABOVE GROUND OR IT WILL DISAPPEAR!!
//3=turn counter clockwise 1/16th of a circle
if (AAC_1) then {
_rotate = true;
AAC_1 = false;
if (helperDetach) then {
_dir = -45;
} else {
_dir = _dir + 22.5;;
    };
};
 
if (AAC_3) then {
_rotate = true;
AAC_3 = false;
if (helperDetach) then {
_dir = -45;
} else {
_dir = _dir - 22.5;
    };
};
               
                if (DZE_F and _canDo) then {   
                        if (helperDetach) then {
                        _objectHelperDir = getDir _objectHelper;
                        _objectHelper attachTo [player];
                        _objectHelper setDir _objectHelperDir-(getDir player);
                        helperDetach = false;
                        } else {
                        _objectHelperPos = getPosATL _objectHelper;
                        detach _objectHelper;                  
                        _objectHelper setPosATL _objectHelperPos;
                        _objectHelperDir = getDir _objectHelper;
                        _objectHelper setVelocity [0,0,0]; //fix sliding glitch
                        helperDetach = true;
                        };
                        DZE_F = false;
                };
 
                if(_rotate) then {
                        if (helperDetach) then {
                                _objectHelperDir = getDir _objectHelper;
                                _objectHelperPos = getPosATL _objectHelper;
                                _objectHelper setDir _objectHelperDir+_dir;
                                _objectHelper setPosATL _objectHelperPos;
                        } else {
                                _objectHelper setDir _dir;
                                _objectHelper setPosATL _position;
                                //diag_log format["DEBUG Rotate BUILDING POS: %1", _position];                 
                        };
 
                };
 
                if(_zheightchanged) then {
                        if (!helperDetach) then {
                        detach _objectHelper;
                        };
 
                        _position = getPosATL _objectHelper;
 
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
 
                        _objectHelper setDir (getDir _objectHelper);
 
						/*
                        if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
                                _position set [2,0];
                        };
						*/
 
                        _objectHelper setPosATL _position;
 
                        //diag_log format["DEBUG Change BUILDING POS: %1", _position];
 
                        if (!helperDetach) then {
                        _objectHelper attachTo [player];
                        };
                };
 
 
sleep 0.5;
 
_location2 = getPosATL player;
 
if(DZE_5) exitWith {
_isOk = false;
detach _object;
_dir = getDir _object;
_position = getPosATL _object;
deleteVehicle _object;
detach _objectHelper;
deleteVehicle _objectHelper;
};
 
if(_location1 distance _location2 > 20) exitWith {
_isOk = false;
_cancel = true;
_reason = "You've moved to far away from where you started building (within 20 meters)";
detach _object;
deleteVehicle _object;
detach _objectHelper;
deleteVehicle _objectHelper;
};
 
if(abs(_objHDiff) > 20) exitWith {
_isOk = false;
_cancel = true;
_reason = "Cannot move up or down more than 20 meters";
detach _object;
deleteVehicle _object;
detach _objectHelper;
deleteVehicle _objectHelper;
};
 
if (player getVariable["combattimeout", 0] >= time) exitWith {
_isOk = false;
_cancel = true;
_reason = (localize "str_epoch_player_43");
detach _object;
deleteVehicle _object;
detach _objectHelper;
deleteVehicle _objectHelper;
};
 
if (DZE_cancelBuilding) exitWith {
_isOk = false;
_cancel = true;
_reason = "Cancelled building.";
detach _object;
deleteVehicle _object;
detach _objectHelper;
deleteVehicle _objectHelper;
};
};
 
//No building on roads unless toggled
if (!DZE_BuildOnRoads) then {
if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };
};
 
// No building in trader zones
if(!canbuild) then { _cancel = true; _reason = "Cannot build in a trader zone."; };
 
if(!_cancel) then {
 
// Start Build
_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
 
_tmpbuilt setdir _dir;
 
// Get position based on object
_location = _position;
 
_tmpbuilt setPosATL _location;
 
cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];
 
player playActionNow "Medic";
[player,"repair",0,false,10] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;
 
 cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];
 
_tmpbuilt setVariable ["OEMPos",_location,true];
_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];
_tmpbuilt setVariable ["ownerPUID",_playerUID,true];
 
_charID = dayz_characterID;
_activatingPlayer = player;
 
PVDZE_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,_playerUID],_classname];
publicVariableServer "PVDZE_obj_Publish";
 
cutText [format["Your build was successful!"], "PLAIN DOWN",3];
 
player reveal _tmpbuilt;
DZE_ActionInProgress = false;
 
} else {
cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
DZE_ActionInProgress = false;
if(_AdminCraft) then {
} else {
{
//Since player had items removed we need to give them back
player addMagazine _x;
} foreach _RM_temp;
};
};
 
DZE_ActionInProgress = false;