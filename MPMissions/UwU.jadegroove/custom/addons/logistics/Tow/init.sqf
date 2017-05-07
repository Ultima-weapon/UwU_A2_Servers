private ["_cursorTarget", "_towableVehicles", "_towableVehiclesTotal"];

// Public variables
MF_Tow_Base_Path		= "custom\addons\logistics\Tow"; 		// The base path to the MF-Tow Folder.
MF_Tow_Distance			= 20;					// Minimum distance (in meters) away from vehicle the tow truck must be to tow.
MF_Tow_Multi_Towing	 	= false;				// Allow a vehicle which is towing another vehicle already to be towed by another tow. Disabled by default.
MF_Tow_Multi_Towing_BTC = false;   				// if u use =BTC=_Lift and dont wont Lift tow-towning Vehicles

MF_Tow_TowAllowSpecial = ["TowingTractor","tractor","tractorold"]; // Towing Tractor
MF_Tow_TowAllowSuperHeavy = ["BMP2_ACR","BMP2_Des_ACR","BVP1_TK_ACR","BVP1_TK_GUE_ACR","T72_ACR","T810Repair_Des_ACR","T810Repair_ACR","T810Refuel_Des_ACR","T810Refuel_ACR","T810Reammo_Des_ACR","T810Reammo_ACR","T810A_MG_ACR","T810A_Des_MG_ACR","T810_Open_Des_ACR","T810_Open_ACR","T810_Des_ACR","T810_ACR","BTR90_HQ_DZE","LAV25_HQ_DZE","Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1","V3S_Refuel_TK_GUE_EP1_DZ","UralRefuel_TK_EP1_DZ","Kamaz","KamazRefuel_DZ","MtvrRefuel_DES_EP1_DZ","MTVR_DES_EP1"]; // Trucks
MF_Tow_TowAllowHeavy = ["BRDM2_ACR","BRDM2_Desert_ACR","Dingo_DST_ACR","Dingo_GL_DST_ACR","Dingo_GL_Wdl_ACR","Dingo_WDL_ACR","M1114_AGS_ACR","M1114_DSK_ACR","Pandur2_ACR","RM70_ACR","HMMWV_M1035_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","HMMWV_M998A2_SOV_DES_EP1_DZE","HMMWV_M1151_M2_CZ_DES_EP1_DZE","HMMWV_M1151_M2_CZ_DES_EP1","GAZ_Vodnik_DZE","GAZ_Vodnik_MedEvac","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1"]; // Military/4x4
MF_Tow_TowAllowMedium = ["LandRover_ACR","LandRover_Ambulance_ACR","LandRover_Ambulance_Des_ACR","BAF_Offroad_W","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow","UAZ_CDF","UAZ_INS","UAZ_MG_TK_EP1_DZE","UAZ_RU","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1","S1203_ambulance_EP1","S1203_TK_CIV_EP1","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","Offroad_DSHKM_Gue_DZE","LAndRover_CZ_EP1","LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","LandRover_TK_CIV_EP1","Ikarus","Ikarus_TK_CIV_EP1","ArmoredSUV_PMC","ArmoredSUV_PMC_DZ","ArmoredSUV_PMC_DZE","UAZ_Unarmed_TK_CIV_EP1","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","hilux1_civil_3_open_EP1","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open"]; // Heavy Cars
MF_Tow_TowAllowLight = ["Octavia_ACR","UAZ_Unarmed_ACR","policecar","VolhaLimo_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VWGolf","Skoda","SkodaBlue","SkodaGreen","SkodaRed","car_hatchback","car_sedan","Lada1","Lada1_TK_CIV_EP1","Lada2","Lada2_TK_CIV_EP1","LadaLM"]; // Cars
MF_Tow_TowAllowFeather = ["TT650_Civ","TT650_Ins","TT650_TK_CIV_EP1","ATV_CZ_EP1","ATV_US_EP1","GLT_M300_LT","GLT_M300_ST","M1030_US_DES_EP1","Old_moto_TK_Civ_EP1"]; // ATV's


// Functions

// Returns an array of towable objects which can be pulled by the tow truck.
// Configure this as required to set which vehicles can pull which types of other vehicles.
MF_Tow_Towable_Array =
{
    private ["_vehicleClass","_array","_towTruck","_towClass"];
    _towTruck = _this select 0;
	_vehicleClass = typeOf _towTruck;
	_towClass = "";
	if (_vehicleClass in MF_Tow_TowAllowFeather) then { _towClass = "Feather"; };
	if (_vehicleClass in MF_Tow_TowAllowLight) then { _towClass = "Light"; };
	if (_vehicleClass in MF_Tow_TowAllowMedium) then { _towClass = "Medium"; };
	if (_vehicleClass in MF_Tow_TowAllowHeavy) then { _towClass = "Heavy"; };
	if (_vehicleClass in MF_Tow_TowAllowSuperHeavy) then { _towClass = "SuperHeavy"; };
	if (_vehicleClass in MF_Tow_TowAllowSpecial) then { _towClass = "TowingTractor"; };
	_array = [];
	if ( _towTruck isKindOf "Motorcycle" ) then { _array = ["Motorcycle"];};
	if ( _towTruck isKindOf "Car" ) then { _array = ["StaticWeapon","Motorcycle","Car","Ship"];};
	if ( _towTruck isKindOf "Truck" ) then { _array = ["StaticWeapon","Motorcycle","Car","Truck","Ship"];};
	if ( _towTruck isKindOf "Wheeled_APC" ) then { _array = ["StaticWeapon","Motorcycle","Car","Truck","Wheeled_APC","Ship"];};
	if ( _towTruck isKindOf "Tracked_APC" ) then { _array = ["StaticWeapon","Motorcycle","Car","Truck","Wheeled_APC","Tracked_APC","Ship"];};
	if ( _towTruck isKindOf "Tank" ) then { _array = ["StaticWeapon","Motorcycle","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship"];};
	switch (_towClass) do
	{
		case "Feather": 		{_array = ["Motorcycle"];};
		case "Light":			{_array = ["StaticWeapon","Motorcycle","Car"];};
		case "Medium": 			{_array = ["StaticWeapon","Motorcycle","Car","Bus"];};
		case "Heavy": 			{_array = ["StaticWeapon","Motorcycle","Car","Bus","Truck"];};
		case "SuperHeavy": 		{_array = ["LandVehicle","StaticWeapon"];};
		case "TowingTractor": 	{_array = ["LandVehicle","Air"];};
	};
	_array
};

// Animate the player in a towing action.
MF_Tow_Animate_Player_Tow_Action =
{
	[player,20,true,(getPosATL player)] spawn player_alertZombies;	// Alert nearby zombies
	[1,1] call dayz_HungerThirst; 									// Use some hunger and thirst to perform the action
	[player,"repair",0,false,10] call dayz_zombieSpeak;				// Play sound
	player playActionNow "Medic"; 									// Force the animation
};

// Get Vehicle Name
MF_Tow_Get_Vehicle_Name =
{
	private ["_vehicle", "_configVeh", "_vehicleName"];
	_vehicle = _this select 0;
	_configVeh = configFile >> "cfgVehicles" >> TypeOf(_vehicle);
	_vehicleName = getText(_configVeh >> "displayName");
	_vehicleName
};

// Initialise script
if (isnil "towtracker") then {towtracker = true;};
if (towtracker) then
{
	[]spawn
	{
		private["_cursorTarget", "_towableVehicles", "_towableVehiclesTotal"];
		
		while {true} do
		{
			_cursorTarget = cursorTarget;
			_towableVehicles = [_cursorTarget] call MF_Tow_Towable_Array;
			_towableVehiclesTotal = count (_towableVehicles);

			if(_towableVehiclesTotal > 0) then {
				if (s_player_towing < 0) then {
					if(!(_cursorTarget getVariable ["MFTowIsTowing", false])) then {
						s_player_towing = player addAction ["<t color='#FFFF00'>Attach Tow</t>", format["%1\tow_AttachTow.sqf", MF_Tow_Base_Path], _cursorTarget, 0, false, true, "",""];
					} else {
						s_player_towing = player addAction ["<t color='#FFFF00'>Detach Tow</t>", format["%1\tow_DetachTow.sqf", MF_Tow_Base_Path], _cursorTarget, 0, false, true, "",""];
					};
				};
			} else {
				player removeAction s_player_towing;
				s_player_towing = -1;
			};
			Sleep 2;
		};
	};
	towtracker = false;
};
waituntil {!alive player ; sleep 2;};
towtracker = true;
