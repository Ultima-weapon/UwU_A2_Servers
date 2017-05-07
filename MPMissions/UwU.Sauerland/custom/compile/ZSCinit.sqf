#include "ZSCconfig.sqf"

call compile preprocessFileLineNumbers "custom\compile\player_traderMenu.sqf";
BIS_fnc_numberDigits = compile preprocessFileLineNumbers "custom\compile\numberDigits.sqf";
BIS_fnc_numberText = compile preprocessFileLineNumbers "custom\compile\numberText.sqf"; 
SC_fnc_removeCoins = compile preprocessFileLineNumbers "custom\compile\SC_fnc_removeCoins.sqf";
SC_fnc_addCoins = compile preprocessFileLineNumbers "custom\compile\SC_fnc_addCoins.sqf";
player_gearSet	=	compile preprocessFileLineNumbers "custom\compile\player_gearSet.sqf";
//This overwrite must happen, or change the files in your version of it. I Don't know any mod that changes this file tbh.


/*end overwrites*/

BankDialogTransferAmount = 13000;
BankDialogPlayerBalance = 13001;
BankDialogBankBalance = 13002;
SCTraderDialogCatList = 32000;
SCTraderDialogItemList = 32001;
SCTraderDialogBuyPrice = 32002;
SCTraderDialogSellPrice = 32003;
GivePlayerDialogTransferAmount = 14000;
GivePlayerDialogPlayerBalance = 14001;

BankDialogUpdateAmounts = {
	_vehicleType = typeOf ZSC_CurrentStorage; 
	if(isClass(configFile >> "CfgVehicles" >> _vehicleType ))then{									
		_vehicleMagazines = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportMaxMagazines");
		_displayName = getText  (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");		
		_sizeOfMoney = _vehicleMagazines * ZSC_MaxMoneyInStorageMultiplier;		
		ctrlSetText [2701, format["%1", _displayName]];
		ctrlSetText [BankDialogPlayerBalance, format["%1 %2", [player getVariable ['cashMoney', 0]] call BIS_fnc_numberText, CurrencyName]];
		ctrlSetText [BankDialogBankBalance, format["%1 / %3 %2", [ZSC_CurrentStorage getVariable ['bankMoney', 0]] call BIS_fnc_numberText, CurrencyName, [_sizeOfMoney] call BIS_fnc_numberText]];
	}else{
		ctrlSetText [BankDialogPlayerBalance, format["Can not get vehicle capacity!","test"]];
		ctrlSetText [BankDialogBankBalance, format["Can not get vehicle capacity!","test"]];
	};
	
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", [player getVariable ['cashMoney', 0]] call BIS_fnc_numberText, CurrencyName]];
	ctrlSetText [14003, format["%1", (name ZSC_GiveMoneyTarget)]];
};

BankDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];
	
	_amount = parseNumber (_this select 0);	
	_bank = ZSC_CurrentStorage getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];
	_vehicleType = typeOf ZSC_CurrentStorage; 
	_displayName = getText  (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");		

	if (_amount < 1 or _amount > _bank) exitWith {
		cutText [format["You can not withdraw more than is in the %1.",_displayName], "PLAIN DOWN"];
	};

	player setVariable["cashMoney",(_wealth + _amount),true];
	ZSC_CurrentStorage setVariable["bankMoney",(_bank - _amount),true];

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	
	PVDZE_veh_Update = [ZSC_CurrentStorage,"gear"];
	publicVariableServer "PVDZE_veh_Update";

	cutText [format["You have withdrawn %1 %2 out of the %3", [_amount] call BIS_fnc_numberText, CurrencyName,_displayName], "PLAIN DOWN"];
};

BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];	
	_vehicleType = typeOf ZSC_CurrentStorage; 	
	_maxCap = 0;	
	_displayName = "Storage";
	if(isClass(configFile >> "CfgVehicles" >> _vehicleType ))then{	
		_displayName = getText  (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");		
		_vehicleMagazines = getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "transportMaxMagazines");		
		_maxCap = _vehicleMagazines * ZSC_MaxMoneyInStorageMultiplier;	
	}else{		
		_displayName = "Unknown";
	};

	_amount = parseNumber (_this select 0);
	_bank = ZSC_CurrentStorage getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];
	
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not deposit more than you have.", "PLAIN DOWN"];
	};

	if( ((_bank + _amount ) >  _maxCap)) then{		
			cutText [format["You can only store a max of %1 %2 in this %3.", [_maxCap] call BIS_fnc_numberText,CurrencyName,_displayName], "PLAIN DOWN"];
	}else{	
		player setVariable["cashMoney",(_wealth - _amount),true];
		ZSC_CurrentStorage setVariable["bankMoney",(_bank + _amount),true];
		cutText [format["You have deposited %1 %2 in the %3.", [_amount] call BIS_fnc_numberText, CurrencyName,_displayName], "PLAIN DOWN"];
	};
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	
	PVDZE_veh_Update = [ZSC_CurrentStorage,"gear"];
	publicVariableServer "PVDZE_veh_Update";
};

GivePlayerAmount = {
	private ["_amount","_target","_wealth","_twealth","_InTrd","_newWealth","_newTWealth","_AntiDupePublicMessage"];
	
	_amount = parseNumber (_this select 0);
	_target = ZSC_GiveMoneyTarget;
	_wealth = player getVariable["cashMoney",0];
	_twealth = _target getVariable["cashMoney",0];
	_InTrd = _target getVariable ["TrBsy",false];

	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
    };

	if (!(isPlayer ZSC_GiveMoneyTarget)) exitWith {
		cutText ["You can only give money to a player", "PLAIN DOWN"];
	};
	
	if (_InTrd) exitWith {
		cutText ["Other Player is busy, please wait...", "PLAIN DOWN"];
	};

	PVDZE_account_Doublecheck = [player];
	publicVariableServer "PVDZE_account_Doublecheck";
	player setVariable["cashMoney",_wealth - _amount, true];
	_target setVariable["cashMoney",_twealth + _amount, true];

	PVDZE_plr_Save = [player,(magazines player),true,true];
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_plr_Save = [_target,(magazines _target),true,true];
	publicVariableServer "PVDZE_plr_Save";

	uiSleep 1;
	_newWealth = player getVariable["cashMoney",0];
	_newTWealth = _target getVariable["cashMoney",0];
	if ((_wealth - _amount == _newWealth) && (_twealth + _amount == _newTWealth)) then {
		cutText [format["You gave %1 %2.", _amount, CurrencyName], "PLAIN DOWN"];
	} else {
		player setVariable["cashMoney",0,true];
		PVDZE_plr_Save = [player,(magazines player),true,true] ;
		publicVariableServer "PVDZE_plr_Save";
		_AntiDupePublicMessage = format["%1 and %2 attempted to dupe money. As penalty, their coins have been set to zero.", name player, name _target];
		[nil,nil,rTitleText,_AntiDupePublicMessage,"PLAIN DOWN",10] call RE;
	};
};