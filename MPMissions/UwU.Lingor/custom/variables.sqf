disableSerialization;
if (isNil "DayZ_UseSteamID") then {
	DayZ_UseSteamID = true;
};

AllowManualCode = true;
HarderPenalty = true;
DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];
DZE_Garage = ["Land_MBG_Garage_Single_A","Land_MBG_Garage_Single_B","Land_MBG_Garage_Single_C","Land_MBG_Garage_Single_D"];
//Model Variables
Bandit1_DZ = 	"Bandit1_DZ";
Bandit2_DZ = 	"Bandit2_DZ";
BanditW1_DZ = 	"BanditW1_DZ";
BanditW2_DZ = 	"BanditW2_DZ";
Survivor1_DZ = 	"Survivor2_DZ";
Survivor2_DZ = 	"Survivor2_DZ";
SurvivorW2_DZ = "SurvivorW2_DZ";
SurvivorW3_DZ = "SurvivorW2_DZ";
Sniper1_DZ = 	"Sniper1_DZ";
Camo1_DZ = 		"Camo1_DZ";
Soldier1_DZ = 	"Soldier1_DZ";
Rocket_DZ = 	"Rocket_DZ";

AllPlayers = ["Survivor2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","SurvivorW2_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","BanditW2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","pz_policeman","pz_suit1","pz_suit2","pz_worker1","pz_worker2","pz_worker3","pz_doctor","pz_teacher","pz_hunter","pz_villager1","pz_villager2","pz_villager3","pz_priest","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ","TK_Special_Forces_MG_EP1_DZ","TK_Soldier_Sniper_EP1_DZ","TK_Commander_EP1_DZ","RU_Soldier_Crew_DZ","INS_Lopotev_DZ","INS_Soldier_AR_DZ","INS_Soldier_CO_DZ","INS_Bardak_DZ","INS_Worker2_DZ"];
MeleeWeapons = ["MeleeFishingPole","MeleeCrowbar","MeleeBaseBallBatNails","MeleeBaseBallBatBarbed","MeleeBaseBallBat","Crossbow_DZ","MeleeSledge","MeleeMachete","MeleeHatchet_DZE"];
Clothing1 = ["FR_Ohara_DZ","FR_Miles","FR_Cooper","FR_Rodriguez_DZ","FR_Sykes","FR_AC","FR_AR","FR_Assault_GL","FR_Assault_R","FR_Commander"];
Clothing2 = ["Soldier1_DZ","USMC_Soldier","USMC_Soldier2","USMC_SoldierM_Marksman","USMC_SoldierS","USMC_SoldierS_Sniper","USMC_Soldier_AA","USMC_Soldier_Pilot"];
Clothing3 = ["Ins_Soldier_GL_DZ","CDF_Soldier","CDF_Commander","CDF_Soldier_AR","CDF_Soldier_Crew","CDF_Soldier_Light","CDF_Soldier_Pilot"];
Clothing4 = ["GUE_Soldier_Crew_DZ","RU_Soldier","RU_Soldier_Crew","RU_Soldier_Light","RU_Soldier_Pilot","RUS_Commander","RUS_Soldier1","MVD_Soldier_Sniper"];
Clothing5 = ["Graves_Light_DZ","Drake","Graves","Herrera","Pierce","US_Delta_Force_Assault_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_MG_EP1","US_Pilot_Light_EP1","US_Soldier_SL_EP1"];
Clothing6 = ["CZ_Special_Forces_GL_DES_EP1_DZ","CZ_Soldier_AT_DES_EP1","CZ_Soldier_Light_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_TL_DES_EP1"];
Clothing7 = ["Bandit2_DZ","MVD_Soldier_Sniper","GER_Soldier_EP1","GER_Soldier_MG_EP1","GER_Soldier_TL_EP1"];
Clothing8 = ["Soldier_Bodyguard_AA12_PMC_DZ","CIV_Contractor2_BAF","BAF_crewman_DDPM","BAF_Soldier_FAC_DDPM","BAF_Soldier_N_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_Officer_DDPM","BAF_Soldier_L_DDPM"];
Clothing9 = ["TK_INS_Soldier_EP1_DZ","TK_Commander_EP1","TK_Soldier_Crew_EP1","TK_Soldier_MG_EP1","TK_Special_Forces_MG_EP1","TK_INS_Bonesetter_EP1"];
Clothing10 = ["Survivor2_DZ"];
Clothing11 = ["FR_Rodriguez_DZ","FR_Corpsman","FR_GL","FR_Light","FR_Marksman","FR_R","FR_Sapper","FR_TL","Mercenary_Default20b","Mercenary_Default20c","Mercenary_Default20d"]; // Abit of Overpoch in here
// Overwatch
//Hero
Clothing12 = ["Drake_Light_DZ","arma1_us_soldier_sabass","arma1_us_soldier_sabmark","arma1_us_soldier_sabot","frb_tl","frb_tl_mask","frb_gl","frb_gl_mask","frb_mg","frb_mg_mask","frb_mark","frb_mark_mask","frb_stealth_tl","frb_stealth_rifleman","frb_stealth_sabot","frb_stealth_mark"];
Clothing13 = ["Soldier_Sniper_PMC_DZ","SBH_Alpha_Soldier1","SBH_Alpha_Soldier2","SBH_Alpha_Soldier3","SBH_Alpha_Soldier4","SBH_Alpha_Soldier5","SBH_Alpha_Soldier6","SBH_Alpha_Soldier7","SBH_Alpha_Soldier8","SBH_Alpha_Soldier9","SBH_Alpha_Soldier10","SBH_Alpha_Soldier11","SBH_Alpha_Soldier12"];
Clothing14 = ["CZ_Soldier_Sniper_EP1_DZ"];
Clothing15 = ["Camo1_DZ","US_Delta_Force_TL_EP1","US_Delta_Force_EP1","US_Delta_Force_AR_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_Air_Controller_EP1"];
Clothing16 = ["Rocket_DZ","SFSG_des_tl","SFSG_des_op","SFSG_des_ar","SFSG_des_med","SFSG_des_demo","SFSG_des_mrk","SFSG_des_jtac","SFSG_mtp_tl","SFSG_mtp_op","SFSG_mtp_ar","SFSG_mtp_med","SFSG_mtp_demo","SFSG_mtp_mrk","SFSG_mtp_jtac","SFSG_wdl_tl","SFSG_wdl_op","SFSG_wdl_ar","SFSG_wdl_med","SFSG_wdl_demo","SFSG_wdl_mrk","SFSG_wdl_jtac","SFSG_mtpw_tl","SFSG_mtpw_op","SFSG_mtpw_ar","SFSG_mtpw_med","SFSG_mtpw_demo","SFSG_mtpw_mrk","SFSG_mtpw_jtac"];
Clothing17 = ["Sniper1_DZ","Navy_SEAL_TL","Navy_SEAL_GL","Navy_SEAL_MG","Navy_SEAL_AT","Navy_SEAL_Medic","Navy_SEAL_Marksman","Navy_SEAL_diver","Navy_SEAL_diver_medic","Navy_SEAL_diver_land","Navy_SEAL_AC","Navy_SEAL_ACa","Navy_SEAL_ACb","Navy_SEAL_Shotgun","Navy_SEAL_Sabot","Navy_SEAL_SD"];
Clothing18 = ["Soldier_TL_PMC_DZ","G_WDL_Mercenary_Default0","G_WDL_Mercenary_Default1","G_WDL_Mercenary_Default2","G_WDL_Mercenary_Default3","G_WDL_Mercenary_Default4","G_WDL_Mercenary_Default5","G_WDL_Mercenary_Default6","G_WDL_Mercenary_Default7","G_WDL_Mercenary_Default8","G_WDL_Mercenary_Default9","G_WDL_Mercenary_Default10","G_WDL_Mercenary_Default11","G_WDL_Mercenary_Default12","G_WDL_Mercenary_Default13","G_WDL_Mercenary_Default14","G_WDL_Mercenary_Default15","G_WDL_Mercenary_Default16"];
Clothing19 = ["GUE_Soldier_Sniper_DZ","UKSF_des_tl","UKSF_des_op","UKSF_des_ar","UKSF_des_med","UKSF_des_demo","UKSF_des_mrk","UKSF_des_jtac","UKSF_wdl_tl","UKSF_wdl_op","UKSF_wdl_ar","UKSF_wdl_med","UKSF_wdl_demo","UKSF_wdl_mrk","UKSF_wdl_jtac","UKSF_des_tl_l","UKSF_des_op_l","UKSF_des_ar_l","UKSF_des_med_l","UKSF_des_demo_l","UKSF_des_mrk_l","UKSF_des_jtac_l","UKSF_wdl_tl_l","UKSF_wdl_op_l","UKSF_wdl_ar_l","UKSF_wdl_med_l","UKSF_wdl_demo_l","UKSF_wdl_mrk_l","UKSF_wdl_jtac_l"];
Clothing20 = ["TK_INS_Warlord_EP1_DZ","gsc_military_helmet_wdl","gsc_military_helmet_wdl_AT","gsc_military_helmet_grey_AT","gsc_military_helmet_wdlSNP","gsc_military_helmet_greySNP","gsc_military_helmet_grey","gsc_military_head_grey","gsc_military_head_greySNP","gsc_military_head_wdlSNP","gsc_military_head_wdl","gsc_military_head_wdl_AT","gsc_military_head_grey_AT","gsc_scientist1","gsc_scientist1_head","gsc_scientist2","gsc_scientist2_head","gsc_eco_stalker_mask_fred","gsc_eco_stalker_head_fred","gsc_eco_stalker_mask_camo","gsc_eco_stalker_head_camo1","gsc_cloth_loner_head","gsc_eco_stalker_mask_duty","gsc_eco_stalker_head_duty","gsc_eco_stalker_mask_neutral","gsc_eco_stalker_head_neutral","nof_fsk_tl","nof_fsk_marksman","nof_fsk_grenadier","nof_fsk_heavy","nof_fsk_corpsman","MVD_Soldier"];
//Bandit
Clothing21 = ["Bandit1_DZ","Winter_SOF_Sabot","Winter_SOF_MG","Winter_SOF_TL","Winter_SOF_Medic","Winter_SOF_Marksman","Winter_SOF_GL","Winter_SOF_AT","Winter_SOF_AC","Winter_SOF_DA1","Winter_SOF_DA1a","Winter_SOF_DA1b","Winter_SOF_DA1c","Winter_OPFOR1","Winter_OPFOR2","Winter_OPFOR3","Winter_OPFOR4","Winter_OPFOR5","Winter_OPFOR6","Winter_OPFOR7","Winter_OPFOR8","Winter_OPFOR9","Winter_OPFOR10","EWinter_OPFOR1","EWinter_OPFOR2","EWinter_OPFOR3","EWinter_OPFOR4","EWinter_OPFOR5","EWinter_OPFOR6","EWinter_OPFOR7","EWinter_OPFOR8","EWinter_OPFOR9","EWinter_OPFOR10"];
Clothing22 = ["Bandit2_DZ","Gangsta_merc1","Gangsta_merc2","Gangsta_merc3","Gangsta_merc4","Gangsta_merc5","Gangsta_merc6","Gangsta_merc7","Gangsta_merc8","Gangsta_merc9","Gangsta_merc10","EGangsta_merc1","EGangsta_merc2","EGangsta_merc3","EGangsta_merc4","EGangsta_merc5","EGangsta_merc6","EGangsta_merc7","EGangsta_merc8","EGangsta_merc9","EGangsta_merc10","Taliban1","Taliban2","Taliban3","Taliban4","Taliban5","Taliban6","Taliban7","Taliban8","Taliban9","Taliban10","Taliban11","Taliban12","ETaliban1","ETaliban2","ETaliban3","ETaliban4","ETaliban5","ETaliban6","ETaliban7","ETaliban8","ETaliban9","ETaliban10","ETaliban11","ETaliban12","Terrorist1","Terrorist2","Terrorist3","Terrorist4","Terrorist5","Terrorist6","Terrorist7","Terrorist8","Terrorist9","Terrorist10","Terrorist11","Terrorist12","ETerrorist1","ETerrorist2","ETerrorist3","ETerrorist4","ETerrorist5","ETerrorist6","ETerrorist7","ETerrorist8","ETerrorist9","ETerrorist10","ETerrorist11","ETerrorist12"];
Clothing23 = ["BanditW1_DZ"]; // DIrty Women
Clothing24 = ["BanditW2_DZ"]; // DIrty Women
Clothing25 = ["GUE_Commander_DZ","US_Army_Soldier_Light","US_Army_Soldier_GL","US_Army_Soldier2","US_Army_Soldier_Officer","US_Army_Soldier_SL","US_Army_Soldier_TL","US_Army_Soldier_LAT","US_Army_Soldier_AT","US_Army_Soldier_HAT","US_Army_Soldier_AA","US_Army_Soldier_Medic","US_Army_Soldier_AR","US_Army_Soldier_MG","US_Army_SoldierS_SniperH","US_Army_SoldierM_Marksman","US_Army_SoldierS"];
Clothing26 = ["GUE_Soldier_2_DZ","Desert_SOF_TL","Desert_SOF_GL","Desert_SOF_MG","Desert_SOF_AT","Desert_SOF_Medic","Desert_SOF_Marksman","Desert_SOF_AC","Desert_SOF_Shotgun","Desert_SOF_Sabot","Desert_SOF_DA1","Desert_SOF_DA1a","Desert_SOF_DA1b","Desert_SOF_DA2","WDL_Mercenary_Default0","WDL_Mercenary_Default1","WDL_Mercenary_Default2","WDL_Mercenary_Default3","WDL_Mercenary_Default4","WDL_Mercenary_Default5","WDL_Mercenary_Default5a","G_WDL_Mercenary_Default5a","WDL_Mercenary_Default6","WDL_Mercenary_Default7","WDL_Mercenary_Default8","WDL_Mercenary_Default9","WDL_Mercenary_Default10","WDL_Mercenary_Default11","WDL_Mercenary_Default12","WDL_Mercenary_Default13","WDL_Mercenary_Default14","WDL_Mercenary_Default15","WDL_Mercenary_Default16"];
Clothing27 = ["GUE_Soldier_CO_DZ","G_Mercenary_Default9a","G_Mercenary_Default9b","Mercenary_Default10","Mercenary_Default11","Mercenary_Default12","Mercenary_Default13","Mercenary_Default14","Mercenary_Default15","Mercenary_Default16","Mercenary_Default17","Mercenary_Default18","Mercenary_Default19","Mercenary_Default19a","G_Mercenary_Default19a","Mercenary_Default20","Mercenary_Default22","Mercenary_Default23","Mercenary_Default24","Mercenary_Default25","Mercenary_Default26","Mercenary_Default27","Mercenary_Default28","G_Mercenary_Default0","G_Mercenary_Default1","G_Mercenary_Default2","G_Mercenary_Default3","G_Mercenary_Default4","G_Mercenary_Default5","G_Mercenary_Default6","G_Mercenary_Default7","G_Mercenary_Default8","G_Mercenary_Default9","G_Mercenary_Default10","G_Mercenary_Default11","G_Mercenary_Default12","G_Mercenary_Default13","G_Mercenary_Default14","G_Mercenary_Default15","G_Mercenary_Default16","G_Mercenary_Default17","G_Mercenary_Default18","G_Mercenary_Default19","G_Mercenary_Default20","G_Mercenary_Default20b","G_Mercenary_Default21","G_Mercenary_Default22","G_Mercenary_Default23","G_Mercenary_Default24","G_Mercenary_Default25","G_Mercenary_Default26","G_Mercenary_Default27","G_Mercenary_Default28"];
AllPlayers = AllPlayers + Clothing1 + Clothing2 + Clothing3 + Clothing4 + Clothing5 + Clothing6 + Clothing7 + Clothing8 + Clothing9 + Clothing10 + Clothing11  + Clothing12  + Clothing13  + Clothing14  + Clothing15  + Clothing16  + Clothing17  + Clothing18  + Clothing19 + Clothing20 + Clothing21+ Clothing22+ Clothing23+ Clothing24+ Clothing25+ Clothing26+ Clothing27 ;
gear_done = false;
//Cooking
meatraw = [
	"FoodSteakRaw",
	"FoodmeatRaw",
	"FoodbeefRaw",
	"FoodmuttonRaw",
	"FoodchickenRaw",
	"FoodrabbitRaw",
	"FoodbaconRaw",
	"ItemTrout",
	"ItemSeaBass",
	"ItemTuna"
];
exceptionsraw = ["ItemTuna"];
meatcooked = [
	"FoodSteakCooked",
	"FoodmeatCooked",
	"FoodbeefCooked",
	"FoodmuttonCooked",
	"FoodchickenCooked",
	"FoodrabbitCooked",
	"FoodbaconCooked",
	"ItemTroutCooked",
	"ItemSeaBassCooked",
	"ItemTunaCooked"
];
//Eating
no_output_food = ["FoodMRE", "FoodPistachio", "FoodNutmix","FoodBioMeat"]+meatcooked+meatraw;

// Food with increased chance for infection.
badfood = ["FoodBioMeat","FoodCanUnlabeled"];

food_with_output=[
	"FoodCanBakedBeans",
	"FoodCanSardines",
	"FoodCanFrankBeans",
	"FoodCanPasta",
	"FoodCanGriff",
	"FoodCanBadguy",
	"FoodCanBoneboy",
	"FoodCanCorn",
	"FoodCanCurgon",
	"FoodCanDemon",
	"FoodCanFraggleos",
	"FoodCanHerpy",
	"FoodCanOrlok",
	"FoodCanPowell",
	"FoodCanTylers",
	"FoodCanUnlabeled"
];

food_output = [
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty"
];
//Drinking
no_output_drink = ["ItemWaterbottle", "ItemWaterbottleBoiled"];
drink_with_output = [
	"ItemSoda",  //just to define item for ItemSodaEmpty
	"ItemSodaRbull",
	"ItemSodaOrangeSherbet",
	"ItemSodaCoke",
	"ItemSodaPepsi",
	"ItemSodaMdew",
	"ItemSodaMtngreen",
	"ItemSodaR4z0r",
	"ItemSodaClays",
	"ItemSodaSmasht",
	"ItemSodaDrwaste",
	"ItemSodaLemonade",
	"ItemSodaLvg",
	"ItemSodaMzly",
	"ItemSodaRabbit"
];
drink_output = [
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];
boil_tin_cans = [
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];

dayz_combination = "";
dayz_humanitytarget = "";
dayz_combatLog = "";
canRoll = true;

canbuild = true;

//Hunting Variables
dayZ_partClasses = [
	"PartFueltank",
	"PartWheel",
	//"PartGeneric",	//No need to add, it is default for everything
	"PartEngine"
];
dayZ_explosiveParts = [
	"palivo",
	"motor"
];
//Survival Variables
SleepFood =				2160; //minutes (48 hours)
SleepWater =			1440; //minutes (24 hours)
SleepTemperatur	= 		90 / 100;	//Firs Value = Minutes untill Player reaches the coldest Point at night (without other effects! night factor expected to be -1)			//TeeChange

//Server Variables
allowConnection = 		false;
isSinglePlayer =		false;
PVDZE_serverObjectMonitor = [];
PlayerDeaths = [];

//Streaming Variables (player only)
dayz_Locations = [];
dayz_locationsActive = [];

//GUI
Dayz_GUI_R = 0.38; // 0.7
Dayz_GUI_G = 0.63; // -0.63
Dayz_GUI_B = 0.26; // -0.26
if (isNil "Dayz_Dark_UI") then {
	Dayz_Dark_UI = false;
};

//Player self-action handles
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_packvault = 	-1;
	s_player_lockvault = 	-1;
	s_player_unlockvault = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_dropflare =	-1;
	s_player_callzombies = 	-1;
	s_player_showname = 	-1;
	s_player_debuglootpos = 	-1;
	s_player_pzombiesattack = 	-1;
	s_player_pzombiesvision =	-1;
	s_player_pzombiesfeed = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_player_tamedog =		-1;
	s_player_madsci_crtl =	-1;
	s_player_parts_crtl =	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_checkGear = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_repair_crtl =  -1;
	s_player_information =  -1;
	s_player_fuelauto    =  -1;
	s_player_fuelauto2    =  -1;
	s_player_fillgen	 =  -1;
	s_player_upgrade_build	 =  -1;
	s_player_maint_build	 =  -1;
	s_player_downgrade_build	 =  -1;
	s_player_towing		 =  -1;
	s_halo_action =         -1;
	s_player_SurrenderedGear = -1;
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
	s_player_heli_lift = -1;
	s_player_heli_detach = -1;
	s_player_lockUnlock_crtl = -1;
	s_player_toggleDegree = -1;
	s_player_toggleDegrees=[];
	degreeActions = -1;
	s_player_toggleVector = -1;
	s_player_toggleVectors=[];
	vectorActions = -1;
	s_player_toggleSnap = -1;
    s_player_toggleSnapSelect = -1;
    s_player_toggleSnapSelectPoint=[];
    snapActions = -1;
	s_player_plot_boundary_on = -1;
	s_player_plot_boundary_off = -1;
	s_player_plot_take_ownership = -1;
	s_player_plotManagement = -1;
	s_player_manageDoor = -1;
	s_sub_up = -1;
	s_sub_down = -1;
	s_player_elevator_next = -1;
	s_player_elevator_previous = -1;
	s_player_elevator_select = -1;
	s_player_elevator_upgrade = -1;
	s_player_elevator_upgrade_stop = -1;
	s_player_elevator_call = -1;
	s_player_elevator_id = -1;
	s_player_checkwallet = -1;
	s_givemoney_dialog = -1;
	s_bank_dialog = -1;
	s_bank_dialog2 = -1; 
	ah1z_fold = -1;
    ah1z_unfold = -1;
    mv22_fold = -1;
    mv22_unfold = -1;
    mv22_open = -1;
    mv22_close = -1;
    suv_close = -1;
    suv_open = -1;
    uh1y_fold = -1;
    uh1y_unfold = -1;
	s_player_claimvehicle = -1;
	bucketOut = -1;
	bucketIn = -1;
	s_player_copytokey = -1;
	s_player_claimVehicle = -1;
	s_clothes = -1;
	s_player_fillbottlewithrain = -1;
	s_player_drinkWater = -1;
	s_player_igniteTent = -1;
	s_player_nuke = -1;
	s_player_selfbloodbag = -1;
	zombieshield = -1;
	btc_liftactionid = -1;
	s_player_nitrobooston = -1;
	s_player_nitroInstall = -1;
	s_player_put_earplugs_on = -1;
    s_player_put_earplugs_off = -1;
	s_player_arrest = -1;
	s_player_escort = -1;
	s_player_search = -1;
	s_player_release = -1;
	s_player_breakfree = -1;
	s_player_garage = -1;
};
call dayz_resetSelfActions;

//Engineering variables
s_player_lastTarget =	[objNull,objNull,objNull,objNull,objNull];
s_player_repairActions = [];
s_player_lockunlock = [];
VehiclePreviewHotkey = -1;
SkinPreviewHotkey = -1;

// Custom
s_player_madsci 		= 	[];
s_player_parts 			= 	[];
s_player_combi 			= 	[];

//Modular player_build
snapGizmos = [];
snapGizmosNearby = [];

//Initialize Medical Variables
r_interrupt = 			false;
r_doLoop = 				false;
r_self = 				false;
r_self_actions = 		[];
r_drag_sqf = 			false;
r_action = 				false;
r_action_unload = 		false;
r_player_handler = 		false;
r_player_handler1 = 	false;
r_player_dead = 		false;
r_player_unconscious = 	false;
r_player_infected =		false;
r_player_injured = 		false;
r_player_inpain = 		false;
r_player_loaded = 		false;
r_player_cardiac = 		false;
r_fracture_legs =		false;
r_fracture_arms =		false;
r_player_vehicle =		player;
r_player_blood = 		12000;
r_player_lowblood = 	false;
r_player_timeout =		0;
r_player_bloodTotal = 	r_player_blood;
r_public_blood =		r_player_blood;
r_player_bloodDanger =	r_player_bloodTotal * 0.2;
r_player_actions = 		[];
r_handlerCount = 		0;
r_action_repair = 		false;
r_action_targets = 		[];
r_pitchWhine = 			false;
r_isBandit =			false;
isInTraderCity =		false;
NORRN_dropAction =		-1;
DZE_PROTOBOX = 			objNull;
lastBloodbag =			0;
sleepTimer = 			60;

//ammo routine
r_player_actions2 = [];
r_action2 = false;
r_player_lastVehicle = objNull;
r_player_lastSeat = [];
r_player_removeActions2 = {
	if (!isNull r_player_lastVehicle) then {
		{
			r_player_lastVehicle removeAction _x;
		} count r_player_actions2;
		r_player_actions2 = [];
		r_action2 = false;
	};
};

USEC_woundHit 	= [
	"",
	"body",
	"hands",
	"legs",
	"head_hit"
];
DAYZ_woundHit 	= [
	[
		"body",
		"hands",
		"legs",
		"head_hit"
	],
	[ 0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,3]
];
DAYZ_woundHit_ok = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,0,0,0,1,1,1,2,2]
];
DAYZ_woundHit_dog = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2]
];
USEC_MinorWounds 	= [
	"hands",
	"legs"
];
USEC_woundPoint	= [
	["Pelvis","aimpoint"],
	["aimpoint"], //,"RightShoulder","LeftShoulder"
	["lelbow","relbow"],
	["RightFoot","LeftFoot"],
	["neck","pilot"]
];
USEC_typeOfWounds = [
	"Pelvis",
	"aimpoint",
	"lelbow","relbow",
	"RightFoot","LeftFoot",
	"neck","pilot"
];

DZE_vehicleZwounds = [
	"sklo predni L",
	"sklo predni P",
	"sklo zadni",
	"sklo zadni L",
	"sklo zadni P",
	"sklo P",
	"Glass1",
	"Glass2",
	"Glass3",
	"Glass4",
	"Glass5",
	"Glass6"
];

DZE_HeliAllowTowFrom = [
	"CH_47F_EP1_DZE",
	"CH_47F_EP1_DZ",
	"CH_47F_BAF",
	"CH_47F_EP1",
	"BAF_Merlin_DZE",
	"CH53_DZE"
];

DZE_HeliAllowToTow = [
	"hilux1_civil_1_open",
	"HMMWV_Base",
	"Lada_base",
	"Offroad_DSHKM_base",
	"Pickup_PK_base",
	"SkodaBase",
	"tractor",
	"VWGolf",
	"Volha_TK_CIV_Base_EP1",
	"S1203_TK_CIV_EP1",
	"SUV_Base_EP1",
	"ArmoredSUV_Base_PMC",
	"UAZ_Base",
	"LandRover_Base",
	"Ship"
];

//Initialize Zombie Variables
dayz_zombieTargetList = [
	["SoldierWB",50],
	["Air",500],
	["LandVehicle",200]
];
PVDZE_plr_Hit = [];
PVDZE_obj_Publish = [];		//used for eventhandler to spawn a mirror of players tent
PVDZE_plr_HideBody = objNull;
dayz_selectedVault = objNull;
dayz_selectedDoor = objNull;

PVDZE_veh_Publish = [];		// for vehicle traders
PVDZE_obj_Trade = [];		// For all traders increment qty
PVDZE_plr_TradeMenu = [];  		// For all traders
PVDZE_plr_DeathB = [];

//DayZ settings
dayz_dawn = 6;
dayz_dusk = 18;
DAYZ_agentnumber = 0;
dayz_animalDistance = 800;
dayz_zSpawnDistance = 1000;

dayz_maxMaxModels = 80; // max quantity of Man models (player || Z, dead || alive) around players. Below this limit we can spawn Z // max quantity of loot piles around players. Below this limit we can spawn some loot
dayz_spawnArea = 200; // radius around player where we can spawn loot & Z
dayz_cantseeDist = 150; // distance from which we can spawn a Z in front of any player without ray-tracing && angle checks
dayz_cantseefov = 70; // half player field-of-view. Visible Z won't be spawned in front of any near players
dayz_canDelete = 300; // Z, further than this distance from its "owner", will be deleted

if(isNil "DZE_SelfTransfuse") then {
	DZE_SelfTransfuse = false;
};
if(isNil "dayz_maxAnimals") then {
	dayz_maxAnimals = 5;
};
if(isNil "timezoneswitch") then {
	timezoneswitch = 0;
};
if(isNil "dayz_maxLocalZombies") then {
	dayz_maxLocalZombies = 15;
};
if(isNil "dayz_maxGlobalZombiesInit") then {
	dayz_maxGlobalZombiesInit = 15;
};
if(isNil "dayz_maxGlobalZombiesIncrease") then {
	dayz_maxGlobalZombiesIncrease = 5;
};
if(isNil "dayz_maxZeds") then {
	dayz_maxZeds = 500;
};
if (isNil "DZE_PlayerZed") then {
	DZE_PlayerZed = true;
};
if (isNil "DZE_GodModeBase") then {
	DZE_GodModeBase = false;
};
if(isNil "DZEdebug") then {
	DZEdebug = false;
};
if (isNil "DZE_Debug_Damage") then {
	DZE_Debug_Damage = true;
};
if(isNil "DZE_TRADER_SPAWNMODE") then {
	DZE_TRADER_SPAWNMODE = false;
};
if(isNil "dayz_tameDogs") then {
	dayz_tameDogs = false;
};
if(isNil "dayz_sellDistance_vehicle") then {
	dayz_sellDistance_vehicle = 10;
};
if(isNil "dayz_sellDistance_boat") then {
	dayz_sellDistance_boat = 30;
};
if(isNil "dayz_sellDistance_air") then {
	dayz_sellDistance_air = 40;
};
if(isNil "dayz_paraSpawn") then {
	dayz_paraSpawn = false;
};
if(isNil "dayz_minpos") then {
	dayz_minpos = -20000;
};
if(isNil "dayz_maxpos") then {
	dayz_maxpos = 20000;
};
if(isNil "DZE_BuildingLimit") then {
	DZE_BuildingLimit = 150;
};
if(isNil "DZE_HumanityTargetDistance") then {
	DZE_HumanityTargetDistance = 25;
};
if(isNil "DZE_FriendlySaving") then {
	DZE_FriendlySaving = true;
};
if(isNil "DZE_BuildOnRoads") then {
	DZE_BuildOnRoads = false;
};
if(isNil "DZE_MissionLootTable") then {
	DZE_MissionLootTable = false;
};
if(isNil "DZE_ConfigTrader") then {
	DZE_ConfigTrader = false;
};
if(isNil "DZE_LootSpawnTimer") then {
	DZE_LootSpawnTimer = 10;
};
if(isNil "DZE_HeliLift") then {
	DZE_HeliLift = true;
};
if(isNil "DZE_DamageBeforeMaint") then {
	DZE_DamageBeforeMaint = 0.09;
};
if(isNil "DZE_StaticConstructionCount") then {
	DZE_StaticConstructionCount = 0;
};
if (isNil "DZE_selfTransfuse_Values") then {
	DZE_selfTransfuse_Values = [12000, 15, 300];
};
if (isNil "helperDetach") then {
	helperDetach = false;
};
if (isNil "DZE_snapExtraRange") then {
	DZE_snapExtraRange = 0;
};
if (isNil "DZE_PlotOwnership") then {
	DZE_PlotOwnership = false;
};
if (isNil "DZE_checkNearbyRadius") then {
	DZE_checkNearbyRadius = 30;
};

// needed on server
if(isNil "DZE_PlotPole") then {
	DZE_PlotPole = [30,45];
};
if(isNil "DZE_maintainRange") then {
	DZE_maintainRange = ((DZE_PlotPole select 0)+20);
};

DZE_snap_build_file = "";

DZE_REPLACE_WEAPONS = [["Crossbow","ItemMatchbox","ItemHatchet"],["Crossbow_DZ","ItemMatchbox_DZE","ItemHatchet_DZE"]];

if(isNil "dayz_zedSpawnVehCount") then {
	dayz_zedSpawnVehCount = dayz_maxLocalZombies / 2;
};
if(isNil "dayz_spawnAirCount") then {
	dayz_spawnAirCount = 0;
};
if(isNil "dayz_zedsAttackVehicles") then {
	dayz_zedsAttackVehicles = true;
};

// update objects
dayz_updateObjects = ["Plane","Tank","Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "VaultStorage","LockboxStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","Scaffolding_DZ"];
dayz_disallowedVault = ["TentStorage", "BuiltItems","ModularItems","DZE_Base_Object"];
dayz_reveal = ["AllVehicles","WeaponHolder","Land_A_tent","BuiltItems","ModularItems","DZE_Base_Object"];
dayz_allowedObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","BagFenceRound_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Land_HBarrier5_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodStairsRails_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ","GunRack_DZ","FireBarrel_DZ","WoodCrate_DZ","Scaffolding_DZ","MetalFloor_Preview_DZ","HeliHRescue","Land_MBG_Garage_Single_A","Land_MBG_Garage_Single_B","Land_MBG_Garage_Single_C","Land_MBG_Garage_Single_D"];

DZE_LockableStorage = ["VaultStorage","VaultStorageLocked","LockboxStorageLocked","LockboxStorage"];
DZE_LockedStorage = ["VaultStorageLocked","LockboxStorageLocked"];
DZE_UnLockedStorage = ["VaultStorage","LockboxStorage"];
DZE_maintainClasses = ["ModularItems","DZE_Housebase","LightPole_DZ","BuiltItems","Plastic_Pole_EP1_DZ","Fence_corrugated_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","StickFence_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","DeerStand_DZ","Scaffolding_DZ","FireBarrel_DZ"] + dayz_allowedObjects + DZE_LockedStorage + DZE_UnLockedStorage;

DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];

// List of removable items that require crowbar
DZE_isRemovable = ["Fence_corrugated_DZ","M240Nest_DZ","ParkBench_DZ","Plastic_Pole_EP1_DZ","FireBarrel_DZ","Scaffolding_DZ"];
DZE_isWreck = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
DZE_isWreckBuilding = ["Land_wreck_cinder","Land_wood_wreck_quarter","Land_wood_wreck_floor","Land_wood_wreck_third","Land_wood_wreck_frame","Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck","Land_ammo_supply_wreck"];
DZE_isNewStorage = ["VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"];

// These work with just a running generator
dayz_fuelpumparray = ["FuelPump_DZ","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","FuelStation","Land_ibr_FuelStation_Feed","Land_fuelstation_army","Land_fuelstation","land_fuelstation_w","Land_benzina_schnell"];
DZE_fueltruckarray = ["KamazRefuel_DZ","UralRefuel_TK_EP1_DZ","MtvrRefuel_DES_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ","MtvrRefuel_DZ","KamazRefuel_DZE","UralRefuel_TK_EP1_DZE","MtvrRefuel_DES_EP1_DZE","V3S_Refuel_TK_GUE_EP1_DZE","MtvrRefuel_DZE"];

// Standard Fuel sources
dayz_fuelsources = ["Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_stairs","Land_fuel_tank_stairs_ep1","Land_wagon_tanker","Land_fuelstation","Land_fuelstation_army","land_fuelstation_w","Land_benzina_schnell"];

DZE_Lock_Door = "";

if (isNil "DZE_plotOwnershipExclusions") then {
	DZE_plotTakeOwnershipItems = dayz_allowedObjects - (DZE_LockableStorage + ["Plastic_Pole_EP1_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"]);
};

//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";

if(isServer) then {
	dayz_players = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];

	DZE_DYN_AntiStuck = 0;
	DZE_DYN_AntiStuck2nd = 0;
	DZE_DYN_AntiStuck3rd = 0;

	if(isNil "dayz_fullMoonNights") then {
		dayz_fullMoonNights = false;
	};
	if(isNil "EpochEvents") then {
		EpochEvents = [];
	};
	if(isNil "DZE_vehicleAmmo") then {
		DZE_vehicleAmmo = 0;
	};

	if(isNil "DZE_BackpackGuard") then {
		DZE_BackpackGuard = true;
	};

	if(isNil "DZE_CleanNull") then {
		DZE_CleanNull = false;
	};
	if (isNil "DZE_DeathMsgGlobal") then {
		DZE_DeathMsgGlobal = false;
	};
	if (isNil "DZE_DeathMsgSide") then {
		DZE_DeathMsgSide = false;
	};
	if (isNil "DZE_DeathMsgTitleText") then {
		DZE_DeathMsgTitleText = false;
	};
	DZE_safeVehicle = ["ParachuteWest","ParachuteC","HeliHRescue"];
};

if(!isDedicated) then {

	dayz_spawnPos = getPosATL player;

	dayz_buildingMonitor = [];	//Buildings to check
	dayz_bodyMonitor = [];

	// weather control var
	zeroPreviousWeather = [0,0,[0,0],0];
	zeroCurrentWeather = [0,0,[0,0],0];

	if (DZE_MissionLootTable) then {
		dayz_baseTypes = 		getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	} else {
		dayz_baseTypes = 		getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	};


	//temperature variables
	dayz_temperatur 		= 	36;		//TeeChange
	dayz_temperaturnormal 	= 	36;		//TeeChange
	dayz_temperaturmax 		= 	42;		//TeeChange
	dayz_temperaturmin 		= 	27;		//TeeChange

	//player special variables
	dayZ_lastPlayerUpdate = 0;
	dayZ_everyonesTents =	[];
	dayz_hunger	=			0;
	dayz_thirst = 			0;
	dayz_combat =			0;
	dayz_preloadFinished = 	false;
	dayz_statusArray =		[1,1];
	dayz_disAudial =		0;
	dayz_disVisual =		0;
	dayz_firedCooldown = 	0;
	dayz_DeathActioned =	false;
	dayz_canDisconnect = 	true;
	dayz_damageCounter =	time;
	dayz_lastSave =			time;
	dayz_isSwimming	=		true;
	dayz_isKneeling	=		false;
	dayz_isCrawling	=		false;
	dayz_PreviousTown =		"Wilderness";
	dayz_currentDay = 		0;
	dayz_hasLight = 		false;
	dayz_surfaceNoise =		0;
	dayz_surfaceType =		"None";
	dayz_noPenalty = 		[];
	dayz_heavenCooldown =	0;
	deathHandled = 			false;
	dayz_lastHumanity =		0;
	dayz_guiHumanity =		-90000;
	dayz_firstGroup = 		group player;
	dayz_originalPlayer = 	player;
	dayz_sourceBleeding =	objNull;
	dayz_clientPreload = 	false;
	dayz_authed = 			false;
	dayz_panicCooldown = 	0;
	dayz_areaAffect =		2.5;
	dayz_heartBeat = 		false;
	dayzClickTime =			0;
//Current local
	dayz_spawnZombies = 0;
	dayz_swarmSpawnZombies = 0;
//Max local
	dayz_CurrentNearByZombies = 0;
//Max NearBy
	if (isNil "dayz_maxNearByZombies") then {
		dayz_maxNearByZombies = 60; // max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
//Current total
	};
	dayz_currentGlobalZombies = 0;
//Max global zeds.
	if (isNil "dayz_maxGlobalZeds") then {
		dayz_maxGlobalZeds = 3000;
	};
	if (isNil "dayz_spawnDelay") then {
		dayz_spawnDelay =		120;
	};
	dayz_spawnWait =		-(dayz_spawnDelay);
	if (isNil "dayz_lootDelay") then {
		dayz_lootDelay =		3;
	};
	dayz_lootWait =			-300;
	//used to count global zeds around players
	dayz_CurrentZombies = 0;
	//Used to limit overall zed counts
	dayz_tickTimeOffset = 0;
	dayz_currentWeaponHolders = 0;
	dayz_maxMaxWeaponHolders = 80;
	dayz_maxCurrentZeds = 0;
	dayz_inVehicle =		false;
	dayz_Magazines = 		[];
	dayzGearSave = 			false;
	dayz_unsaved =			false;
	dayz_scaleLight = 		0;
	dayzDebug = false;
	dayzState = -1;
	//uiNamespace setVariable ['DAYZ_GUI_display',displayNull];
	//if (uiNamespace getVariable ['DZ_displayUI', 0] == 2) then {
	//	dayzDebug = true;
	//};

	DZE_ActionInProgress =		false;

	// DayZ Epoch Client only variables
	if(isNil "DZE_AllowForceSave") then {
		DZE_AllowForceSave = false;
	};
	if(isNil "DZE_AllowCargoCheck") then {
		DZE_AllowCargoCheck = true;
	};
	if(isNil "DZE_ForceNameTags") then {
		DZE_ForceNameTags = false;
	};
	if(isNil "DZE_ForceNameTagsOff") then {
		DZE_ForceNameTagsOff = false;
	};
	if(isNil "DZE_ForceNameTagsInTrader") then {
		DZE_ForceNameTagsInTrader = false;
	};
	if(isNil "DZE_HaloJump") then {
		DZE_HaloJump = true;
	};

	if(isNil "DZE_AntiWallLimit") then {
		DZE_AntiWallLimit = 3;
	};
	if(isNil "DZE_requireplot") then {
		DZE_requireplot = 1;
	};
	if(isNil "DZE_R3F_WEIGHT") then {
		DZE_R3F_WEIGHT = true;
	};


	DZE_AntiWallCounter = 0;

	DZE_FreshSpawn = false;

	DZE_myHaloVehicle = objNull;
	dayz_myLiftVehicle = objNull;

	DZE_Friends = [];

	DZE_CanPickup = true;
	DZE_Q = false;
	DZE_Z = false;

	DZE_Q_alt = false;
	DZE_Z_alt = false;

	DZE_Q_ctrl = false;
	DZE_Z_ctrl = false;

	DZE_5 = false;
	DZE_4 = false;
	DZE_6 = false;
	
	DZE_F = false;

	DZE_cancelBuilding = false;
	DZE_PZATTACK = false;

	DZE_trees = ["t_picea2s_snow.p3d","b_corylus.p3d","t_quercus3s.p3d","t_larix3s.p3d","t_pyrus2s.p3d","str_briza_kriva.p3d","dd_borovice.p3d","les_singlestrom_b.p3d","les_singlestrom.p3d","smrk_velky.p3d","smrk_siroky.p3d","smrk_maly.p3d","les_buk.p3d","str krovisko vysoke.p3d","str_fikovnik_ker.p3d","str_fikovnik.p3d","str vrba.p3d","hrusen2.p3d","str dub jiny.p3d","str lipa.p3d","str briza.p3d","p_akat02s.p3d","jablon.p3d","p_buk.p3d","str_topol.p3d","str_topol2.p3d","p_osika.p3d","t_picea3f.p3d","t_picea2s.p3d","t_picea1s.p3d","t_fagus2w.p3d","t_fagus2s.p3d","t_fagus2f.p3d","t_betula1f.p3d","t_betula2f.p3d","t_betula2s.p3d","t_betula2w.p3d","t_alnus2s.p3d","t_acer2s.p3d","t_populus3s.p3d","t_quercus2f.p3d","t_sorbus2s.p3d","t_malus1s.p3d","t_salix2s.p3d","t_picea1s_w.p3d","t_picea2s_w.p3d","t_ficusb2s_ep1.p3d","t_populusb2s_ep1.p3d","t_populusf2s_ep1.p3d","t_amygdalusc2s_ep1.p3d","t_pistacial2s_ep1.p3d","t_pinuse2s_ep1.p3d","t_pinuss3s_ep1.p3d","t_prunuss2s_ep1.p3d","t_pinusn2s.p3d","t_pinusn1s.p3d","t_pinuss2f.p3d","t_poplar2f_dead_pmc.p3d","misc_torzotree_pmc.p3d","misc_burnspruce_pmc.p3d","brg_cocunutpalm8.p3d","brg_umbrella_acacia01b.p3d","brg_jungle_tree_canopy_1.p3d","brg_jungle_tree_canopy_2.p3d","brg_cocunutpalm4.p3d","brg_cocunutpalm3.p3d","palm_01.p3d","palm_02.p3d","palm_03.p3d","palm_04.p3d","palm_09.p3d","palm_10.p3d","brg_cocunutpalm2.p3d","brg_jungle_tree_antiaris.p3d","brg_cocunutpalm1.p3d","str habr.p3d"];
	DZE_TEMP_treedmg = 1;

	DZE_Surrender = false;
	DZE_Quarantine = false;
	DZE_InRadiationZone = false;

	DZE_SaveTime = 30;
	
	Earplugs = false;
	
	// Origins Addons
	Thesub = vehicle player;
	ExcavateVeh = vehicle player;
};
ColourVehicles = [
	"ori_excavator",
	"ori_submarine",
	"ORI_gunship_helicopter",
	"ori_p85_originsmod_CUCV",
	"ori_p85_originsmod_cucv_pickup",
	"ori_vil_originsmod_volvo_fl290",
	"ori_originsmod_pickupold",
	"ori_originsmod_pickupoldfuel",
	"SkodaRed_DZE4",
	"SkodaRed_DZE2",
	"V3S_Refuel_TK_GUE_EP1_DZ",
	"SkodaGreen_DZE2",
	"Volha_1_TK_CIV_EP1_DZE2",
	"Volha_1_TK_CIV_EP1_DZE3",
	"LadaLM_DZE3",
	"LadaLM_DZE4",
	"helix1_civil_2_covered_DZE",
	"helix1_civil_2_covered_DZE2",
	"datson1_civil_3_open_DZE",
	"ori_bigRaft",
	"ori_smallRaft",
	"M113Ambul_TK_EP1_DZ",
	"T34_TK_GUE_EP1",
	"KamazRefuel_DZ",
	"SUV_MG_Ori",
	"Volha_1_TK_CIV_EP1",
	"ori_rth_originsmod_bathmobile",
	"LadaLM",
	"GAZ_Vodnik_MedEvac",
	"BTR60_TK_EP1",
	"LandRover_CZ_EP1",
	"LandRover_Special_CZ_EP1",
	"Civcar",
	"Civcarge",
	"Civcarsl",
	"Civcarwh",
	"Civcarbl",
	"Civcarre",
	"Civcarbu",
	"Copcar",
	"350z",
	"350z_kiwi",
	"CVP1_Patrol",
	"CVPI_LAPD_Patrol",
	"CVPI_LAPDSL_Patrol",
	"CVPI_NYPDSL_Patrol",
	"CVPI_Trooper_Patrol",
	"CVPI_TrooperSL_Patrol",
	"CVPI_UnmarkedW_Patrol",
	"CVPI_UnmarkedG_Patrol",
	"CVPI_UnmarkedB_Patrol",
	"CVPI_HighwaySL_Patrol",
	"Copcarswat",
	"Copcarhw",
	"UH1H_DZ",
	"UH1Y_DZE",
	"MH60S",
	"MH60S_DZE",
	"MH60S_DZ",
	"UH1H_DZE",
	"AH64D",
	"CH53_DZE",
	"Ka137_PMC",
	"Ka137_MG_PMC",
	"UH1H_TK_GUE_EP1",
	"Ka60_GL_PMC",
	"An2_TK_EP1",
	"Mi17_DZE",
	"Mi17_DZ",
	"AH1Z",
	"vil_ori_autogyro",
	"Mi171Sh_CZ_EP1",
	"Mi171Sh_rockets_CZ_EP1",
	"UH1Y",
	"F35B",
	"AH64D_EP1",
	"Chukar_EP1",
	"BAF_Merlin_HC3_D",
	"BAF_Merlin_DZE",
	"AN2_DZ",
	"ori_dc3",
	"CH_47F_EP1_DZ",
	"SeaFox_EP1",
	"USEC_ch53_E",
	"Mi17_medevac_RU",
	"smallboat_2",
	"Smallboat_1",
	"SeaFox",
	"Fishing_Boat",
	"PBX",
	"Zodiac",
	"RHIB2Turret",
	"RHIB",
	"BAF_FV510_W",
	"BAF_FV510_D",
	"BAF_Jackal2_GMG_W",
	"BAF_Jackal2_L2A1_W",
	"BAF_Offroad_W",
	"Tractor",
	"BAF_Jackal2_GMG_D",
	"policecar",
	"BAF_Jackal2_L2A1_D",
	"BAF_Offroad_D",
	"T55_TK_EP1",
	"HMMWV_M2_USArmy",
	"V3S_Open_TK_EP1",
	"V3S_TK_EP1",
	"SkodaBlue",
	"SkodaRed",
	"SkodaGreen",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"tractorOld",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"GAZ_Vodnik_HMG",
	"GAZ_Vodnik",
	"Lada1",
	"MMT_USMC",
	"MMT_Civ",
	"M113Ambul_UN_EP1_DZ",
	"TowingTractor",
	"hilux1_civil_3_open_DZE4",
	"hilux1_civil_2_covered_DZE4",
	"hilux1_civil_3_open_DZE3",
	"hilux1_civil_2_covered_DZE3",
	"hilux1_civil_3_open_DZE2",
	"hilux1_civil_3_open_DZE1",
	"hilux1_civil_3_open_DZE",
	"Lada1_DZE4",
	"Lada1_DZE3",
	"HMMWV_M1151_M2_CZ_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"Lada1_DZE2",
	"LadaLM_DZE1",
	"HMMWV_Terminal_EP1",
	"Lada1_DZE1",
	"Lada1_DZE1",
	"datsun1_civil_3_open_DZE4",
	"datsun1_civil_3_open_DZE3",
	"LandRover_MG_TK_INS_EP1",
	"datsun1_civil_2_covered_DZE3",
	"LandRover_MG_TK_EP1",
	"datsun1_civil_3_open_DZE2",
	"LandRover_SPG9_TK_INS_EP1",
	"datsun1_civil_2_covered_DZE2",
	"LandRover_SPG9_TK_EP1",
	"datsun1_civil_3_open_DZE1",
	"datsun1_civil_2_covered_DZE1",
	"datsun1_civil_2_covered_DZE",
	"SkodaGreen_DZE4",
	"ArmoredSUV_PMC",
	"SkodaBlue_DZE4",
	"SkodaGreen_DZE3",
	"SkodaRed_DZE3",
	"SkodaBlue_DZE3",
	"SkodaBlue_DZE2",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"SkodaGreen_DZE1",
	"LandRover_Special_CZ_EP1_DZ",
	"SkodaRed_DZE1",
	"LandRover_Special_CZ_EP1_DZE",
	"SkodaBlue_DZE1",
	"LandRover_MG_TK_EP1_DZ",
	"Volha_1_TK_CIV_EP1_DZE4",
	"Volha_1_TK_CIV_EP1_DZE1",
	"LandRover_MG_TK_EP1_DZE",
	"GAZ_Vodnik_DZ",
	"ArmoredSUV_PMC_DZ",
	"GAZ_Vodnik_DZE",
	"ArmoredSUV_PMC_DZE",
	"ArmoredSUV_PMC_DZ",
	"MtvrRefuel_DZ",
	"UralRefuel_TK_EP1_DZ",
	"V3S_TK_EP1_DZE",
	"AV8B",
	"AV8B2",
	"CH_47F_EP1",
	"CH_47F_EP1_DZE",
	"MV22",
	"MV22_DZ",
	"UH1Y_DZ",
	"Ka60_PMC",
	"L39_TK_EP1",
	"BAF_Apache_AH1_D",
	"AW159_Lynx_BAF",
	"CH_47F_BAF",
	"CSJ_GyroP",
	"CSJ_GyroCover",
	"CSJ_GyroC"
];