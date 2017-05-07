//Lift
BTC_lift_pilot   = [];
BTC_lift         = 1;
BTC_lifted       = 0;
BTC_lift_min_h   = 7;
BTC_lift_max_h   = 30;
BTC_lift_radius  = 10;
BTC_cargo_lifted = objNull;
BTC_Liftable     = ["Motorcycle","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Helicopter","Air","MV22_DZ","C130J","C130J_US_EP1","RubberBoat","Boat","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];
BTC_Hud_Cond     = false;
BTC_HUD_x        = (SafeZoneW+2*SafeZoneX) + 0.045;
BTC_HUD_y        = (SafeZoneH+2*SafeZoneY) + 0.045;
_lift = [] execVM "custom\addons\logistics\Lift\LiftInit.sqf";
_fast_rope = [] execVM "custom\addons\logistics\Fast_Rope\fast_roping_init.sqf"; 
//Functions
BTC_get_liftable_array =
{
	private ["_array","_chopper"];
	_chopper = _this select 0;
	_array   = [];
	switch (typeOf _chopper) do
	{
		case "pook_H13_gunship_TAK"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship_PMC"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship_UNO"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship_CDF"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship"			: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship_GUE"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_gunship_INS"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_ru_black"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_black"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_ru_slate"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_slate"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_ru"			: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ"				: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_white"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_ru_white"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_yellow"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_civ_ru_yellow"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_CDF"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_UNO"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_PMC"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_GUE"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_TAK"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_transport_INS"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_CIV_RU"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_CIV"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_CIV"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_CIV_RU"	: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_PMC"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_UNO"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_GUE"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_INS"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_CDF"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac_TAK"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_medevac"			: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_UNO"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_PMC"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib"			: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_TAK"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_GUE"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_INS"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "pook_H13_amphib_CDF"		: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH1Z"						: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH64D"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH64D_EP1"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH6J_EP1"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH6X_EP1"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH6J_EP1_DZ"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH6J_EP1_DZE"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AH6X_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "BAF_Apache_AH1_D"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CH_47F_EP1"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CH_47F_EP1_DZE"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CH_47F_EP1_DZ"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CH_47F_BAF"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "ORI_gunship_helicopter"	: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka137_PMC"				: {_array = ["Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka137_MG_PMC"				: {_array = ["Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka52"						: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka52Black"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka60_PMC"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Ka60_GL_PMC"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "BAF_Merlin_DZE"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "BAF_Merlin_HC3_D"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "MH60S"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "MH60S_DZE"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "MH60S_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "MH6J_EP1"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "MH6J_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Boat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_DZE"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_CDF"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_Civilian"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_Civilian_DZ"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi171Sh_CZ_EP1"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi171Sh_rockets_CZ_EP1"	: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_medevac_CDF"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_medevac_RU"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_medevac_Ins"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_TK_EP1"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_UN_CDF_EP1"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_Ins"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi17_rockets_RU"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi24_D_TK_EP1"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi24_D"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi24_P"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "Mi24_V"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "ori_pragaCopter_green"	: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "ori_pragaCopter_yellow"	: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1H_DZE"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1H_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1H_TK_GUE_EP1"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1H_TK_EP1"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1Y_DZE"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1Y"						: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH1Y_DZ"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH60M_EP1"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH60M_EP1_DZE"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH60M_EP1_DZ"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "UH60M_MEV_EP1"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "vil_ori_autogyro"			: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "USEC_ch53_E"				: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CH53_DZE"					: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Air","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "AW159_Lynx_BAF"			: {_array = ["StaticWeapon","Motorcycle","ReammoBox","Car","Truck","Wheeled_APC","Tracked_APC","Tank","Ship","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
		case "CSJ_GyroC"				: {_array = ["StaticWeapon","Motorcycle","RubberBoat","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];};
	};
	_array
};

BTC_paradrop =
{
	private ["_chopper","_cargo","_chute_type","_height","_smoke","_chute"];

	_chopper          = _this select 0;
	_cargo      = _this select 1;
	_chute_type   = _this select 2;
	_chute = 0;
	
	_height = [_chopper, _cargo] call BTC_getHeight;
	
	diag_log format ["DEBUG BTC LIFT: Paradrop height: %1", _height];
	
	if (_height > 50) then {
		if (typeOf _chopper == "MH6J_DZ") then {
			_chute = createVehicle [_chute_type, [((position _chopper) select 0),((position _chopper) select 1),((position _chopper) select 2) - 20], [], 0, "NONE"];
		} else {
			_chute = createVehicle [_chute_type, [((position _chopper) select 0),((position _chopper) select 1),((position _chopper) select 2) - 20], [], 0, "NONE"];
		};
		_smoke        = "SmokeshellGreen" createVehicle position _chopper;
		_smoke attachto [_cargo, [0,0,0]]; 
		_cargo attachTo [_chute, [0,0,0]];
		while {_height > 20} do {
			sleep 0.1;
			_height = [_chopper, _cargo] call BTC_getHeight;
		};
		detach _cargo;
		PVDZE_veh_Update = [_cargo, "all"];
		publicVariableServer "PVDZE_veh_Update";
	};
	
};

BTC_getHeight = {
    private ["_height","_chopper","_cargo","_cargo_position","_cargo_position_asl","_objects"];
    _chopper = _this select 0;
	_cargo = _this select 1;
	
	_cargo_position = getpos(_cargo);
	_cargo_position_asl = getposASL(_cargo);
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos: %1", _cargo_position];
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos ASL: %1", _cargo_position_asl];
	_height = 0;

	//diag_log ("DEBUG BTC LIFT: Getting Objects");
	_objects = lineIntersectsWith [_cargo_position_asl, [(_cargo_position_asl select 0), (_cargo_position_asl select 1), -2000], _chopper, _cargo, true];
	//diag_log format ["DEBUG BTC LIFT: Objects: %1", _objects];
	if ((count _objects) > 0) then {
		//diag_log ("DEBUG BTC LIFT: Object count check true");
		_height = _cargo distance (_objects select 0);
	} else {
		//diag_log ("DEBUG BTC LIFT: Object count check false");
		_height = _cargo_position select 2;
	};
	//diag_log format ["DEBUG BTC LIFT: Pre _height: %1", _height];
	_height
};