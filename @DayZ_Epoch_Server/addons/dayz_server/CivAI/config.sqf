if(isServer) then {

	/* GENERAL CONFIG */

		debug_mode					= false;		// enable debug
		use_blacklist				= false;		// use blacklist
		blacklist					= [
			[[0,16000,0],[1000,-0,0]],				// Left
			[[0,16000,0],[16000.0,14580.3,0]]		// Top
		];

	/* END GENERAL CONFIG */
	if((toLower worldName) == 'jadegroove') then {
		use_blacklist = true;
		blacklist = [
			[[-10000,20000,0],[0,-10000,0]],	// Left
			[[0,20000,0],[10000,10000,0]],		// Top
			[[0,0,0],[10000,-10000,0]],			// Bottom
			[[10000,20000,0],[20000,-10000,0]]	// Right
		];
	};
	/* AI CONFIG */

		cai_clear_body 				= false;		// instantly clear bodies
		cai_clean_dead 				= true;			// clear bodies after certain amount of time
		cai_cleanup_time 			= 5;			// time to clear bodies in seconds
		cai_clean_roadkill			= true; 		// clean bodies that are roadkills
		cai_roadkill_damageweapon	= 100;			// percentage of chance a roadkill will destroy weapon AI is carrying

		cai_bandit_combatmode		= "YELLOW";		// combatmode of bandit AI
		cai_bandit_behaviour		= "Stealth";		// behaviour of bandit AI

		cai_hero_combatmode			= "YELLOW";		// combatmode of hero AI
		cai_hero_behaviour			= "Stealth";		// behaviour of hero AI

		cai_friendly_behaviour		= true;			// make ai friendly towards comrades

		civ_player_bandit			= -1;			// this is the amount you declare someone to be a bandit on your server, bandit AI will not attack you if ai_friendly_behaviour is true
		civ_player_hero				= 1;			// this is the amount you declare someone to be a hero on your server, hero AI will not attack you if ai_friendly_behaviour is true

		cai_share_info				= true;		// AI share info on player position
		cai_share_distance			= 5;			// distance from killed AI for AI to share your rough position

		cai_kills_gain				= true;			// add kill to bandit/human kill score
		cai_humanity_gain			= true;			// gain humanity for killing AI
		cai_add_humanity			= 10;			// amount of humanity gained for killing a bandit AI
		cai_remove_humanity			= 10;			// amount of humanity lost for killing a hero AI
		cai_special_humanity		= 10;			// amount of humanity gain or loss for killing a special AI dependant on player alignment
		
		ai_skill_extreme			= [["aimingAccuracy",0.90],["aimingShake",0.10],["aimingSpeed",0.90],["endurance",0.90],["spotDistance",1.00],["spotTime",0.90],["courage",1.00],["reloadSpeed",0.90],["commanding",1.00],["general",1.00]]; 	// Extreme
		ai_skill_hard				= [["aimingAccuracy",0.75],["aimingShake",0.25],["aimingSpeed",0.75],["endurance",0.75],["spotDistance",0.90],["spotTime",0.75],["courage",0.90],["reloadSpeed",0.75],["commanding",0.90],["general",0.75]]; 	// Hard
		ai_skill_medium				= [["aimingAccuracy",0.60],["aimingShake",0.40],["aimingSpeed",0.60],["endurance",0.60],["spotDistance",0.60],["spotTime",0.60],["courage",0.80],["reloadSpeed",0.60],["commanding",0.80],["general",0.60]];	// Medium
		ai_skill_easy				= [["aimingAccuracy",0.50],["aimingShake",0.50],["aimingSpeed",0.50],["endurance",0.50],["spotDistance",0.50],["spotTime",0.50],["courage",0.70],["reloadSpeed",0.50],["commanding",0.50],["general",0.50]];	// Easy
		ai_skill_supereasy			= [["aimingAccuracy",0.40],["aimingShake",0.60],["aimingSpeed",0.40],["endurance",0.40],["spotDistance",0.40],["spotTime",0.40],["courage",0.60],["reloadSpeed",0.40],["commanding",0.40],["general",0.40]];	// Super Easy
		cai_skill_random			= [cai_skill_extreme,cai_skill_hard,cai_skill_hard,cai_skill_hard,cai_skill_hard,cai_skill_medium,cai_skill_medium,cai_skill_medium,cai_skill_medium,cai_skill_easy,cai_skill_easy,cai_skill_easy,cai_skill_supereasy];

		cai_static_useweapon		= true;	// Allows AI on static guns to have a loadout 	
		cai_static_weapons			= ["KORD_high_TK_EP1","DSHKM_Ins","M2StaticMG"];	// static guns

		cai_static_skills			= true;	// Allows you to set custom array for AI on static weapons. (true: On false: Off) 
		cai_static_array			= [["aimingAccuracy",0.0001],["aimingShake",2.0],["aimingSpeed",0.0001],["endurance",0.0001],["spotDistance",0.00001],["spotTime",0.0001],["courage",0.0001],["reloadSpeed",0.0001],["commanding",0.0001],["general",0.0001]];

		cai_gear0					= [["ItemBandage","ItemBandage","ItemAntibiotic"],["ItemRadio","ItemMachete","ItemCrowbar"]];
		cai_gear1					= [["ItemBandage","ItemSodaPepsi","ItemMorphine"],["ItemCrowbar"]];
		cai_gear2					= [["ItemDocument","FoodCanFrankBeans","ItemHeatPack"],["ItemToolbox"]];
		cai_gear3					= [["ItemWaterbottle","ItemBloodbag"],["ItemCompass","ItemCrowbar"]];
		cai_gear4					= [["ItemBandage","ItemEpinephrine","ItemPainkiller"],["ItemGPS","ItemKeyKit"]];
		cai_gear_random				= [cai_gear0,cai_gear1,cai_gear2,cai_gear3,cai_gear4];	// Allows the possibility of random gear

		cai_wep_assault				= ["M16A4_ACG","Sa58V_RCO_EP1","SCAR_L_STD_Mk4CQT","M8_sharpshooter","M4A1_HWS_GL_camo","SCAR_L_STD_HOLO","M4A3_CCO_EP1","M4A3_CCO_EP1","M4A1_AIM_SD_camo","M16A4","m8_carbine","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1"];	// Assault
		cai_wep_machine				= ["RPK_74","MK_48_DZ","M249_EP1_DZ","Pecheneg_DZ","M240_DZ"];	// Light machine guns
		cai_wep_sniper				= ["M14_EP1","SCAR_H_LNG_Sniper_SD","M110_NVG_EP1","SVD_CAMO","VSS_Vintorez","DMR_DZ","M40A3"];	// Sniper rifles
		cai_wep_random				= [cai_wep_assault,cai_wep_assault,cai_wep_assault,cai_wep_sniper,cai_wep_machine];	// random weapon 60% chance assault rifle,20% light machine gun,20% sniper rifle
		cai_wep_launchers_AT		= ["M136","RPG18","JAVELIN"];
		cai_wep_launchers_AA		= ["Strela","Igla","STINGER"];
		
		cai_packs					= ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
		cai_hero_skin				= ["Priest_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","CIV_Contractor2_BAF","Taliban1","Taliban2","Taliban3","Taliban4","Taliban7","Taliban12","Villager1","Villager2","Villager3","Ins_Worker2","Worker1","Worker2","Worker3","Worker4","Profiteer1","Profiteer2","Profiteer3","Rocker1","Rocker2","Rocker3","Rocker4","SchoolTeacher","Assistant","Secretary1","Secretary2","Secretary3","Sportswoman1","Sportswoman2","Sportswoman3","Sportswoman4","Sportswoman5","ValentinaFit","ValentinaVictim","Madam1","Madam2","Madam3","Madam4","Madam5","FarmWife1","FarmWife2","FarmWife3","FarmWife4","FarmWife5","Damsel1","Damsel2","Damsel3","Damsel4","Damsel5","HouseWife1","HouseWife2","HouseWife3","HouseWife4","HouseWife5","Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","WorkWoman1","WorkWoman2","WorkWoman3","WorkWoman4","CIV_EuroWoman01_EP1","CIV_EuroWoman02_EP1","Haris_Press_EP1","Citizen2_EP1","Citizen3_EP1","Profiteer2_EP1","pook_Doc_Bell47"];
		cai_bandit_skin				= ["TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Woman01_EP1","TK_INS_Soldier_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_4_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AT_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_Sniper_EP1","TK_INS_Soldier_AR_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Warlord_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1"];
		cai_special_skin			= ["Functionary1_EP1_DZ"];
		cai_all_skin				= [cai_hero_skin,cai_bandit_skin,cai_special_skin];

		cai_add_skin				= false;			// adds unit skin to inventory on death
		
	/* END AI CONFIG */

	/* WAI MISSIONS CONFIG */
		cai_mission_system			= true;	// use built in mission system

		cai_mission_markers			= ["DZMSMajMarker","DZMSMinMarker","DZMSBMajMarker","DZMSBMinMarker"];
		cai_avoid_missions			= 1000;								// avoid spawning missions this close to other missions, these are defined in wai_mission_markers
		cai_avoid_traders			= 50;								// avoid spawning missions this close to traders
		cai_avoid_town				= 50;								// avoid spawning missions this close to towns, *** doesn't function with infiSTAR enabled ***
		cai_avoid_road				= 50;								// avoid spawning missions this close to roads
		cai_avoid_water				= 50;								// avoid spawning missions this close to water
		cai_avoid_slope				= 50;								// avoid spawning missions this close to slope
		cai_avoid_slopeGradient		= 15;								// avoid spawning missions in this gradient
		cai_avoid_plot				= 500;								// avoid spawning missions this close to plot poles

		
		cai_mission_timer			= [0,1];							// time between missions 5-15 minutes
		cai_mission_timeout			= [900,1800];						// time each missions takes to despawn if inactive 15-30 minutes
		cai_timeout_distance		= 150;								// if a player is this close to a mission then it won't time-out
		
		cai_clean_mission			= true;								// clean all mission buildings after a certain period
		cai_clean_mission_time		= 30;								// time after a mission is complete to clean mission buildings

		cai_mission_fuel			= [80,100];							// fuel inside mission spawned vehicles [min%,max%]
		cai_vehicle_damage			= [0,20];							// damages to spawn vehicles with [min%,max%]
		cai_keep_vehicles			= false;							// save vehicles to database and keep them after restart
		cai_linux_server			= false;							// false = Windows (HiveExt.dll)		true = Linux Server (writer.pl)		has no effect when "wai_keep_vehicles = false;"
		cai_lock_vehicles			= false;							// lock mission vehicles and add keys to random AI bodies (be careful with ai_clean_dead if this is true

		cai_crates_smoke			= false;							// pop smoke on crate when mission is finished during daytime
		cai_crates_flares			= false;							// pop flare on crate when mission is finished during nighttime
		
		cai_players_online			= 1; 								// number of players online before mission starts
		cai_server_fps				= 10; 								// missions only starts if server FPS is over wai_server_fps
		
		cai_kill_percent			= 50;								// percentage of AI players that must be killed at "crate" missions to be able to trigger completion

		cai_high_value				= false;								// enable the possibility of finding a high value item (defined below crate_items_high_value) inside a crate
		cai_high_value_chance		= 5;								// chance in percent you find above mentioned item

		cai_enable_minefield		= false;							// enable minefields to better defend missions
		cai_use_launchers			= false;							// add a rocket launcher to each spawned AI group
		cai_remove_launcher			= true;								// remove rocket launcher from AI on death

		// Missions
		cai_radio_announce			= true;								// Setting this to true will announce the missions to those that hold a radio only
		cai_hero_limit				= 1;								// define how many hero missions can run at once
		cai_bandit_limit			= 1;								// define how many bandit missions can run at once
		cai_special_limit			= 3;								// define how many special missions can run at once

		cai_hero_missions			= [ 								// ["mission filename",% chance of picking this mission],Make sure the chances add up to 100,or it will not be accurate percentages
										["hero_trader",100]
									];
		cai_bandit_missions			= [
										["bandit_trader",100]
									];
		cai_special_missions		= [
										["neutral_trader",100]
									];
	
		civ_crates_large			= ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
		civ_crates_medium			= ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
		civ_crates_small			= ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];

	/* END WAI MISSIONS CONFIG */

	/* STATIC MISSIONS CONFIG */

		civ_static_missions				= false;		// use static mission file
		civ_custom_per_world			= false;		// use a custom mission file per world

	/* END STATIC MISSIONS CONFIG */

	CAIconfigloaded = true;

};