if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
_nearPlayers = cursorTarget nearEntities ["CAManBase", 5];
_playerNear = ({isPlayer _x} count _nearPlayers) > 1;
if(_playerNear) exitWith { cutText["Cannot access Money Storage while another player is nearby.","PLAIN DOWN"];};

DZE_ActionInProgress = true;

private ["_dialog"];
player setVariable["TrBsy",true,true];
ZSC_CurrentStorage = _this select 3;
_dialog = createDialog "BankDialog";
call BankDialogUpdateAmounts;

waitUntil { !dialog };
uiSleep 3;
player setVariable["TrBsy",false,true];

DZE_ActionInProgress = false;
