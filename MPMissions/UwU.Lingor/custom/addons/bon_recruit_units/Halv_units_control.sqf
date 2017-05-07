//Created by HALV
_unit = _this select 0;
/*************************************** settings **************************************************/

//units attack zeds?
_attack_zeds = true;
//if above is true, this is the distance from the player, where the ai will see the zeds as a threat to the player and begin to target it
//setting this high might result in fps issues, not to mention it will reveal the players position (if ai is near the player) every time the ai shoots
_attack_zeds_dist = 25;

//rearm units?
_rearmunit = true;
//amnt of mags to rearm
_magcount = 6;

//sleep time between cycles, the higher this is, the longer there will between each action, the lower you set this,
//the lower you set this, the more resources the ai will use - (default 5, recomended NOT to lower this)
_sleep = 5;
//this is how long before rearming default 120sec wich will be about ~2min (120/5 = 24cyles of ~5sec = ~120sec/2min)
//the amount is calculate via cycles, so it will never be acurate to sec, but should be close 
//((_timetorearm = 120/_sleep = 5) = (24cyles of ~5sec) = (~120sec/2min))
_timetorearm = 120;

//weapons not to rearm
_notweapons = [
//weapons that will not be disarmed
["SmokeLauncher","MiniCarHorn","SportCarHorn","TruckHorn2","TruckHorn","BikeHorn","CarHorn"],
//weapons that will not be rearmed
["SmokeLauncher","MiniCarHorn","SportCarHorn","TruckHorn2","TruckHorn","BikeHorn","CarHorn"]
];

/*****************************************************************************************************/

_count = 0;
_leader = leader (group _unit);
_playername = name _leader;

while {alive _unit}do{
	if(local _unit)then{
		_rearm = if(_rearmunit)then{true}else{false};
		_VU = vehicle _unit;
		_curweapon = currentWeapon _VU;
		{
			_zone = _x select 0;
			_dist = _x select 1;
			_zonename = _x select 2;
			if(_unit distance _zone < _dist)exitWith{
				if(_unit != _VU and !(_curweapon in (_notweapons select 0)))then{
					_role = assignedVehicleRole _unit;
					_turretmags = [];
					if(count _role > 1)then{
						_turretmags = _VU magazinesTurret (_role select 1);
						if (count _turretmags > 0)then{
							diag_log format["[PMC_CONTRACTOR]: '%1' - '%2' (%3) Unit vehicle disarmed near '%4' Weapon: '%5' Ammo: '%6'",_playername,_unit,typeOf _VU,_zonename,_curweapon,_turretmags];
							_VU setVehicleAmmo 0;
						};
					};
				}else{
					_unitmags = magazines _unit;
					if((count (_unitmags) > 0))then{
						diag_log format["[PMC_CONTRACTOR]: '%1' - '%2' (%3) Unit disarmed near '%4' Weapon: '%5' Ammo: '%6'",_playername,_unit,typeOf _unit,_zonename,_curweapon,_unitmags];
						{_unit removeMagazine _x}forEach _unitmags;
						_VU setVehicleAmmo 0;
					};
				};
				_rearm = false;
			};
		}forEach Halv_PMC_CONTRACTOR_noshootingzones;

		if(_attack_zeds and alive _leader and _curweapon != "")then{
/*
			_manObj = _leader nearEntities ["zZombie_Base",_attack_zeds_dist];
			if(count _manObj > 0)then{
				{
					_manObjx = _x;
					if(_x isKindOf "zZombie_Base")then{
						_ratingx = rating _manObjx;
						if(_ratingx > -2500)then{
							_manObjx addRating -99999;
						};
					};
					if(isPlayer _manObjx)then{
						_CharacterID = _leader getVariable ['CharacterID', '0'];
						_friendlyTo = _leader getVariable ['friendlyTo', []];
						_friendlies = _leader getVariable ['friendlies', []];
						_manObjx_CharacterID = _manObjx getVariable ['CharacterID', '0'];
						_manObjx_friendlyTo = _manObjx getVariable ['friendlyTo', []];
						_manObjx_friendlies = _manObjx getVariable ['friendlies', []];
						if ((_manObjx_CharacterID in _friendlyTo) or (_CharacterID in _manObjx_friendlyTo) or (_manObjx_CharacterID in _friendlies) or (_CharacterID in _manObjx_friendlies)) then {
							_ratingx = rating _manObjx;
							if(_ratingx > 2500)then{
								_manObjx addRating (((_ratingx*-1)+_ratingx) + 2500);
							};
						};
					};
				} forEach _manObj;
			};
*/

			_zombies = _leader nearEntities ["zZombie_Base",_attack_zeds_dist];
			if(count _zombies > 0)then{
				{
					_ratingx = rating _x;
					if(_ratingx > -2000)then{
						_x addRating -99999;
					};
				} forEach _zombies;
			};

		};

		if(_rearm)then{
			if (_curweapon != "" and !(_curweapon in (_notweapons select 1)))then{
				if(_count >= (_timetorearm/_sleep))then{
					if !(someAmmo _unit) then{
						if(_unit != _VU)then{
							//perhaps opt to rearm vehs here
						}else{
							_mags = getArray (configfile >> 'cfgWeapons' >> _curweapon >> 'magazines');
							_mag = _mags select 0;
							for "_i" from 0 to (_magcount-1) do{
								_unit addMagazine _mag;
							};
							reload _unit;
							diag_log format["[PMC_CONTRACTOR]: '%1' - '%2' (%3) Unit was Rearmed: '%4' Ammo: '%5' _count: '%6'",_playername,_unit,typeOf _unit,_curweapon,_mag,_count];
						};
					};
					_count = 0;
				}else{
					_count = _count +1;
				};
			}else{
				_count = 0;
			};
		}else{
			_count = 0;
		};
		sleep _sleep;
	};
	waitUntil{(local _unit || !alive _unit)};
};