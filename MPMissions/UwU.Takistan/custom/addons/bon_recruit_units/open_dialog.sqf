//recruit menu by HALV

recruit_spawn_menu =
[
["",true],
["Recruit menu:", [-1], "", -5, [["expression", ""]], "1", "0"],
["Recruit Bodygaurd - 5,000 Coins", 				[2], "", -5, [["expression", "['Soldier_Bodyguard_AA12_PMC_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Rebel Gunner - 10,000 Coins", 			[3], "", -5, [["expression", "['FR_Rodriguez_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Rebel (Jungle Camo) - 15,000 Coins", 		[4], "", -5, [["expression", "['FR_OHara_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Marksman - 15,000 Coins", 				[5], "", -5, [["expression", "['Soldier_Sniper_PMC_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Mercenary - 20,000 Coins", 				[6], "", -5, [["expression", "['Camo1_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Soldier (Urban Camo) 25,000 Coins", 		[7], "", -5, [["expression", "['Graves_Light_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Soldier - 25,000 Coins", 					[8], "", -5, [["expression", "['Soldier1_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Officer - 50,000 Coins", 					[9], "", -5, [["expression", "['Rocket_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Sniper (Forest Gillie) - 75,000 Coins", 	[10], "", -5, [["expression", "['Sniper1_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Sniper (Desert Gillie) - 75,000 Coins", 	[11], "", -5, [["expression", "['CZ_Soldier_Sniper_EP1_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["Recruit Special Forces - 75,000 Coins", 			[12], "", -5, [["expression", "['CZ_Special_Forces_GL_DES_EP1_DZ'] execVM (BON_RECRUIT_PATH + 'recruit_new.sqf');"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
 
showCommandingMenu '#USER:recruit_spawn_menu';