/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["TK_INS_Soldier_AT_EP1","TK_INS_Soldier_AA_EP1","TK_GUE_Soldier_AAT_EP1","TK_GUE_Soldier_MG_EP1"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [["aimingAccuracy",0.50],["aimingShake",0.50],["aimingSpeed",0.50],["endurance",0.50],["spotDistance",0.50],["spotTime",0.50],["courage",0.50],["reloadSpeed",0.50],["commanding",0.50],["general",0.50]];
DZMSSkills1 = [["aimingAccuracy",0.60],["aimingShake",0.40],["aimingSpeed",0.60],["endurance",0.60],["spotDistance",0.60],["spotTime",0.60],["courage",0.80],["reloadSpeed",0.60],["commanding",0.60],["general",0.60]];
DZMSSkills2 = [["aimingAccuracy",0.70],["aimingShake",0.30],["aimingSpeed",0.70],["endurance",0.70],["spotDistance",0.70],["spotTime",0.70],["courage",0.90],["reloadSpeed",0.70],["commanding",0.70],["general",0.70]];
DZMSSkills3 = [["aimingAccuracy",0.80],["aimingShake",0.20],["aimingSpeed",0.80],["endurance",0.80],["spotDistance",0.80],["spotTime",0.80],["courage",1.0],["reloadSpeed",0.80],["commanding",1.0],["general",0.80]];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = ["M16A2","M16A2GL","AK_74","M4A1_Aim","AKS_74_kobra","AKS_74_U","AK_47_M","M24","M1014","DMR_DZ","M4A1","M14_EP1","AK_107_GL_Kobra","MP5A5","MP5SD","M4A3_CCO_EP1"];
DZMSWeps1 = ["M16A2","M16A2GL","M249_DZ","AK_74","M4A1_Aim","AKS_74_kobra","AKS_74_U","AK_47_M","M24","SVD_CAMO","M1014","DMR_DZ","M4A1","M14_EP1","AK_107_GL_Kobra","M4A1_AIM_SD_camo","M16A4_ACG","M4A1_HWS_GL_camo","Mk_48_DZ","M4A3_CCO_EP1","Sa58V_RCO_EP1","Sa58V_CCO_EP1","M40A3","Sa58P_EP1","Sa58V_EP1"];
DZMSWeps2 = ["FN_FAL","FN_FAL_ANPVS4","Mk_48_DZ","M249_DZ","BAF_L85A2_RIS_Holo","G36C","G36C_camo","G36A_camo","G36K_camo","AK_47_M","AKS_74_U","M14_EP1","bizon_silenced","DMR_DZ","RPK_74"];
DZMSWeps3 = ["FN_FAL","FN_FAL_ANPVS4","Mk_48_DZ","M249_DZ","BAF_L85A2_RIS_Holo","G36C","G36C_camo","G36A_camo","G36K_camo","AK_47_M","AKS_74_U","M14_EP1","bizon_silenced","DMR_DZ","RPK_74"];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
DZMSGear1 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
DZMSGear2 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
DZMSGear3 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];
DZMSGear4 = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemFlashlight"]];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];