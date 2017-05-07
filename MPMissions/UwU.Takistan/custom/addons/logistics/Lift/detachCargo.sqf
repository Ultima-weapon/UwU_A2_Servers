private ["_vel","_name_cargo","_chopper","_cargo","_cantsee"];
_chopper   = vehicle player;
_cargo = _chopper getVariable "BTC Lift Object";
_cantsee = lineIntersects [getposASL(_chopper), getposASL(_cargo), _chopper, _cargo];
if (!_cantsee) then {
	BTC_lifted = 0;
	_chopper removeAction BTC_SganciaActionId;
	detach _cargo;
	_vel =  velocity _chopper;
	_cargo setVelocity _vel;

	_name_cargo  = getText (configFile >> "cfgVehicles" >> typeof _cargo >> "displayName");	
	vehicle player vehicleChat format ["%1 dropped", _name_cargo];
	[_chopper, _cargo, "ParachuteMediumWest"] spawn BTC_paradrop;
	
	_cargo lock false; // Enable players to re-enter the vehicle now it has been detached.
	VDZE_veh_Lock = [_cargo,false];
	publicVariable "PVDZE_veh_Lock";
	_cargo setVariable ["VehicleInTow", false, true];
	_cargo setVariable ["MFTowInTow", false, true];
	_chopper setVariable ["MFTowIsTowing", false, true];
	_chopper setVariable ["MFTowVehicleInTow", objNull, true];	
	PVDZE_veh_Update = [_cargo, "all"];
	publicVariableServer "PVDZE_veh_Update";
};