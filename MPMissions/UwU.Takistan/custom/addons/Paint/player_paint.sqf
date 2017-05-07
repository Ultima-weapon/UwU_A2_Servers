private ["_txt","_coins","_vehicle","_humRank"];
VehicleToPaint = _this select 3;
_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {ColourPrice = 50000;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {ColourPrice = 45000;};
if(_humRank >= 10000 && _humRank < 15000) then {ColourPrice = 40000;};
if(_humRank >= 15000 && _humRank < 25000) then {ColourPrice = 35000;};
if(_humRank >= 25000 && _humRank < 40000) then {ColourPrice = 30000;};
if(_humRank >= 40000 && _humRank < 60000) then {ColourPrice = 25000;};
if(_humRank >= 60000 && _humRank < 90000) then {ColourPrice = 20000;};
if(_humRank >= 90000 && _humRank < 130000) then {ColourPrice = 15000;};
if(_humRank >= 130000 && _humRank < 185000) then {ColourPrice = 10000;};
if(_humRank >= 185000 && _humRank < 250000) then {ColourPrice = 5000;};
if(_humRank >= 250000) then {ColourPrice = 0;};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {ColourPrice = 45000;};
if(_humRank <= -10000 && _humRank > -15000) then {ColourPrice = 40000;};
if(_humRank <= -15000 && _humRank > -25000) then {ColourPrice = 35000;};
if(_humRank <= -25000 && _humRank > -40000) then {ColourPrice = 30000;};
if(_humRank <= -40000 && _humRank > -60000) then {ColourPrice = 25000;};
if(_humRank <= -60000 && _humRank > -90000) then {ColourPrice = 20000;};
if(_humRank <= -90000 && _humRank > -130000) then {ColourPrice = 15000;};
if(_humRank <= -130000 && _humRank > -185000) then {ColourPrice = 10000;};
if(_humRank <= -185000 && _humRank > -250000) then {ColourPrice = 5000;};
if(_humRank <= -250000) then {ColourPrice = 0;};
_coins = 'custom\interface\Money.paa'; //<- Change the path here to your Coin display image!
_vehicle = getText(configFile >> "cfgVehicles" >> (typeOf VehicleToPaint) >> "displayName");
createdialog "VehicleColourDialog";
_txt = format ["<t>It will cost %1 <img image='%2'/><br/>to repaint your %3.</t>",ColourPrice,_coins,_vehicle];
((uiNamespace getVariable "VehicleColourDialog") displayCtrl 5703) ctrlSetStructuredText parseText _txt;
