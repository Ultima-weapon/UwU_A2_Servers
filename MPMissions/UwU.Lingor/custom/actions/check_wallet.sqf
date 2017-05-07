private ["_body", "_hisMoney", "_myMoney", "_killsH", "_test2", "_headShots", "_test","_playeridke","_humanity","_humRank","_isPlayer"];

_body = _this select 3;

_PlayerNear = _body call dze_isnearest_player;
if (_PlayerNear) exitWith {cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

_name = _body getVariable ["bodyName","unknown"];

_hisMoney = _body getVariable ["cashMoney",0];
_isPlayer = _body getVariable ["CharacterID","0"];
if(_isPlayer == "0") then {
	_humRank = player getVariable['humanity', 0];
	// NO RANK
	if(_humRank < 5000 && _humRank > -5000) then {_hisMoney = _hisMoney;};
	// HERO RANK
	if(_humRank >= 5000 && _humRank < 10000) then {_hisMoney = round(_hisMoney*1.05);};
	if(_humRank >= 10000 && _humRank < 15000) then {_hisMoney = round(_hisMoney*1.10);};
	if(_humRank >= 15000 && _humRank < 25000) then {_hisMoney = round(_hisMoney*1.15);};
	if(_humRank >= 25000 && _humRank < 40000) then {_hisMoney = round(_hisMoney*1.20);};
	if(_humRank >= 40000 && _humRank < 60000) then {_hisMoney = round(_hisMoney*1.25);};
	if(_humRank >= 60000 && _humRank < 90000) then {_hisMoney = round(_hisMoney*1.30);};
	if(_humRank >= 90000 && _humRank < 130000) then {_hisMoney = round(_hisMoney*1.35);};
	if(_humRank >= 130000 && _humRank < 185000) then {_hisMoney = round(_hisMoney*1.40);};
	if(_humRank >= 185000 && _humRank < 250000) then {_hisMoney = round(_hisMoney*1.45);};
	if(_humRank >= 250000) then {_hisMoney = round(_hisMoney*1.50);};
	// BANDIT RANK
	if(_humRank <= -5000 && _humRank > -10000) then {_hisMoney = round(_hisMoney*1.01);};
	if(_humRank <= -10000 && _humRank > -15000) then {_hisMoney = round(_hisMoney*1.02);};
	if(_humRank <= -15000 && _humRank > -25000) then {_hisMoney = round(_hisMoney*1.03);};
	if(_humRank <= -25000 && _humRank > -40000) then {_hisMoney = round(_hisMoney*1.04);};
	if(_humRank <= -40000 && _humRank > -60000) then {_hisMoney = round(_hisMoney*1.05);};
	if(_humRank <= -60000 && _humRank > -90000) then {_hisMoney = round(_hisMoney*1.06);};
	if(_humRank <= -90000 && _humRank > -130000) then {_hisMoney = round(_hisMoney*1.07);};
	if(_humRank <= -130000 && _humRank > -185000) then {_hisMoney = round(_hisMoney*1.08);};
	if(_humRank <= -185000 && _humRank > -250000) then {_hisMoney = round(_hisMoney*1.09);};
	if(_humRank <= -250000) then {_hisMoney = round(_hisMoney*1.10);};
};
	
_myMoney = player getVariable ["cashMoney",0];
	
_myMoney = _myMoney + _hisMoney;
_body setVariable ["cashMoney", 0 , true];

if(typeName (_myMoney) == "SCALAR")then{
    player setVariable ["cashMoney", _myMoney , true];
};
systemChat format ['You took %1 coins, ID says %2 !',_hisMoney,_name];

player removeAction s_player_checkwallet;	
s_player_checkwallet = -1;