private["_originsBuilding","_typeOfOriginsBuilding","_action","_playerUID","_ownerUID","_state","_update","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_combinationEntry","_combinationStronghold","_isOK"];
_originsBuilding = _this select 0;
_typeOfOriginsBuilding = _this select 1;
_action = _this select 2;
_playerUID = _this select 3;
_ownerUID = _originsBuilding getVariable ["OwnerUID","0"];
_state = 0;
_update = false;
_combinationEntry = _this select 4;
_combinationStronghold = _originsBuilding getVariable ["CharacterID","0"];

if(_playerUID != _ownerUID && !(_playerUID in DoorAdminList) && !(_typeOfOriginsBuilding in DZE_Origins_Stronghold)) exitWith { diag_log("Origins: House is not yours");};
if(_typeOfOriginsBuilding in DZE_Origins_Stronghold && _combinationEntry != _combinationStronghold) exitWith{diag_log("Origins: Wrong Stronghold Code");};

if(!_action) then {
	_state = 1;
	_update = true;
};

if(_typeOfOriginsBuilding in DZE_Origins_Garages) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['dvereGarazLeve','vrataGaraz','dvereGarazPrave','dvereGarazLeveDva','dvereGarazPraveDva','vrataGarazLeve','vrataGarazPrave','vrataGaraz2','dvereJednaC'];
};
 if(_typeOfOriginsBuilding in DZE_Origins_Houses) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['vratka','dvereJednaA','vratkaDva','dvereJedna','dvere1'];
};
if(_typeOfOriginsBuilding in DZE_Origins_Stronghold) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['vrata','hride1','kolo1','vaha','kolo2','svich'];
};
if(!_update) then {
	private["_inventory"];
	_originsBuilding setVariable ["WeaponCargo", getWeaponCargo _originsBuilding,true];
    _originsBuilding setVariable ["MagazineCargo", getMagazineCargo  _originsBuilding,true];
    _originsBuilding setVariable ["BackpackCargo", getBackpackCargo  _originsBuilding,true];
	clearWeaponCargoGlobal  _originsBuilding;
	clearMagazineCargoGlobal  _originsBuilding;
	clearBackpackCargoGlobal _originsBuilding;
	_inventory = [
		getWeaponCargo _originsBuilding,
		getMagazineCargo _originsBuilding,
		getBackpackCargo _originsBuilding,
		_originsBuilding getVariable["bankMoney",0]
	];
	_originsBuilding setVariable["lastInventory",_inventory];
} else {
	clearWeaponCargoGlobal  _originsBuilding;
	clearMagazineCargoGlobal  _originsBuilding;
	clearBackpackCargoGlobal _originsBuilding;
	_weapons = 	_originsBuilding getVariable["WeaponCargo",[]];
	_magazines = _originsBuilding getVariable["MagazineCargo",[]];
	_backpacks = _originsBuilding getVariable["BackpackCargo",[]];
	if (count _weapons > 0) then {
		//Add weapons
		_objWpnTypes = 	_weapons select 0;
		_objWpnQty = 	_weapons select 1;
		_countr = 0;
		{
			if(_x in (DZE_REPLACE_WEAPONS select 0)) then {
				_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
			};
			_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
			if (_isOK) then {
				_originsBuilding addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
			};
			_countr = _countr + 1;
		} count _objWpnTypes;
		/* //OLD CODE
		{
			_originsBuilding addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
			_countr = _countr + 1;
		} count _objWpnTypes;
		*/
	};

	if (count _magazines > 0) then {
		//Add Magazines
		_objWpnTypes = _magazines select 0;
		_objWpnQty = _magazines select 1;
		_countr = 0;
		{
			if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
			if (_x == "ItemTent") then { _x = "ItemTentOld" };
			_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
			if (_isOK) then {
				_originsBuilding addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
			};
			_countr = _countr + 1;
		} count _objWpnTypes;
		/* // OLD CODE
		{
			if( _x != "CSGAS" ) then
			{
				_originsBuilding addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			};
		} count _objWpnTypes;
		*/
	};

	if (count _backpacks > 0) then {
		//Add Backpacks
		_objWpnTypes = _backpacks select 0;
		_objWpnQty = _backpacks select 1;
		_countr = 0;
		{
			_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
			if (_isOK) then {
				_originsBuilding addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
			};
			_countr = _countr + 1;
		} count _objWpnTypes;
		/* // OLD CODE
		{
			_originsBuilding addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
			_countr = _countr + 1;
		} count _objWpnTypes;
		*/
	};
};
_originsBuilding setVariable ["CanBeUpdated",_update, true];