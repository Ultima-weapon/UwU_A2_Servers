if(InstantTrading) then {

private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_bos","_bag","_class","_started","_finished","_animState","_isMedic","_num_removed","_needed","_activatingPlayer","_buy_o_sell","_textPartIn","_textPartOut","_traderID","_abort","_msg","_humRank"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };

DZE_ActionInProgress = true;

_activatingPlayer = player;
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
_traderID = (_this select 3) select 7;
_bos = 0;
_abort = false;
_msg = "";

if(_buy_o_sell == "buy") then {
	_qty = player getVariable ["cashMoney",0];
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(!isNil "_class") then {
		if(_class != "") then {
			_abort = true;
			_msg = "Drop or sell your current backpack before you can buy a new one.";
		};
	};
} else {
	_bos = 1;
	_qty = 0;
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(_class == _part_in) then {
		_qty = 1;
	};
};

if (_abort) exitWith {
	cutText [_msg, "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];

	[1,1] call dayz_HungerThirst;

	private["_newPosition","_finished","_oldPosition"];
    if(isNil "_oldPosition") then { _oldPosition = position player;};
    _finished = false;
    sleep 2;
    if (player distance _oldPosition <= 1) then {
        _finished = true;
    };
    if (!_finished) exitWith {
        DZE_ActionInProgress = false;
        r_autoTrade = false;
        cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
    };


	if (_finished) then {

		if(_buy_o_sell == "buy") then {
			_qty = player getVariable ["cashMoney",0];
		} else {
			_qty = 0;
			_bag = unitBackpack player;
			_class = typeOf _bag;
			if(_class == _part_in) then {
				_qty = 1;
			};
		};

		if (_qty >= _qty_in) then {

			if (isNil "_bag") then { _bag = "Unknown Backpack" };
			if (isNil "inTraderCity") then {
				inTraderCity = "Unknown Trader"; 
			} else {
				if (inTraderCity == "Any") then {
					inTraderCity = "Unknown Trader"; 
				};
			};
			
			if (_bos == 1) then {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,CurrencyName,_qty_out];
			} else {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,CurrencyName,_qty_in];
			};

			publicVariableServer  "PVDZE_obj_Trade";

			waitUntil {!isNil "dayzTradeResult"};

			if(dayzTradeResult == "PASS") then {

				if(_buy_o_sell == "buy") then {

					_qtychange = _qty - _qty_in;
					player setVariable ["cashMoney", _qtychange , true];
					_newM = player getVariable ["cashMoney",0];

					_num_removed = _qty - _newM;

					if(_num_removed == _qty_in) then {
						removeBackpack player;
						player addBackpack _part_out;
					};
				} else {
				
					if((typeOf (unitBackpack player)) == _part_in) then {

						removeBackpack player;

						_myMoney = player getVariable ["cashMoney",0];
						_myMoney = _myMoney + _qty_out;

						player setVariable ["cashMoney", _myMoney , true];

					};
				};
				cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;
			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};
} else {
	_needed =  _qty_in - _qty;
	cutText [format["You need %1 %2",_needed,_textPartIn] , "PLAIN DOWN"];
};

DZE_ActionInProgress = false;

} else {

private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_bos","_bag","_class","_started","_finished","_animState","_isMedic","_num_removed","_needed","_activatingPlayer","_buy_o_sell","_textPartIn","_textPartOut","_traderID","_abort","_msg","_humRank"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };

DZE_ActionInProgress = true;

_activatingPlayer = player;
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
_traderID = (_this select 3) select 7;
_bos = 0;
_abort = false;
_msg = "";

if(_buy_o_sell == "buy") then {
	_qty = player getVariable ["cashMoney",0];
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(!isNil "_class") then {
		if(_class != "") then {
			_abort = true;
			_msg = "Drop or sell your current backpack before you can buy a new one.";
		};
	};
} else {
	_bos = 1;
	_qty = 0;
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(_class == _part_in) then {
		_qty = 1;
	};
};

if (_abort) exitWith {
	cutText [_msg, "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];

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

	if (_finished) then {

		if(_buy_o_sell == "buy") then {
			_qty = player getVariable ["cashMoney",0];
		} else {
			_qty = 0;
			_bag = unitBackpack player;
			_class = typeOf _bag;
			if(_class == _part_in) then {
				_qty = 1;
			};
		};

		if (_qty >= _qty_in) then {

			if (isNil "_bag") then { _bag = "Unknown Backpack" };
			if (isNil "inTraderCity") then {
				inTraderCity = "Unknown Trader"; 
			} else {
				if (inTraderCity == "Any") then {
					inTraderCity = "Unknown Trader"; 
				};
			};
			
			if (_bos == 1) then {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,CurrencyName,_qty_out];
			} else {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,CurrencyName,_qty_in];
			};

			publicVariableServer  "PVDZE_obj_Trade";

			waitUntil {!isNil "dayzTradeResult"};

			if(dayzTradeResult == "PASS") then {

				if(_buy_o_sell == "buy") then {

					_qtychange = _qty - _qty_in;
					player setVariable ["cashMoney", _qtychange , true];
					_newM = player getVariable ["cashMoney",0];

					_num_removed = _qty - _newM;

					if(_num_removed == _qty_in) then {
						removeBackpack player;
						player addBackpack _part_out;
					};
				} else {
				
					if((typeOf (unitBackpack player)) == _part_in) then {

						removeBackpack player;

						_myMoney = player getVariable ["cashMoney",0];
						_myMoney = _myMoney + _qty_out;

						player setVariable ["cashMoney", _myMoney , true];

					};
				};
				cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;
			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};
} else {
	_needed =  _qty_in - _qty;
	cutText [format["You need %1 %2",_needed,_textPartIn] , "PLAIN DOWN"];
};

DZE_ActionInProgress = false;

};