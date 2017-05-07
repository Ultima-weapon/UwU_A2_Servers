private["_version"];
_version = "1.0.0";
//diag_log text format["DZAP: loading version %1",_version];
//diag_log text format["DZAP: loading config..."];
call compile preprocessFileLineNumbers "custom\addons\dzap_config.sqf";
//diag_log text format["DZAP: loading function library..."];
call compile preprocessFileLineNumbers "custom\addons\dzap\lib.sqf";
if(DZE_CLICK_ACTIONS_ENABLE) then {
    //diag_log text format["DZAP: loading click actions handler..."];	// Controlled elsewhere
    //call compile preprocessFileLineNumbers "custom\addons\click_actions\init.sqf";	// Controlled elsewhere
    if(DZE_DEPLOYABLES_ENABLE) then {
        //diag_log text format["DZAP: loading deploy anything addon..."];
        call compile preprocessFileLineNumbers "custom\addons\bike\init.sqf";
    };
    if(DZE_WEAPON_MOD_ENABLE) then {
        //diag_log text format["DZAP: loading weapon mod addon..."];
        call compile preprocessFileLineNumbers "custom\addons\wmod\init.sqf";
    };
    if(DZE_SUICIDE_ADDON_ENABLE) then {
        //diag_log text format["DZAP: loading suicide addon..."];
        call compile preprocessFileLineNumbers "custom\addons\suicide\init.sqf";
    };
    if(DZE_TAKECLOTHES_ADDON_ENABLE) then {
        //diag_log text format["DZAP: loading clothes addon..."];
        call compile preprocessFileLineNumbers "custom\addons\clothes\init.sqf";
    };
    if(DZE_KITS_ADDON_ENABLE) then {
        //diag_log text format["DZAP: loading kits addon..."];
        call compile preprocessFileLineNumbers "custom\addons\kits\init.sqf";
    };
    if(DZE_MAP_MARKER_ADDON_ENABLE) then {
        //diag_log text format["DZAP: loading map addon..."];
        call compile preprocessFileLineNumbers "custom\addons\map\init.sqf";
    };
	if(DZE_BASE_JUMP_ADDON_ENABLE) then {
		//diag_log text format["DZAP: loading baseJump addon..."];
		call compile preprocessFileLineNumbers "custom\addons\baseJump\init.sqf";
    };
};