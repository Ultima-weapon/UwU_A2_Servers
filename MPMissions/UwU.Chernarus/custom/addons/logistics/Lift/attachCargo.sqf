private ["_chopper","_name_cargo","_cargo_pos","_rel_pos","_height","_text_action","_cargo"];
_cargo = (_this select 3) select 0;

if ((count (crew _cargo)) == 0) then {
	BTC_lifted = 1;

	_chopper = vehicle player;
	_chopper removeAction BTC_liftActionId;

	_name_cargo  = (_this select 3) select 1;

	_cargo_pos    = getPosATL _cargo;
	_rel_pos      = _chopper worldToModel _cargo_pos;
	_height       = (_rel_pos select 2) + 2.5;
	
	if((_cargo getVariable ["MF_Tow_Cannot_Tow", false]) || (locked _cargo)) exitWith { 
		cutText [format["Cannot lift %1 because it is locked.", _name_cargo], "PLAIN DOWN"];
		_chopper removeAction BTC_SganciaActionId;
		BTC_lifted = 0;
		BTC_lift = 1;
	}; // Check if the vehicle we want to lift is locked

	_cargo attachTo [_chopper, [0, 0, _height]];
	_chopper  setVariable ["BTC Lift Object", _cargo, true];
	vehicle player vehicleChat format ["%1 lifted", _name_cargo];
	
	_text_action = ("<t color=""#ED2744"">" + "Drop " + (_name_cargo) + "</t>");
	BTC_SganciaActionId = _chopper addAction [_text_action, "custom\addons\logistics\Lift\detachCargo.sqf", "", 7, false, false]; 
	
	_cargo lock true; // Disable entering the vehicle while it is in tow.
	VDZE_veh_Lock = [_cargo,true];
	publicVariable "PVDZE_veh_Lock";
	_cargo setVariable ["VehicleInTow", true, true];
	_cargo setVariable ["MFTowInTow", true, true];
	_chopper setVariable ["MFTowIsTowing", true, true];
	_chopper setVariable ["MFTowVehicleInTow", _cargo, true];
};