private["_crate","_itemIn","_countIn","_content","_qty","_proceed","_missing","_missingQty","_neededMaterials"];
_crate = _this select 0;
_neededMaterials = _this select 1;
_proceed = true;
{
	_itemIn = _x select 0;
	_countIn = _x select 1;
	_content = getMagazineCargo _crate;
	_qty = 0;
	{
		if(_x == _itemIn) then {
			_qty = _qty + ((_content select 1) select _forEachIndex);
		};
	} forEach (_content select 0);
	
	if(_qty < _countIn) exitWith { 
		_missing = _itemIn; 
		_missingQty = (_countIn - _qty); 
		_proceed = false;
		cutText [format["Missing %1 more of %2!", _missingQty,_missing], "PLAIN DOWN",3];
	 
	};
} count _neededMaterials;
_proceed