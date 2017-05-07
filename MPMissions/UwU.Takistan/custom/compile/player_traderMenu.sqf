TraderDialogCatList = 12000;
TraderDialogItemList = 12001;
TraderDialogBuyPrice = 12002;
TraderDialogSellPrice = 12003;
TraderDialogBuyBtn = 12004;
TraderDialogSellBtn = 12005;
TraderDialogCurrency = 12006;
TraderCurrentCatIndex = -1;
TraderCatList = [];
TraderItemList = [];

TraderDialogLoadItemList = {
	private ["_index","_trader_id","_activatingPlayer","_distance","_objclass","_item_list"];
	TraderItemList = [];
	_index = _this select 0;

	LastTraderSelectCategory = _index;
	if (_index < 0) exitWith {};
	//TraderCurrentCatIndex = _index;

	_trader_id = TraderCatList select _index;
	_activatingPlayer = player;

	lbClear TraderDialogItemList;
	ctrlSetText [TraderDialogBuyPrice, ""];
	ctrlSetText [TraderDialogSellPrice, ""];

	_cfgTraderCategory = missionConfigFile >> "CfgTraderCategory" >> (format["Category_%1",_trader_id]);	

	PVDZE_plr_TradeMenuResult = [];

	for "_i" from 0 to ((count _cfgTraderCategory) - 1) do {
		_class = configName (_cfgTraderCategory select _i);
		
		_type  = getText ((_cfgTraderCategory select _i) >> "type");	
		_buy  = getArray ((_cfgTraderCategory select _i) >> "buy");	
		_sell = getArray ((_cfgTraderCategory select _i) >> "sell");
		
		_buy set [2,1];
		_sell set [2,1];
		
		_typeNum = 1;
		
		if (_type == "trade_weapons") then {
			_typeNum = 3;
		} else { 
			if (_type in ["trade_backpacks", "trade_any_vehicle", "trade_any_vehicle_free", "trade_any_boat", "trade_any_bicycle"]) then {
				_typeNum = 2;
			};
		};

		_data = [9999,[_class,_typeNum],99999,_buy,_sell,0,_trader_id,_type];

		PVDZE_plr_TradeMenuResult set [count PVDZE_plr_TradeMenuResult, _data];
	};

	lbClear TraderDialogItemList;
	_item_list = [];
	{
		private ["_header", "_item", "_name", "_type", "_textPart", "_qty", "_buy", "_bqty", "_bname", "_btype", "_btextCurrency", "_sell", "_sqty", "_sname", "_stype", "_stextCurrency", "_order", "_order", "_afile", "_File", "_count", "_bag", "_bagclass", "_index", "_image"];
		_header = _x select 0;
		_item = _x select 1;
		_name = _item select 0;
		_type = _item select 1;
		switch (true) do {
			case (_type == 1): {
				_type = "CfgMagazines";
			}; 
			case (_type == 2): {
				_type = "CfgVehicles";
			}; 
			case (_type == 3): {
				_type = "CfgWeapons";
			};
		};

		_textPart = getText(configFile >> _type >> _name >> "displayName");
		
		_qty = _x select 2;
		
		_buy = _x select 3;
		_bqty = _buy select 0;
		_bname = _buy select 1;
		_btype = _buy select 2;
		switch(true)do{ 
			case (_btype == 1): { 
				_btype = "CfgMagazines";
			}; 
			case (_btype == 2): { 
				_btype = "CfgVehicles";
			}; 
			case (_btype == 3): { 
				_btype = "CfgWeapons";
			}; 
		}; 

		_btextCurrency = CurrencyName;
		
		_sell = _x select 4;
		_sqty = _sell select 0;
		_sname = _sell select 1;
		_stype = _sell select 2;
		switch(true)do{ 
			case (_stype == 1): { 
				_stype = "CfgMagazines";
			}; 
			case (_stype == 2): { 
				_stype = "CfgVehicles";
			}; 
			case (_stype == 3): { 
				_stype = "CfgWeapons";
			}; 
		}; 

		_stextCurrency = CurrencyName;
		
		_order = _x select 5;
		
		_afile = _x select 7;
		_File = "custom\actions\" + _afile + ".sqf";
		
		_count = 0;
		if(_type == "CfgVehicles") then {
			if (_afile == "trade_backpacks") then {
				_bag = unitBackpack player;
				_bagclass = typeOf _bag;
				if(_name == _bagclass) then {
					_count = 1;
				};
			} else {
				if (isClass(configFile >> "CfgVehicles" >> _name)) then {
					_distance = dayz_sellDistance_vehicle;
					if (_name isKindOf "Air") then {
						_distance = dayz_sellDistance_air;
					};
					if (_name isKindOf "Ship") then {
						_distance = dayz_sellDistance_boat;
					};
					_count = {(typeOf _x) == _name} count (nearestObjects [player, [_name], _distance]);
				};
			};
		};

		if(_type == "CfgMagazines") then {
			_count = {_x == _name} count magazines player;
		};

		if(_type == "CfgWeapons") then {
			_count = {_x == _name} count weapons player;
		};

		_index = lbAdd [TraderDialogItemList, format["%1 (%2)", _textPart, _name]];

		if (_count > 0) then {
			lbSetColor [TraderDialogItemList, _index, [0, 1, 0, 1]];
		};

		_image = getText(configFile >> _type >> _name >> "picture");
		lbSetPicture [TraderDialogItemList, _index, _image];

		_item_list set [count _item_list, [
			_name,
			_textPart,
			_bqty,
			_bname,
			_btextCurrency,
			_sqty,
			_sname,
			_stextCurrency,
			_header,
			_File
		]];
	} forEach PVDZE_plr_TradeMenuResult;
	TraderItemList = _item_list;
	TraderCategoryLoadFinished = true;
};

TraderDialogShowPrices = {
	private ["_index","_item","_humRank"];

	_index = _this select 0;

	LastTraderSelectItem = _index;
	
	if (_index < 0) exitWith {};
	while {count TraderItemList < 1} do { sleep 1; };
	_item = TraderItemList select _index;
	
	_qty = {_x == (_item select 3)} count magazines player;
	
	_humRank = player getVariable['humanity', 0];
	// NO RANK
	if(_humRank < 5000 && _humRank > -5000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2", [_item select 2] call BIS_fnc_numberText, CurrencyName]];};
	// HERO RANK
	if(_humRank >= 5000 && _humRank < 10000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-5 percent)", [((_item select 2)*0.95)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 10000 && _humRank < 15000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-10 percent)", [((_item select 2)*0.90)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 15000 && _humRank < 25000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-15 percent)", [((_item select 2)*0.85)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 25000 && _humRank < 40000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-20 percent)", [((_item select 2)*0.80)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 40000 && _humRank < 60000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-25 percent)", [((_item select 2)*0.75)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 60000 && _humRank < 90000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-30 percent)", [((_item select 2)*0.70)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 90000 && _humRank < 130000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-35 percent)", [((_item select 2)*0.65)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 130000 && _humRank < 185000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-40 percent)", [((_item select 2)*0.60)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 185000 && _humRank < 250000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-45 percent)", [((_item select 2)*0.55)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank >= 250000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-50 percent)", [((_item select 2)*0.50)] call BIS_fnc_numberText, CurrencyName]];};
	// BANDIT RANK
	if(_humRank <= -5000 && _humRank > -10000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-1 percent)", [((_item select 2)*0.99)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -10000 && _humRank > -15000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-2 percent)", [((_item select 2)*0.98)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -15000 && _humRank > -25000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-3 percent)", [((_item select 2)*0.97)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -25000 && _humRank > -40000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-4 percent)", [((_item select 2)*0.96)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -40000 && _humRank > -60000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-5 percent)", [((_item select 2)*0.95)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -60000 && _humRank > -90000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-6 percent)", [((_item select 2)*0.94)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -90000 && _humRank > -130000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-7 percent)", [((_item select 2)*0.93)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -130000 && _humRank > -185000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-8 percent)", [((_item select 2)*0.92)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -185000 && _humRank > -250000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-9 percent)", [((_item select 2)*0.91)] call BIS_fnc_numberText, CurrencyName]];};
	if(_humRank <= -250000) then {ctrlSetText [TraderDialogBuyPrice, format["%1 %2 (-10 percent)", [((_item select 2)*0.90)] call BIS_fnc_numberText, CurrencyName]];};
	
	//ctrlSetText [TraderDialogBuyPrice, format["%1 %2", [_item select 2] call BIS_fnc_numberText, CurrencyName]];
	//ctrlEnable [TraderDialogBuyBtn, true];
	
	ctrlSetText [TraderDialogSellPrice, format["%1 %2", [_item select 5] call BIS_fnc_numberText, CurrencyName]];
	
	if (VASP_VehiclePreview) then {
		if (!isNil "VehiclePreviewHotkey") then {
			VehiclePreviewList = nil;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", VehiclePreviewHotkey];
			VehiclePreviewHotkey = nil;
		};
		if (["trade_any_",_item select 9] call fnc_inString) then {
			VehiclePreviewList = _item;
			VehiclePreviewHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
				_handled = false;
				if ((_this select 1) == VASP_HotKey) then {
					[VehiclePreviewList,LastTraderSelectCategory,LastTraderSelectItem] spawn ON_fnc_VehiclePreview;
					_handled = true;
				};
				_handled
			"];
			if (ServerRunsInfistar) then {
				debugMonitorX = false;
			};
			hint parseText format ["
				<t size='1.3'font='Bitstream'align='center'color='#00FF00'>! PREVIEW !</t><br/>
				<t></t><br/>
				<t size='1'font='Bitstream'align='center'color='#FFFFFF'>For preview of</t><br/>
				<t></t><br/>
				<t size='1.2'font='Bitstream'align='center'color='#0000FF'>%1</t><br/>
				<t></t><br/>
				<t size='1'font='Bitstream'align='center'color='#FFFFFF'>Press F1 now</t><br/>",
				(_item select 1)
			];
			[] spawn {
				waitUntil {sleep 0.1;!dialog};
				if (ServerRunsInfistar) then {
					debugMonitorX = false;
				};
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", VehiclePreviewHotkey];
				VehiclePreviewHotkey = nil;
			};
		};
	};
	if (VASP_SkinPreview) then {
		if (!isNil "SkinPreviewHotkey") then {
			SkinPreviewList = nil;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", SkinPreviewHotkey];
			SkinPreviewHotkey = nil;
		};
		if ((_item select 9) == "custom\actions\trade_items.sqf" && (_item select 0) in AllAllowedSkins) then {
			SkinPreviewList = _item;
			SkinPreviewHotkey = (findDisplay 46) displayAddEventHandler ["KeyDown", "
				_handled = false;
				if ((_this select 1) == VASP_HotKey) then {
					[SkinPreviewList,LastTraderSelectCategory,LastTraderSelectItem] spawn ON_fnc_SkinPreview;
					_handled = true;
				};
				_handled
			"];
			if (ServerRunsInfistar) then {
				debugMonitorX = false;
			};
			hint parseText format ["
				<t size='1.3'font='Bitstream'align='center'color='#00FF00'>! PREVIEW !</t><br/>
				<t></t><br/>
				<t size='1'font='Bitstream'align='center'color='#FFFFFF'>For preview of</t><br/>
				<t></t><br/>
				<t size='1.2'font='Bitstream'align='center'color='#0000FF'>%1</t><br/>
				<t></t><br/>
				<t size='1'font='Bitstream'align='center'color='#FFFFFF'>Press F1 now</t><br/>",
				(_item select 1)
			];
			[] spawn {
				waitUntil {sleep 0.1;!dialog};
				if (ServerRunsInfistar) then {
					debugMonitorX = false;
				};
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", SkinPreviewHotkey];
				SkinPreviewHotkey = nil;
			};
		};
	};
};

TraderDialogBuy = {
	private ["_index", "_item", "_data"];
	_index = _this select 0;
	if (_index < 0) exitWith {
		cutText [(localize "str_epoch_player_6"), "PLAIN DOWN"];
	};

	_item = TraderItemList select _index;
	_data = [_item select 0, _item select 3, 1, _item select 2, "buy", _item select 4, _item select 1, _item select 8];
	[0, player, '', _data] execVM (_item select 9);
	TraderItemList = [];
};

TraderDialogSell = {
	private ["_index", "_item", "_data"];
	_index = _this select 0;
	if (_index < 0) exitWith {
		cutText [(localize "str_epoch_player_6"), "PLAIN DOWN"];
	};

	_item = TraderItemList select _index;
	_data = [_item select 6, _item select 0, _item select 5, 1, "sell", _item select 1, _item select 7, _item select 8];
	[0, player, '', _data] execVM (_item select 9);

	TraderItemList = [];
};