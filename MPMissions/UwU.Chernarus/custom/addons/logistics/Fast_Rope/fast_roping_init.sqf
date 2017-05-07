#include "functions.sqf"
BTC_fast_rope_h = 40; //set the allowed height limit for fast roping in meters
BTC_AI_fast_rope_on_deploy = 1; //tells ai to fast rope when deployed or told to exit
BTC_roping_chopper = ["CH47_base_EP1","Mi17_base","Mi24_Base","UH1H_base","UH1_Base","UH60_Base","MV22","BAF_Merlin_HC3_D","Ka60_Base_PMC","Mi24_Base","MH60S","UH60M_EP1","UH1H_DZ","Mi17_DZ","AH6X_DZ","MH6J_DZ"]; //vehicle classnames that can use the fast rope
{
    _rope = _x addaction [("<t color=""#ED2744"">") + ("Deploy rope") + "</t>","custom\addons\logistics\Fast_Rope\addAction.sqf",[[],BTC_deploy_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"]; //add action to deploy the rope
    _rope = _x addaction [("<t color=""#ED2744"">") + ("Cut rope") + "</t>","custom\addons\logistics\Fast_Rope\addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""]; //add action to cut the rope
    _out = _x addaction [("<t color=""#ED2744"">") + ("Fast rope") + "</t>","custom\addons\logistics\Fast_Rope\addAction2.sqf",[[player],BTC_fast_rope],7,true,false,"","player != driver _target && player in (assignedCargo _target) && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""]; //add action to fast rope
} foreach (nearestObjects [[10200,10200,0], BTC_roping_chopper, 50000]); //get all of the vehicles with the class names specified