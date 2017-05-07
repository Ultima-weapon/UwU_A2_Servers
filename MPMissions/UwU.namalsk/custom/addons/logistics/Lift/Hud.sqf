private ["_chopper"];
if (BTC_Hud_Cond) then {

	BTC_Hud_Cond = false;

} else {

	BTC_Hud_Cond = true;

};
_chopper = vehicle player;
_chopper removeAction BTC_liftHudId;

if (BTC_Hud_Cond) then {
	BTC_liftHudId = _chopper addAction [("<t color=""#ED2744"">" + ("Lift Hud Off") + "</t>"),"custom\addons\logistics\Lift\Hud.sqf", "", 0, false, false];
} else {
	BTC_liftHudId = _chopper addAction [("<t color=""#FFFF00"">" + ("Lift Hud On") + "</t>"),"custom\addons\logistics\Lift\Hud.sqf", "", 0, false, false];
};