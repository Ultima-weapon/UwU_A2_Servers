// Rewriten by Soul from DayZ2017 to work with DayZ1.7.7.1
    // Special thanks to reactortrip for bringing this up
    // Krixes for the countdown timer example in his sleep script ;D
    // The whole community for releasing all there scripts and so enabling me to learn alot!
 
    private["_ent"];
    //Variables ------------------------------------------------
        _ent = _this select 3; //Dont touch this
        _countDownTimer = 60; //Total time to count down, makes the tent burn for 60 seconds. Change to whatever you like...
        _timeLeft = _countDownTimer; //time left to count down, dont touch this
        canAbort = true;
    //----------------------------------------------------------
 
    player removeAction s_player_igniteTent;
    s_player_igniteTent = -1;
 
    player playActionNow "Medic";
    sleep 7;
 
    _objectID = _ent getVariable["ObjectID","0"];
    _objectUID = _ent getVariable["ObjectUID","0"];
 
    PVDZ_obj_Fire = [_ent,10,time,false,true];
    publicVariable "PVDZ_obj_Fire";
    _id = PVDZ_obj_Fire spawn BIS_Effects_Burn;
    for "_i" from 0 to _countDownTimer do {
    sleep 1;
    _timeLeft = _timeLeft - 1;
    };
 
    if(_timeLeft == 0 || _timeLeft < 0) then {
    _ent setDamage 2;
 
    //Deleting from database. Function found in player_packTent.sqf
    PVDZE_obj_Delete = [_objectID,_objectUID];
    publicVariableServer "PVDZE_obj_Delete";
    if (isServer) then {
        PVDZE_obj_Delete call server_deleteObj;
    };
    deleteVehicle _ent;
    };
 
/*
How to use: PVDZ_obj_Fire = [_ent,5,time,false,true];
 
> handle=[unit,intensity,time,lifecheck,fade] spawn BIS_Effects_Burn
>
> unit: the name of the object that the fire will be attached to
> intensity: the intensity of the fire. Recommended to use values between
> 0.7 and 10, higher values may be used if desired though.
> time: the time that the fire started. use global variable "time". this is used to keep effects synced for JIP players
> lifecheck: if this is true then the unit will only burn as long as it is dead (!alive unit). set to false to burn things like buildings and
gamelogics
> fade: if true then the fire will die down over time, eventually dying
out. set to false if you want it to keep burning. (affected by rain too).
 
To make a gamelogic named mygamelogic burn forever with a big fire:
PVDZ_obj_Fire=[_ent,10,time,false,false] spawn BIS_Effects_Burn
 
*/