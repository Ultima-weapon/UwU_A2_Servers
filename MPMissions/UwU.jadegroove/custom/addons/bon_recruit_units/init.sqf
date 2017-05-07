//Created by HALV
//Idea from Bon_Inf*
private["_blacklistedAreas","_agent"];
if(isNil "dayz_MapArea")then{dayz_MapArea = 7000};
if(isNil "isOverpoch")then{isOverpoch = false;};
if(isNil "halv_server_create_delete_units")then{halv_server_create_delete_units = []};

//some antihacks will want this false, default false ... if you have no antihack, set to true
_useLocalMarkers = true;
//set to true and add static coords below
_useStaticCoords = false;
//uncomments and set static cords here, if more than one is added, a random position will be choosen from these
/*
_staticCoords = [
	[0,0,0]
];
*/

BON_RECRUIT_PATH = "custom\addons\bon_recruit_units\";

bon_max_units_allowed = 15;

if(isOverpoch)then{
	_agent = "Graves";
}else{
	_agent = "pook_Doc_Bell47";
};

_spawnarea = (dayz_MapArea/2);

_dist2roadMin = 50;

_spawnnearroad = true;

_dist2roadMax = 500;

_ClutterCutter = true;

_WorldName = toLower format ["%1", worldName];
_msg = format["[PMC_CONTRACTOR]: Selected safezones/blacklisted areas for world: %1",_WorldName];

switch (_WorldName)do{
	case "chernarus":{
		//safezones for chernarus here
		Halv_PMC_CONTRACTOR_noshootingzones = [
		//position					//radius	//cityname/text
		[[6325.6772,7807.7412,0],	250,		"Trader City Stary"],
		[[4063.4226,11664.19,0],	250,		"Trader City Bash"],
		[[11447.472,11364.504,0],	250,		"Trader City Klen"],
		[[1606.6443,7803.5156,0],	250,		"Bandit Camp"],
		[[12944.227,12766.889,0],	250,		"Hero Camp"],
		[[8122.35,13464.5,0],		250,		"BlackMarket trader"] // <-- no comma for last entry
		];
		_blacklistedAreas = [
		[[23999.742,2.4571743,0],	300],
		[[6325.6772,7807.7412,0],	500],
		[[4063.4226,11664.19,0],	500],
		[[11447.472,11364.504,0],	500],
		[[1606.6443,7803.5156,0],	500],
		[[12944.227,12766.889,0],	500],
		[[8122.35,13464.5,0],		500] // <-- no comma for last entry
		];
	};

	case "lingor":{
		Halv_PMC_CONTRACTOR_noshootingzones = [
		];
		_blacklistedAreas = [
		];
	};

	case "napf":{
		Halv_PMC_CONTRACTOR_noshootingzones = [
		[[8246.3184,15485.867,0],	250,		"Trader City Lenzburg"],
		[[15506.952,13229.368,0],	250,		"Trader city Emmen"],
		[[12399.751,5074.5273,0],	250,		"Trader City Schratten"],
		[[10398.626,8279.4619,0],	250,		"Bandit Vendor"],
		[[5149.9814,4864.1191,0],	250,		"Hero Vendor"],
		[[6633.1538,7254.916,0],	250,		"BlackMarket trader"]
		];
		_blacklistedAreas = [
		[[8246.3184,15485.867,0],	500],
		[[15506.952,13229.368,0],	500],
		[[12399.751,5074.5273,0],	500],
		[[10398.626,8279.4619,0],	500],
		[[5149.9814,4864.1191,0],	500],
		[[6633.1538,7254.916,0],	500],
		[[13288.313,19590.338,0],	800]
		];
	};

	case "tavi":{
		Halv_PMC_CONTRACTOR_noshootingzones = [
		[[11698.81,15210.121,0],	200,			"Trader City Lyepestok"],
		[[15309.663,9278.4912,0],	200,			"Trader City Sabina"],
		[[5538.7354,8762.2695,0],	200,			"Trader City Bilgrad"],
		[[7376.6084,4296.5879,0],	200,			"Trader City Branibor"],
		[[10948.426,654.90265,0],	200,			"Bandit Vendor"],
		[[15587.822,16394.049,0],	200,			"Hero Vendor"]
		];
		_blacklistedAreas = [
		[[11698.81,15210.121,0],	500],
		[[15309.663,9278.4912,0],	500],
		[[5538.7354,8762.2695,0],	500],
		[[7376.6084,4296.5879,0],	500],
		[[10948.426,654.90265,0],	500],
		[[15587.822,16394.049,0],	500]
		];
	};

	default{
		_msg = format["[PMC_CONTRACTOR]: No safezones/blacklisted areas selected world: %1 ...",_WorldName];
		Halv_PMC_CONTRACTOR_noshootingzones = [
		[[0,0,0],	0,	"DEBUG"]
		];
		_blacklistedAreas = [
		[[0,0,0],	0]
		];
	};
};

diag_log _msg;

Halv_units_control = compile preprocessFileLineNumbers (BON_RECRUIT_PATH+"Halv_units_control.sqf");

// Server stuff...
if(isServer) then{
	diag_log "[PMC_CONTRACTOR]: Server Loading Function ...";
	Halv_server_create_delete_units = compile preprocessFileLineNumbers (BON_RECRUIT_PATH+"server_create_delete_units.sqf");
	diag_log "[PMC_CONTRACTOR]: Server Adding PVEvent ...";
	"PV_requestServerunit" addPublicVariableEventHandler {(_this select 1) call Halv_server_create_delete_units;};
	diag_log "[PMC_CONTRACTOR]: Server Building Trader ...";
	private ["_coords","_roadlist","_firstroad"];

/////////////////////////////////////////////////////////////
	/*
	this is taken from:
	objectMapper.sqf Author: Joris-Jan van 't Land
	Edited by HALV
	*/
	private ["_multiplyMatrixFunc"];
	_multiplyMatrixFunc =
	{
		private ["_array1", "_array2", "_result"];
		_array1 = _this select 0;
		_array2 = _this select 1;
		_result =
		[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
		];
		_result
	};
/////////////////////////////////////////////////////////////

	while{true}do{
		scopeName "posiscope";
		if(!_useStaticCoords)then{
			waitUntil {(!isNil "BIS_fnc_findSafePos")};
			_coords = [getMarkerPos 'Center',0,_spawnarea,20,0,2000,0] call BIS_fnc_findSafePos;
		}else{
			waitUntil {(!isNil "BIS_fnc_selectRandom")};
			_coords = _staticCoords call BIS_fnc_selectRandom;
			breakOut "posiscope";
		};
		_IsBlacklisted = false;
		{if(_coords distance (_x select 0) < (_x select 1))exitWith{_IsBlacklisted = true};}forEach _blacklistedAreas;
		_roadlist = _coords nearRoads _dist2roadMax;
		if(!_IsBlacklisted and !(isOnRoad _coords) and !(surfaceIsWater _coords))then{
			_firstroad = [_roadlist,_coords] call BIS_fnc_nearestPosition;
			if(_spawnnearroad)then{
				if((count _roadlist > 0) and (_coords distance _firstroad > _dist2roadMin))then{breakOut "posiscope"};
			}else{
				if(count _roadlist > 0)then{
					if(_coords distance _firstroad > _dist2roadMin)then{breakOut "posiscope"};
				}else{breakOut "posiscope"};
			};
		};
	};

	diag_log format["[PMC_CONTRACTOR]: Found position for PMC Contractor ... (%1) %2",mapGridPosition _coords,_coords];

	_randir = (random 360);
//	diag_log format["[PMC_CONTRACTOR]: _roadlist: %1 _roadlist: %2",_randir,_roadlist];
	if(count _roadlist > 0)then{
		_randir = [_coords,(position _firstroad)] call BIS_fnc_dirTo;
//		diag_log format["[PMC_CONTRACTOR]: _randir: %1 _firstroad: %2",_randir,_firstroad];
	};

	//create trader and objects
	_objects = [
	["Land_CamoNet_EAST",				0.709961,-0.51001,	-167.21477],
	["Misc_Cargo1B_military",			5.69727,-0.706299,	-2.8818593],
	["Misc_cargo_cont_net1",			-4.14941,0.804443,	-26.693502],
	["SignM_FOB_Revolve_EP1",			5.53516,2.65137,	-182.78931],
	["Info_Board_EP1",					-3.35449,1.47534,	-116.36801],
	["Desk",							0.25293,1.05273,	188.31465],
	["Land_Chair_EP1",					-0.34375,-1.01563,	-73.404587],
	["AmmoCrates_NoInteractive_Medium",	3.55762,0.761719,	0],
	["AmmoCrates_NoInteractive_Large",	3.38379,-1.71509,	0]
	];
	//creating trader
	_pos0 = [(_coords select 0),(_coords select 1),0];
	_unit = createAgent [_agent, _pos0, [], 0, "CAN_COLLIDE"];
	_unit setDir _randir;
	_unit setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0; this addAction ['Recruit Units','custom\addons\bon_recruit_units\open_dialog.sqf', [], 1, true, true, '', '_this distance _target < 4'];";
	_unit setUnitAbility 0.60000002;
	_unit allowDammage false; _unit disableAI 'FSM'; _unit disableAI 'MOVE'; _unit disableAI 'AUTOTARGET'; _unit disableAI 'TARGET'; _unit setBehaviour 'CARELESS'; _unit forceSpeed 0;_unit enableSimulation false;
	removeAllWeapons _unit;
	removeAllItems _unit;
	_unit addWeapon "AKS_GOLD";
	_unit selectWeapon "AKS_GOLD";
	_marker = "Sign_arrow_down_EP1" createVehicle _pos0;
	_colour = [1,0,1];
	_marker setVariable ["Colour",_colour,true];
	_marker setObjectTexture [0,"#(argb,8,8,3)color(1,0,1,0.6,ca)"];
	_marker allowDamage false;
	_marker setPos _pos0;
	_marker attachTo [_unit,[0,0,2.2]];
	//creating "HeliHEmpty","HeliHCivil" for vehicles
	_heliHpos = [(_coords select 0)+25*sin(_randir), (_coords select 1)+25*cos(_randir), 0];
	_heliH = ["HeliHEmpty","HeliHCivil"]call BIS_fnc_selectRandom;
	_obj = createVehicle [_heliH, _heliHpos, [], 0, "CAN_COLLIDE"];
	_obj setDir (_randir+90);
	_obj setPos _heliHpos;
	if(_ClutterCutter)then{
		if(_heliH == "HeliHEmpty")then{
			_CC1 = createVehicle ["ClutterCutter_EP1", _heliHpos, [], 0, "CAN_COLLIDE"];
			_CC1 setDir _randir;
			_CC1 setPos _heliHpos;
		};
		_CC2 = createVehicle ["ClutterCutter_small_EP1", _pos0, [], 0, "CAN_COLLIDE"];
		_CC2 setDir _randir;
		_CC2 setPos _pos0;
	};
	{
		_Dir = (_randir + (_x select 3));
		_newRelPos = [[[cos _randir, sin _randir],[-(sin _randir), cos _randir]], [(_x select 1),(_x select 2)]] call _multiplyMatrixFunc;
		_pos = [(_coords select 0) + (_newRelPos select 0), (_coords select 1) + (_newRelPos select 1), 0];
		_obj = createVehicle [(_x select 0), _pos, [], 0, "CAN_COLLIDE"];
		_obj setDir _Dir;
		_obj setPos _pos;
		_obj setVariable ["objectLocked", true, true];
		if((_x select 0) == "SignM_FOB_Revolve_EP1")then{
			_obj setVehicleInit "this setObjectTexture [0, ""custom\addons\bon_recruit_units\PMC.jpg""];"; //apply diffrent texture to the sign at some point
		};
	}forEach _objects;
	processInitCommands;
	diag_log "[PMC_CONTRACTOR]: PMC Contractor Build ... Server Broadcasting Location for Client Markers";
	PV_PMC_Contractor = _coords;
	publicVariable "PV_PMC_Contractor";
};

// Client stuff...
if(!isDedicated) exitWith{
	diag_log "[PMC_CONTRACTOR]: Client waiting for Trader Position ...";
	waitUntil {sleep 1;(!isNil "PV_PMC_Contractor")};
	//create marker
	if(_useLocalMarkers)then{
		_marker = createMarkerLocal ["PMC_Contractor", PV_PMC_Contractor];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "Pickup";
		_marker setMarkerTextLocal "PMC Contractor";
		_marker setMarkerColorLocal "ColorBlack";
		diag_log "[PMC_CONTRACTOR]: Client created local markers ...";
	}else{
		if (getMarkerColor "PMC_Contractor" == "") then {
			_marker = createMarker ["PMC_Contractor", PV_PMC_Contractor];
			_marker setMarkerShape "ICON";
			_marker setMarkerType "Pickup";
			_marker setMarkerText "PMC Contractor";
			_marker setMarkerColor "ColorBlack";
			diag_log "[PMC_CONTRACTOR]: Client created markers ...";
		};
	};
	PV_PMC_Contractor = nil;
};