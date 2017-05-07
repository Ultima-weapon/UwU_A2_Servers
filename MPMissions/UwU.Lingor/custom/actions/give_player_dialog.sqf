private ["_dialog"];
player setVariable["TrBsy",true,true];
ZSC_GiveMoneyTarget = cursorTarget;
if( isPlayer ZSC_GiveMoneyTarget)then{
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
}else{
systemChat format["Your target is not a player"];
};

waitUntil { !dialog };
uiSleep 3;
player setVariable["TrBsy",false,true];
