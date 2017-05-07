_array = _this select 3;
_param = _array select 0;
_code  = _array select 1;
_spawn = _param spawn _code;
titleText ["God on.","PLAIN DOWN"]; titleFadeOut 3;
playsound "fastrope";//take out if you dont have the sound file
        // player_zombieCheck = {};
        fnc_usec_damageHandler = {};
        _thePlayer removeAllEventHandlers "handleDamage";
        _thePlayer addEventHandler ["handleDamage", {false}];
        _thePlayer allowDamage false;
        sleep 8;
        // player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
        fnc_usec_damageHandler = compile preprocessFileLineNumbers "custom\compile\fn_damageHandler.sqf";
        _thePlayer addEventHandler ["handleDamage", {true}];
        _thePlayer removeAllEventHandlers "handleDamage";
        _thePlayer allowDamage true;
titleText ["God off.","PLAIN DOWN"]; titleFadeOut 3; 