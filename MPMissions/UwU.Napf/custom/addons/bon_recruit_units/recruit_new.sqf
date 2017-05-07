//Created by HALV
//Idea from Bon_Inf*

_unittype = _this select 0;
if(isNil "HALV_unitprocessing")then{HALV_unitprocessing = false;};
if(HALV_unitprocessing)exitWith{_msg = "<System>: You already have a Recruit processing ...";hint _msg;systemChat _msg;};
if((count (units group player)) > (bon_max_units_allowed)) exitWith {hint "You can not hire more mercenaries";systemChat "<System>: You can not hire more mercenaries";};
showCommandingMenu '';

/********************* AI PRICE ********************/
_UNIT1_PRICE = 5000;
_UNIT2_PRICE = 10000;
_UNIT3_PRICE = 15000;
_UNIT4_PRICE = 15000;
_UNIT5_PRICE = 20000;
_UNIT6_PRICE = 25000;
_UNIT7_PRICE = 25000;
_UNIT8_PRICE = 50000;
_UNIT9_PRICE = 75000;
_UNIT10_PRICE = 75000;
_UNIT11_PRICE = 75000;
/*******************************************************/

_fixedscore = 10000;

_create_queue = {
HALV_unitprocessing = true;

closeDialog 0;
//disableUserInput true;
player playActionNow "Medic";
_displname = getText (configFile >> "CfgVehicles" >> _unittype >> "displayName");

hint parseText format["<t size='1.0' font='Zeppelin33' color='#ef2525'>%1</t> " + " added to queue.",_displname];

_score = rating player;

/*
_msg = format["Player rating before check: %1",_score];
systemChat _msg;
diag_log _msg;
*/
if(_score < _fixedscore)then{
	player addRating ((_score*-1) + _fixedscore);
};
/*
_score = rating player;
_msg = format["Player rating after check: %1",_score];
systemChat _msg;
diag_log _msg;
*/
sleep 1.5;
hint parseText format["Processing your" + " <t size='1.0' font='Zeppelin33' color='#ffd800'>%1</t>.",_displname];
sleep 4.5;
player playActionNow "Medic";
sleep 4;

PV_requestServerunit = [true,player,_unittype];
publicVariableServer "PV_requestServerunit";

hint parseText format["<t size='1.0' font='Zeppelin33' color='#008aff'>%1</t>" + " has arrived.",_displname];

//disableUserInput false;
//titleText ["WARNING:\nALL Recruits Ammunition is Removed Near SafeZone Areas!","PLAIN DOWN",10];
HALV_unitprocessing = false;
};

Private ["_humRank"];
_humRank = player getVariable['humanity', 0];

switch(_unittype)do
{
	case "Soldier_Bodyguard_AA12_PMC_DZ":
	{
		if (!([player, _UNIT1_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT1_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT1_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "FR_Rodriguez_DZ":
	{
		if(_humRank < 5000 && _humRank > -5000) exitWith {cutText ["[HERO]/[BANDIT] Rank 1 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT2_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT2_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT2_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "FR_OHara_DZ":
	{
		if(_humRank < 10000 && _humRank > -10000) exitWith {cutText ["[HERO]/[BANDIT] Rank 2 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT3_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT3_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT3_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Soldier_Sniper_PMC_DZ":
	{
		if(_humRank < 15000 && _humRank > -15000) exitWith {cutText ["[HERO]/[BANDIT] Rank 3 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT4_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT4_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT4_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Camo1_DZ":
	{
		if(_humRank < 25000 && _humRank > -25000) exitWith {cutText ["[HERO]/[BANDIT] Rank 4 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT5_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT5_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT5_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Graves_Light_DZ":
	{
		if(_humRank < 40000 && _humRank > -40000) exitWith {cutText ["[HERO]/[BANDIT] Rank 5 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT6_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT6_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT6_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Soldier1_DZ":
	{
		if(_humRank < 60000 && _humRank > -60000) exitWith {cutText ["[HERO]/[BANDIT] Rank 6 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT7_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT7_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT7_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Rocket_DZ":
	{
		if(_humRank < 90000 && _humRank > -90000) exitWith {cutText ["[HERO]/[BANDIT] Rank 7 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT8_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT8_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT8_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "Sniper1_DZ":
	{
		if(_humRank < 130000 && _humRank > -130000) exitWith {cutText ["[HERO]/[BANDIT] Rank 8 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT9_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT9_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT9_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "CZ_Soldier_Sniper_EP1_DZ":
	{
		if(_humRank < 185000 && _humRank > -185000) exitWith {cutText ["[HERO]/[BANDIT] Rank 9 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT10_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT10_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT10_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
	case "CZ_Special_Forces_GL_DES_EP1_DZ":
	{
		if(_humRank < 250000 && _humRank > -250000) exitWith {cutText ["[HERO]/[BANDIT] Rank 10 is required.", "PLAIN DOWN"];};
		if (!([player, _UNIT11_PRICE] call SC_fnc_removeCoins)) then 
		{
			systemChat(format["Recruiting this unit costs %1 %2. You have insufficient funds.", _UNIT11_PRICE, CurrencyName ]);
		}else
		{
			systemChat(format["Thank you for your payment!", _UNIT11_PRICE, CurrencyName]);
			call _create_queue;	
		};
	};
};