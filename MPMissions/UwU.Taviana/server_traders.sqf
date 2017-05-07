/*

	CUSTOM TRADERS FOR TAVIANA EPOCH
	(Credits: DayZ Epoch Devs for their original traders.)
	AUTHOR: AVendettaForYou
	Date: 12/11/2013

*/
serverTraders = [
"GUE_Worker2",
"Soldier_Sniper_KSVK_PMC",
"Soldier_GL_PMC",
"GUE_Soldier_Pilot",
"GUE_Woodlander3",
"Worker4",
"Reynolds_PMC",
"Soldier_Sniper_PMC",
"GUE_Soldier_3",
"RU_Doctor",
"Doctor",
"UN_CDF_Soldier_Pilot_EP1",
"RU_Worker4",
"RU_Woodlander4",
"Citizen3",
"RU_Damsel5",
"Dr_Hladik_EP1",
"GUE_Commander",
"GUE_Soldier_CO",
"Profiteer2_EP1",
"RU_Farmwife5",
"GUE_Woodlander1",
"RU_Worker1",
"GUE_Soldier_2"];
/*---------------------------------------------------------------------------
			HERO VENDORS
---------------------------------------------------------------------------*/
//COMBINATION VENDOR
menu_Soldier_Sniper_PMC = [
	[["Ammunition",7091],["Clothes",7090],["Weapons",7086],["Air - Pook Copters",11000],["Air - Gyro Copters",11001],["Air - Praga Copters",11002],["Air - Unarmed Helis",11003],["Air - Armed Helis",11004],["Air - Unarmed Planes",11005],["Air - Armed Planes",11006],["Air - Jets",11007],["Ground - Bikes",11008],["Ground - Motos",11009],["Ground - ATVs",11010],["Ground - Tractors",11011],["Ground - Cars",11012],["Ground - Vans",11013],["Ground - SUVs",11014],["Ground - Unarmed Jeeps",11015],["Ground - Armed Jeeps",11016],["Ground - Unarmed Trucks",11017],["Ground - Armed Trucks",11018],["Ground - Buses",11019],["Ground - Unarmed Cargo",11020],["Ground - Armed Cargo",11021],["Ground - Reammo",11022],["Ground - Repair",11023],["Ground - Refuel",11024],["Ground - Armed Transport",11025],["Ground - Medevacs",11026],["Ground - Tanks",11027],["Ground - Unclassified",11028],["Ground - Static",11029],["Water - Boats",11030],["Money",7000]],
	[],
	"hero"
];
//SUPPLIES
menu_GUE_Woodlander3 = [
	[["Building Supplies",7076],["Toolbelt Items",7023],["Vehicle Parts",7027],["Money",7000]],
	[],
	"hero"
];
//MEDICAL
menu_RU_Doctor = [
	[["Chem-lites/Flares",7073],["Medical Supplies",7011],["Smoke Grenades",7018],["Money",7000]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"hero"
];
//FOOD & DRINK
menu_RU_Damsel5 = [
	[["Backpacks",7082],["Civ Male Clothing",7001],["Civ Female Clothing",7002],["Mercenary Clothing",7003],["Military Clothing",7098],["Cooked Meats",7004],["Drinks",7005],["Packaged Food",7013],["Money",7000]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"hero"
];
/*---------------------------------------------------------------------------
			BANDIT VENDORS
---------------------------------------------------------------------------*/
//COMBINATION VENDOR
menu_GUE_Woodlander1 = [
	[["Ammunition",7097],["Clothing",7096],["Weapons",7092],["Air - Pook Copters",11000],["Air - Gyro Copters",11001],["Air - Praga Copters",11002],["Air - Unarmed Helis",11003],["Air - Armed Helis",11004],["Air - Unarmed Planes",11005],["Air - Armed Planes",11006],["Air - Jets",11007],["Ground - Bikes",11008],["Ground - Motos",11009],["Ground - ATVs",11010],["Ground - Tractors",11011],["Ground - Cars",11012],["Ground - Vans",11013],["Ground - SUVs",11014],["Ground - Unarmed Jeeps",11015],["Ground - Armed Jeeps",11016],["Ground - Unarmed Trucks",11017],["Ground - Armed Trucks",11018],["Ground - Buses",11019],["Ground - Unarmed Cargo",11020],["Ground - Armed Cargo",11021],["Ground - Reammo",11022],["Ground - Repair",11023],["Ground - Refuel",11024],["Ground - Armed Transport",11025],["Ground - Medevacs",11026],["Ground - Tanks",11027],["Ground - Unclassified",11028],["Ground - Static",11029],["Water - Boats",11030],["Money",7000]],
	[],
	"hostile"
];
//SUPPLIES
menu_RU_Worker1 = [
	[["Building Supplies",7076],["Toolbelt Items",7023],["Vehicle Parts",7027],["Money",7000]],
	[],
	"hostile"
];
//MEDICAl
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",7073],["Medical Supplies",7011],["Smoke Grenades",7018],["Money",7000]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"hostile"
];
//FOOD & DRINK
menu_RU_Farmwife5 = [
	[["Backpacks",7082],["Civ Male Clothing",7001],["Civ Female Clothing",7002],["Mercenary Clothing",7003],["Military Clothing",7098],["Cooked Meats",7004],["Drinks",7005],["Packaged Food",7013],["Money",7000]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"hostile"
];
/*---------------------------------------------------------------------------
			NEUTRAL VENDORS
---------------------------------------------------------------------------*/
//MEDICAL
menu_Doctor = [
	[["Chem-lites/Flares",7073],["Medical Supplies",7011],["Smoke Grenades",7018],["Money",7000]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
//SUPPLIES
menu_RU_Worker4 = [
	[["Building Supplies",7076],["Toolbelt Items",7023],["Vehicle Parts",7027],["Money",7000]],
	[],
	"neutral"
];
//WEAPONS
menu_Soldier_Sniper_KSVK_PMC = [
	[["HK416 Assault Rifles",7063],["HK417 Assualt Rifles",7064],["Overwatch Sniper Rifles",7069],["ACR - IRN Sight",7031],["ACR - IRN/M320",7032],["ACR - IRN/SD",7033],["ACR - IRN/SD/M320",7034],["ACR - RCO Sight",7035],["ACR - RCO/M320",7036],["ACR - RCO/SD",7037],["ACR - RCO/SD/M320",7038],["ACR - CCO Sight",7039],["ACR - CCO/M320",7040],["ACR - CCO/SD",7041],["ACR - CCO/SD/M320",7042],["ACR - G55 Sight",7043],["ACR - G55/M320",7044],["ACR - G55/SD",7045],["ACR - G55/SD/M320",7046],["ACR - HAMR Sight",7047],["ACR - HAMR/M320",7048],["ACR - HAMR/SD",7049],["ACR - HAMR/GL/SD",7050],["ACR - HWS Sight",7051],["ACR - HWS/M320",7052],["ACR - HWS/SD",7053],["ACR - HWS/GL/SD",7054],["ACR - TWS Sight",7055],["ACR - TWS/M320",7056],["ACR - TWS/SD",7057],["ACR - TWS/GL/SD",7058],["Assault Rifle",7084],["Light Machine Gun",7009],["Pistols",7015],["Shotguns and Single-shot",7016],["Sniper Rifle",7019],["Submachine Guns",7022],["RH Weapons",7060],["RH MAS Assault Rifles",7065],["RH TAR Assault Rifles",7072],["RH Pistols",7067],["G3 Weapons",7061],["SCARs",7068],["Vil Weapons",7099],["Weapon Type 1",7084],["Weapon Type 2",7079],["Weapon Type 3",7009],["Weapon Type 4",7015],["Weapon Type 5",7016],["Weapon Type 6",7019],["Weapon Type 7",7022],["Weapon Type 8",7060],["Weapon Type 9",7061],["Weapon Type 10",7063],["Weapon Type 11",7064],["Weapon Type 12",7065],["Weapon Type 13",7067],["Weapon Type 14",7068],["Weapon Type 15",7069],["Weapon Type 16",7072],["Weapon Type 17",7099],["Weapon Type 18",7086],["Spec Weapon Type 1",7031],["Spec Weapon Type 2",7032],["Spec Weapon Type 3",7033],["Spec Weapon Type 4",7034],["Spec Weapon Type 5",7035],["Spec Weapon Type 6",7036],["Spec Weapon Type 7",7037],["Spec Weapon Type 8",7038],["Spec Weapon Type 9",7039],["Spec Weapon Type 10",7040],["Spec Weapon Type 11",7041],["Spec Weapon Type 12",7042],["Spec Weapon Type 13",7043],["Spec Weapon Type 14",7044],["Spec Weapon Type 15",7045],["Spec Weapon Type 16",7046],["Spec Weapon Type 17",7047],["Spec Weapon Type 18",7048],["Spec Weapon Type 19",7049],["Spec Weapon Type 20",7050],["Spec Weapon Type 21",7051],["Spec Weapon Type 22",7052],["Spec Weapon Type 23",7053],["Spec Weapon Type 24",7054],["Spec Weapon Type 25",7055],["Spec Weapon Type 26",7056],["Spec Weapon Type 27",7057],["Spec Weapon Type 28",7058],["Super Weapon Type 1",7301],["Money",7000]],
	[],
	"neutral"
];
//AMMUNITION
menu_Soldier_GL_PMC = [
	[["Overwatch Rifle Ammo",7062],["Overwatch Pistol Ammo",7066],["Assault Rifle Ammo",7083],["Light Machine Gun Ammo",7010],["Pistol Ammo",7014],["Shotguns and Single-shot Ammo",7017],["Sniper Rifle Ammo",7020],["Submachine Gun Ammo",7021],["Ammo Type 1",7083],["Ammo Type 2",7080],["Ammo Type 3",7010],["Ammo Type 4",7014],["Ammo Type 5",7017],["Ammo Type 6",7020],["Ammo Type 7",7021],["Ammo Type 8",7028],["Ammo Type 9",7062],["Ammo Type 10",7066],["Ammo Type 11",7091],["Super Ammo Type 1",7302],["Explosives Type 1",7006],["Money",7000]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_Citizen3 = [
	[["Backpacks",7082],["Civ Male Clothing",7001],["Civ Female Clothing",7002],["Mercenary Clothing",7003],["Military Clothing",7098],["Cooked Meats",7004],["Drinks",7005],["Packaged Food",7013],["Money",7000]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"neutral"
];

/*---------------------------------------------------------------------------
			NEUTRAL VEHICLE VENDORS
---------------------------------------------------------------------------*/
menu_GUE_Soldier_3 = [
	[["Ground - Bikes",11008],["Ground - Motos",11009],["Ground - ATVs",11010],["Ground - Tractors",11011],["Ground - Cars",11012],["Ground - Vans",11013],["Ground - SUVs",11014],["Ground - Unarmed Jeeps",11015],["Ground - Unarmed Trucks",11017],["Ground - Buses",11019],["Ground - Unarmed Cargo",11020],["Ground - Medevacs",11026],["Money",7000]],
	[],
	"neutral"
];
menu_RU_Woodlander4 = [
	[["Ground - Bikes",11008],["Ground - Motos",11009],["Ground - ATVs",11010],["Ground - Tractors",11011],["Ground - Cars",11012],["Ground - Vans",11013],["Ground - SUVs",11014],["Ground - Unarmed Jeeps",11015],["Ground - Unarmed Trucks",11017],["Ground - Buses",11019],["Ground - Unarmed Cargo",11020],["Ground - Medevacs",11026],["Money",7000]],
	[],
	"neutral"
];
menu_Worker4 = [
	[["Water - Boats",11030],["Money",7000]],
	[],
	"neutral"
];
menu_Profiteer2_EP1 = [
	[["Water - Boats",11030],["Money",7000]],
	[],
	"neutral"
];
menu_GUE_Soldier_Pilot = [
	[["Air - Pook Copters",11000],["Air - Gyro Copters",11001],["Air - Praga Copters",11002],["Air - Unarmed Helis",11003],["Air - Unarmed Planes",11005],["Money",7000]],
	[],
	"neutral"
];
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[["Air - Pook Copters",11000],["Air - Gyro Copters",11001],["Air - Praga Copters",11002],["Air - Unarmed Helis",11003],["Air - Unarmed Planes",11005],["Money",7000]],
	[],
	"neutral"
];
/*---------------------------------------------------------------------------
			FRIENDLY VENDORS
---------------------------------------------------------------------------*/
//WEAPONS
menu_GUE_Commander = [
	[["HK416 Assault Rifles",7063],["HK417 Assualt Rifles",7064],["Overwatch Sniper Rifles",7069],["ACR - IRN Sight",7031],["ACR - IRN/M320",7032],["ACR - IRN/SD",7033],["ACR - IRN/SD/M320",7034],["ACR - RCO Sight",7035],["ACR - RCO/M320",7036],["ACR - RCO/SD",7037],["ACR - RCO/SD/M320",7038],["ACR - CCO Sight",7039],["ACR - CCO/M320",7040],["ACR - CCO/SD",7041],["ACR - CCO/SD/M320",7042],["ACR - G55 Sight",7043],["ACR - G55/M320",7044],["ACR - G55/SD",7045],["ACR - G55/SD/M320",7046],["ACR - HAMR Sight",7047],["ACR - HAMR/M320",7048],["ACR - HAMR/SD",7049],["ACR - HAMR/GL/SD",7050],["ACR - HWS Sight",7051],["ACR - HWS/M320",7052],["ACR - HWS/SD",7053],["ACR - HWS/GL/SD",7054],["ACR - TWS Sight",7055],["ACR - TWS/M320",7056],["ACR - TWS/SD",7057],["ACR - TWS/GL/SD",7058],["Assault Rifle",7084],["Light Machine Gun",7009],["Pistols",7015],["Shotguns and Single-shot",7016],["Sniper Rifle",7019],["Submachine Guns",7022],["RH Weapons",7060],["RH MAS Assault Rifles",7065],["RH TAR Assault Rifles",7072],["RH Pistols",7067],["G3 Weapons",7061],["SCARs",7068],["Vil Weapons",7099],["Weapon Type 1",7084],["Weapon Type 2",7079],["Weapon Type 3",7009],["Weapon Type 4",7015],["Weapon Type 5",7016],["Weapon Type 6",7019],["Weapon Type 7",7022],["Weapon Type 8",7060],["Weapon Type 9",7061],["Weapon Type 10",7063],["Weapon Type 11",7064],["Weapon Type 12",7065],["Weapon Type 13",7067],["Weapon Type 14",7068],["Weapon Type 15",7069],["Weapon Type 16",7072],["Weapon Type 17",7099],["Weapon Type 18",7086],["Spec Weapon Type 1",7031],["Spec Weapon Type 2",7032],["Spec Weapon Type 3",7033],["Spec Weapon Type 4",7034],["Spec Weapon Type 5",7035],["Spec Weapon Type 6",7036],["Spec Weapon Type 7",7037],["Spec Weapon Type 8",7038],["Spec Weapon Type 9",7039],["Spec Weapon Type 10",7040],["Spec Weapon Type 11",7041],["Spec Weapon Type 12",7042],["Spec Weapon Type 13",7043],["Spec Weapon Type 14",7044],["Spec Weapon Type 15",7045],["Spec Weapon Type 16",7046],["Spec Weapon Type 17",7047],["Spec Weapon Type 18",7048],["Spec Weapon Type 19",7049],["Spec Weapon Type 20",7050],["Spec Weapon Type 21",7051],["Spec Weapon Type 22",7052],["Spec Weapon Type 23",7053],["Spec Weapon Type 24",7054],["Spec Weapon Type 25",7055],["Spec Weapon Type 26",7056],["Spec Weapon Type 27",7057],["Spec Weapon Type 28",7058],["Super Weapon Type 1",7301],["Money",7000]],
	[],
	"friendly"
];
//AMMUNITION
menu_GUE_Soldier_CO = [
	[["Overwatch Rifle Ammo",7062],["Overwatch Pistol Ammo",7066],["Assault Rifle Ammo",7083],["Light Machine Gun Ammo",7010],["Pistol Ammo",7014],["Shotguns and Single-shot Ammo",7017],["Sniper Rifle Ammo",7020],["Submachine Gun Ammo",7021],["Ammo Type 1",7083],["Ammo Type 2",7080],["Ammo Type 3",7010],["Ammo Type 4",7014],["Ammo Type 5",7017],["Ammo Type 6",7020],["Ammo Type 7",7021],["Ammo Type 8",7028],["Ammo Type 9",7062],["Ammo Type 10",7066],["Ammo Type 11",7091],["Super Ammo Type 1",7302],["Explosives Type 1",7006],["Money",7000]],
	[],
	"friendly"
];
//HELICOPTERS
menu_GUE_Worker2 = [
	[["Helicopter Armed",7089],["Money",7000]],
	[],
	"friendly"
];
/*---------------------------------------------------------------------------
			WHOLESALE VENDORS
---------------------------------------------------------------------------*/
//EAST BRIDGE
menu_GUE_Soldier_2 = [
	[["Bulk Ammo",7028],["Bulk Building Supplies",7029],["Building Supplies",7030],["Money",7000]],
	[],
	"neutral"
];
//WEST BRIDGE
menu_Reynolds_PMC = [
	[["Bulk Ammo",7028],["Bulk Building Supplies",7029],["Building Supplies",7030],["Money",7000]],
	[],
	"neutral"
];