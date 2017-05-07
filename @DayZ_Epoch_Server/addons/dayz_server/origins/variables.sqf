publicVariable "owner_B1";
publicVariable "owner_B2";
publicVariable "owner_B3";
publicVariable "owner_H1";
publicVariable "owner_H2";
publicVariable "owner_H3";
publicVariable "owner_SG";
publicVariable "owner_LG";
publicVariable "owner_KING";
publicVariable "owner_SH";
diag_log (format["HOUSE SERVER: Owners Are: B1 %1 B2 %2 B3 %3 H1 %4 H2 %5 H3 %6 SG %7 LG %8 KING %9 SH %10", owner_B1, owner_B2, owner_B3, owner_H1, owner_H2, owner_H3, owner_SG, owner_LG, owner_KING,owner_SH]);
"OriginsLockUnlock" addPublicVariableEventHandler 
{
	originsObject = _this select 1 select 0;
	originsObjectType = _this select 1 select 1;
	originsState = _this select 1 select 2;
	originsPlayerUid = _this select 1 select 3;
	originsCombination = _this select 1 select 4;
	[originsObject,originsObjectType,originsState,originsPlayerUid,originsCombination] execVM "\z\addons\dayz_server\origins\server_LockUnlockOrigins.sqf";
};