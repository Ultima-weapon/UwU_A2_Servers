/*
	VEHICLE CLEANUP ZONE
	Script by HALV
*/
_obj = _this select 0;

if (!isServer) exitWith {diag_log "Server_MoveObjInsafezone.sqf - ERROR: NOT SERVER?"};

//\\\\\\\\\\\\\\\\\\\\ Setup Area ////////////////////\\

//vehicle types to Check for
_delVeh = ["Air","Landvehicle","Ship","Tank"];

//Action to take when vehicle is detected in a [VEHICLE CLEANUP ZONE]
//0 Delete vehicles ingame but keep in database. NOTE: This will stack vehicles in database if not cleaned propper
//1 Tp vehicles outside [VEHICLE CLEANUP ZONE] ("radius" + 50 meter to 4x "radius" from VEHICLE CLEANUP ZONE pos eg: if radius is 100 vehicles are moved 150-400 meter away)
//2 Tp vehicles to a position within 125m of _safespot (remember to set a position below)
//3 will delete vehicles completly from database
_Action = 1;

//if _Action = 2 then enter the position you desire here (default is by grozovoy pass around 022010)
_safespot = [2283.19,14255,0];
//how large radius to spread them in this area in meters (default 125m)
_radius = 125;

//damaged above this amoun, vehicle is deleted (set to 1 to only delete completely destroyed vehicles)
_dam = 0.90;

//if true will delete vehicles matching array below by default
_delbikmot = true;
//if above is true will delete these by default
_defdelar = ["Bicycle","Motorcycle","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP","ATV_Base_EP1"];//,"ATV_Base_EP1"

//set to true, to unlock vehicles by default when TP'ed
_unlock = true;

//log text, this is what you want to look for in the logs, if you need to know something about a moved vehicle
_txt = "[VEHICLE CLEANUP ZONE]";

//Update vehicles to the hive, and make sure they are not moved each restart?
_updateHIVE = true;

//VEHICLE CLEANUP ZONE's/areas switch choosing the map name for cleanup location purposes
if(isNil "HALV_VEHICLE_CLEANUPZONES")then{
	diag_log format["%1: selecting world to cleanup ...",_txt];
	_WorldName = toLower format ["%1", worldName];
	switch (_WorldName)do {
//NAPF
		case "napf":{
//			diag_log format["%2: Cleanup zones for napf selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[8261.6,15496.8,0],		100,		"Trader City Lenzburg"],
			[[12413.2,5052.2,0],		75,			"Trader City Schratten"],
			[[5154.019,4855.4419,0],	100,		"Hero Vendor"],
			[[15128.7,16420.936,0],		50,			"AWOLs Airfield"],
			[[2128.2959,7807.7822,0],	30,			"West Wholesaler"],
			[[5372.9751,16095.265,0],	30,			"North Wholesaler"],
			[[6773.3965,16950.34,0],	30,			"Nordic Boats"],
			[[10395.563,8270.3369,0],	5,			"Bandit Vendor"],
			[[16864.951,5273.5635,0],	30,			"Pauls Boats"],
			[[15504.2,13223.2,0],		75,			"Trader city Emmen"]
			];
		};
//chernarus
		case "chernarus":{
//			diag_log format["%2: Cleanup zones for chernarus selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					radius	cityname/text
			[[6326.4805,7809.4888,0],	100,	"Trader City Stary"],
			[[4361.4937,2259.9526,0],	30,		"Wholesaler South"],
			[[13532.614,6355.9497,0],	30,		"Wholesaler East"],
			[[7989.3354,2900.9946,0],	30,		"Boat Dealer"],
			[[12060.471,12638.533,0],	50,		"Aircraft Dealer"],
			[[1606.6443,7803.5156,0],	5,		"Bandit Camp"],
			[[11447.91,11364.536,0],	75,		"Trader City Klen"],
			[[13441.16,5429.3013,0],	30,		"Boat Dealer East"],
			[[4064.2258,11665.938,0],	75,		"Trader City Bash"],
			[[12944.227,12766.889,0],	50,		"Hero Camp"]
			];
		};
//tavi
		case "tavi":{
//			diag_log format["%2: Cleanup zones for tavi selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[11698.81,15210.121,0],	100,"Trader City Lyepestok"],
			[[15309.663,9278.4912,0],	100,"Trader City Sabina"],
			[[5538.7354,8762.2695,0],	100,"Trader City Bilgrad"],
			[[7376.6084,4296.5879,0],	100,"Trader City Branibor"],
			[[10948.426,654.90265,0],	5,"Bandit Vendor"],
			[[15587.822,16394.049,0],	50,"Hero Vendor"],
			[[16555.732,10159.68,0],	50,"Aircraft Dealer"],
			[[6815.0776,8534.1504,0],	50,"Aircraft Dealer"],
			[[4066.3528,7265.0024,0],	50,"Misc. Vendor"],
			[[17497.631,7159.0879,0],	50,"Misc. Vendor"],
			[[17332.115,12930.239,0],	50,"Boat Dealer"],
			[[10570.494,16772.477,0],	50,"Boat Dealer"],
			[[10698.463,5983.665,0],	50,"Boat Dealer"],
			[[5419.2437,9503.5479,0],	50,"Boat Dealer"],
			[[13342.758,8611.9932,0],	50,"East Wholesaler"],
			[[9859.4209,7471.5684,0],	50,"West Wholesaler"]
			];
		};
//jade groove
		case "jadegroove":{
//			diag_log format["%2: Cleanup zones for jade groove selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[3718.81,3343.33,0],		100,		"Hero Trader Area"],
			[[6589.62,8282.48,0],		100,		"Bandit Trader Area"],
			[[5262.94,5971.94,0],		100,		"Neutral Trader Area"],
			[[3391.97,3505.2,0],		30,			"Boat Trader 1"],
			[[6320.82,7455.5,0],		30,			"Boat Trader 2"]
			];
		};
//lingor
		case "lingor":{
//			diag_log format["%2: Cleanup zones for lingor selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[6013.0737,6629.2124,0],	30,			"Rommelo's Raceway"],
			[[6545.7944,6867.1309,0],	30,			"Axles Repair Shop"],
			[[7033.144,7103.0996,0],	30,			"AWOL's Planes"],
			[[3059.0198,8021.9331,0],	30,			"Wholesaler Blivion"],
			[[3610.2993,3686.4067,0],	30,			"Jim and Joe's Weapons/Ammo"],
			[[4250.3955,4481.9404,0],	30,			"Whiskey's Parts"],
			[[4143.9258,1481.0282,0],	30,			"Chip's Choppers"],
			[[7551.1641,3025.2014,0],	30,			"Used Cars"],
			[[7509.8115,2951.6182,0],	30,			"Chuck and Buck's Weapons/Ammo"],
			[[3008.9712,5932.8613,0],	50,			"Green's Quality Cars"],
			[[894.12573,5270.0874,0],	30,			"Alejandria and Melly's Medica/Survival Shop"],
			[[8348.2188,8739.2813,0],	30,			"Wholesaler Clive"],
			[[4181.9175,2341.8435,0],	30,			"Bag lady Gina"],
			[[719.30035,1576.938,0],	30,			"Wholesaler Santos"],
			[[1730.6815,4139.9688,0],	30,			"Adventure 4x4"],
			[[2378.4463,4118.7832,0],	30,			"MotoDrom 4x4 Offroad"],
			[[3925.5791,5225.2319,0],	30,			"Big Bob's Boats"],
			[[5509.2041,4392.7847,0],	30,			"Juan's Tour Boats"],
			[[3879.7634,2236.843,0],	30,			"Jd's Armed boats"],
			[[6676.3252,6361.1772,0],	30,			"Stella's Stop"],
			[[4236.6968,4842.8164,0],	30,			"Samish Shop"],
			[[6678.1494,4294.6987,0],	30,			"Mad Scientist"],
			[[4099.8921,9243.417,0],	5,			"Bandit Trader"],
			[[4144.0195,1478.6262,0],	75,			"Hero Trader"]
			];
		};
//namalsk
		case "namalsk":{
//			diag_log format["%2: Cleanup zones for namalsk selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[5769.0625,10774.036,0],	75,			"Bastion and Alda's Supplies"],
			[[8885.2803,10757.11,0],	75,			"Wholesaler Larz"],
			[[5563.6011,10343.263,0],	75,			"Dr. Zoidberg"],
			[[4702.8198,8925.3613,0],	75,			"Fry and Phil's Weapons/Ammo"],
			[[3604.1626,8026.2251,0],	75,			"Tanner's Hero Supplies"],
			[[7317.5527,8023.3457,0],	75,			"Bandit Camp"],
			[[4305.3672,4779.2388,0],	75,			"Brensk Neutral Camp"],
			[[2186.3921,5766.6338,0],	75,			"Dateu's Wholesale"],
			[[5032.3784,8234.9111,0],	75,			"Rhevn and Merkaba's Weapons/Ammo"],
			[[7720.813,5847.5083,0],	75,			"Popeye's Boats"],
			[[7239.8848,7046.2319,0],	75,			"Bandit Trader"],
			[[6283.353,9380.7344,0],	75,			"AWOL's Air Vehicles"]
			];
		};
//sauerland
		case "sauerland":{
//			diag_log format["%2: Cleanup zones for sauerland selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[15487.767,17015.457,0],	100,		"Trader City Seedorf"],
			[[24713.129,21741.785,0],	100,		"Trader City Oberberg"],
			[[11046.387,15669.861,0],	100,		"Hero Vendor"],
			[[15350.896,18522.543,0],	50,			"Axles Airfield"],
			[[2507.0181,3870.2949,0],	50,			"South Wholesaler"],
			[[223.39224,22703.682,0],	50,			"North Wholesaler"],
			[[16989.15,1778.1558,0],	5,			"Bandit Vendor"],
			[[13176.351,6614.1758,0],	100,		"Trader city Oberdorf"]
			];
		};
//takistan
		case "takistan":{
//			diag_log format["%2: Cleanup zones for takistan selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[431.62454,5554.8208,0],	100,		"Trader City Khush"],
			[[1958.948,12555.685,0],	100,		"Trader City Nur"],
			[[10870.342,6306.75,0],		100,		"Trader City Garm"],
			[[7416.8306,155.77698,0],	50,			"North Wholesaler"],
			[[11270.841,12660.39,0],	50,			"South Wholesaler"],
			[[5261.8662,11163.853,0],	50,			"Airplane Dealer"],
			[[751.90857,10491.069,0],	5,			"Bandit Trader"],
			[[8039.3813,2009.7328,0],	50,			"Black Market Trader"]
			];
		};
/*
//myworldname
		case "myworldnameinlowercase":{
//			diag_log format["%2: Cleanup zones for myworldnameinlowercase selected! (check: %1)",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position					//radius	//cityname/text
			[[7839.60,8414.73,381.33],	150,		"my custom zone marker"],
			[[7839.60,8414.73,381.33],	75,			"my custom location"] // <-- no comma for last entry
			];
		};
*/
//default
		default{
			diag_log format["%2: Cleanup zones for %1 not availible ...",_WorldName,_txt]; //logging if right worldname was selected, if uncommented
			HALV_VEHICLE_CLEANUPZONES = [
			//position	//radius	//cityname/text
			[[0,0,0],	1,			"DEBUG"]
			];
		};
	};
};
//\\\\\\\\\\\\\\\\\\\\  End Setup Area ////////////////////\\

/////////////// dont touch anything below this line unless you know what you are doing \\\\\\\\\\\\\\\

_possiblematch = false;
{if(_obj isKindOf _x)then{_possiblematch=true;};}forEach _delVeh;
if(_possiblematch)then{
	{
	_Spos = _x select 0;
	_Rad = _x select 1;
	_name = _x select 2;
	_radats = _Rad+50;
	_radx4 = _Rad+_Rad+_Rad+_Rad;
		if(_obj distance _Spos < _Rad)then{
			_defdel		= false;
			_typeOf		= typeOf _obj;
			_pos		= getpos _obj;
			_mags		= getmagazinecargo _obj;
			_weaps		= getweaponcargo _obj;
			_packs		= getbackpackcargo _obj;
			_objID		= _obj getVariable["ObjectID","0"];
			_objUID		= _obj getVariable["ObjectUID","0"];
			_objname	= (gettext (configFile >> 'CfgVehicles' >> _typeOf >> 'displayName'));
			diag_log format["%1: %2 (%3) by %4 @%5 %6 [ID:%7,UID:%8] Cargo: [%9,%10,%11]",_txt,_typeOf,_objname,_name,mapgridposition _pos,_pos,_objID,_objUID,_weaps,_mags,_packs];
			if(_delbikmot)then{{if(_obj isKindOf _x)then{_defdel = true};}forEach _defdelar;};
			if(_defdel)then{_Action=3;diag_log format["%2: %1 is Model to delete by default!",_typeOf,_txt];};
			if(getDammage _obj > _dam)then{_Action=3;diag_log format["%2: %1 too damaged",_typeOf,_txt];};
			if(_unlock and !_defdel and (locked _obj))then{_obj setVehicleLock "UNLOCKED";_obj setVariable ["R3F_LOG_disabled",false,true];diag_log format["%2: %1 Un-Locked",_typeOf,_txt];};
			switch(_Action)do{
				case 0:{deleteVehicle _obj;diag_log format["%2: %1 Deleted, but remains in DB (Dont forget to clean this up)",_typeOf,_txt];};
				case 1:{
					_newPos = [_Spos, _radats, _radx4, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;
					//update to HIVE?
					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						]; 
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				case 2:{
					_newPos = [_safespot, 0, _radius, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_obj setpos _newPos;
					//update to HIVE?
					if(_updateHIVE)then{
					private["_position","_worldspace","_fuel","_key"];
						_position = getPosATL _obj;
						_worldspace = [
							round(direction _obj),
							_position
						];
						_fuel = fuel _obj;
						_key = format["CHILD:305:%1:%2:%3:",_objID,_worldspace,_fuel];
						diag_log ("HIVE: WRITE: "+ str(_key));
						_key call server_hiveWrite;
					};
					diag_log format["%6: %5 TP from %1 %2 to %3 %4",_pos,mapgridposition _pos,_newPos,mapgridposition _newPos,_typeOf,_txt];
				};
				default{_msg = format["%2: %1",_typeOf,_txt];deleteVehicle _obj;[_objID,_objUID,_msg] call server_deleteObj;};
			};
		};
	}forEach HALV_VEHICLE_CLEANUPZONES;
};