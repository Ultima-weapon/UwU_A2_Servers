_unit = _this select 0;

_id = _this select 2;

//_unit = ((_this select 3)select 0);
//player removeAction _id;

_unit removeAction _id;

sleep 2;

hint format["%1: %2 has been dismissed",getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayname"),name _unit];

PV_requestServerunit = [false,player,_unit];
publicVariableServer "PV_requestServerunit";
