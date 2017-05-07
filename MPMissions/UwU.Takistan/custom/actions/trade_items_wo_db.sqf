private ["_part_out","_part_in","_qty_out","_qty_in","_textPartIn","_textPartOut","_qty","_needed","_started","_finished","_animState","_isMedic","_abort","_removed","_tradeCounter","_total_trades","_humanityGain","_humanity","_money","_humRank"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };

DZE_ActionInProgress = true;

_part_out = (_this select 3) select 0;
_part_in = (_this select 3) select 1;
_qty_out = (_this select 3) select 2;
_qty_in = (_this select 3) select 3;

_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {_qty_in = _qty_in;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {_qty_in = round(_qty_in*0.95);};
if(_humRank >= 10000 && _humRank < 15000) then {_qty_in = round(_qty_in*0.90);};
if(_humRank >= 15000 && _humRank < 25000) then {_qty_in = round(_qty_in*0.85);};
if(_humRank >= 25000 && _humRank < 40000) then {_qty_in = round(_qty_in*0.80);};
if(_humRank >= 40000 && _humRank < 60000) then {_qty_in = round(_qty_in*0.75);};
if(_humRank >= 60000 && _humRank < 90000) then {_qty_in = round(_qty_in*0.70);};
if(_humRank >= 90000 && _humRank < 130000) then {_qty_in = round(_qty_in*0.65);};
if(_humRank >= 130000 && _humRank < 185000) then {_qty_in = round(_qty_in*0.60);};
if(_humRank >= 185000 && _humRank < 250000) then {_qty_in = round(_qty_in*0.55);};
if(_humRank >= 250000) then {_qty_in = round(_qty_in*0.50);};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {_qty_in = round(_qty_in*0.99);};
if(_humRank <= -10000 && _humRank > -15000) then {_qty_in = round(_qty_in*0.98);};
if(_humRank <= -15000 && _humRank > -25000) then {_qty_in = round(_qty_in*0.97);};
if(_humRank <= -25000 && _humRank > -40000) then {_qty_in = round(_qty_in*0.96);};
if(_humRank <= -40000 && _humRank > -60000) then {_qty_in = round(_qty_in*0.95);};
if(_humRank <= -60000 && _humRank > -90000) then {_qty_in = round(_qty_in*0.94);};
if(_humRank <= -90000 && _humRank > -130000) then {_qty_in = round(_qty_in*0.93);};
if(_humRank <= -130000 && _humRank > -185000) then {_qty_in = round(_qty_in*0.92);};
if(_humRank <= -185000 && _humRank > -250000) then {_qty_in = round(_qty_in*0.91);};
if(_humRank <= -250000) then {_qty_in = round(_qty_in*0.90);};

_buy_o_sell = (_this select 3) select 4;
_textPartIn = (_this select 3) select 5;
_textPartOut = (_this select 3) select 6;
_qty = player getVariable ["cashMoney",0];
_total_trades = floor (_qty / _qty_in);

systemChat format ['_part_out = %1 , _part_in = %2 ,_qty_out = %3 , _qty_in =  %4,_textPartIn = %5, _textPartOut = %6, _qty = %7 ',_part_out,_part_in,_qty_out,_qty_in,_textPartIn,_textPartOut];

if( _total_trades > 12 ) then {_total_trades = 12;};

if(_total_trades < 1) exitWith { 
	_needed =  _qty_in - _qty;
	cutText [format[(localize "str_epoch_player_184"),_needed,_textPartIn] , "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

_abort = false;
_tradeCounter = 0;

for "_x" from 1 to _total_trades do {

	_removed = 0;
	_tradeCounter = _tradeCounter + 1;

	if(_total_trades == 1) then {
		cutText [format[(localize "str_epoch_player_105"),_tradeCounter,_total_trades] , "PLAIN DOWN"];
	} else {
		cutText [format[(localize "str_epoch_player_187"),_tradeCounter,_total_trades] , "PLAIN DOWN"];
	};

	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";

	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;

	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	r_doLoop = false;

	if (!_finished) exitWith { 
		r_interrupt = false;
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
	};

	_qty = {_x == _part_in} count magazines player;

	if (_qty >= _qty_in) then {
	
		_removed = _removed + ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
		if (_removed == _qty_in) then {
			
			_humanityGain = 0;
			for "_x" from 1 to _qty_out do {
				player addMagazine _part_out;
				if(_part_out == "FoodBioMeat") then {
					_humanityGain = _humanityGain + 20;
				};
			};
			if(_humanityGain > 0) then {
				_humanity = player getVariable["humanity",0];
				_humanity = _humanity + _humanityGain;
				player setVariable["humanity",_humanity,true];
			};

			cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
			
		} else {
			for "_x" from 1 to _removed do {
				player addMagazine _part_in;
			};
			_abort = true;
		};	
	} else {
		_needed =  _qty_in - _qty;
		cutText [format[(localize "str_epoch_player_184"),_needed,_textPartIn] , "PLAIN DOWN"];
	};
	sleep 1;
	if(_abort) exitWith {};
};

DZE_ActionInProgress = false;