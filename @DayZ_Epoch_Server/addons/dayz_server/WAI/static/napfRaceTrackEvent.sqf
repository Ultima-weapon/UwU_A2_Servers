/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	[
		[									// Position(s) (can be multiple)
			[14364,13154,0],
			[14340,12400,0],
			[14146,11547,0],
			[13371,10543,0],
			[13036,10208,0],
			[12137,9340,0],
			[11765,9117,0],
			[10889,8418,0],
			[10595,8140,0],
			[9597,8455,0],
			[9089,8652,0],
			[7846,9030,0],
			[7556,9394,0],
			[6438,9559,0],
			[6435,9637,0],
			[6417,11009,0],
			[6194,11473,0],
			[6174,12942,0],
			[6278,13516,0],
			[7290,14837,0],
			[7830,14972,0],
			[9339,15680,0],
			[9883,15566,0]
		],
		"MK19_TriPod_US_EP1",				// Classname of turret
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		10,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;

	diag_log "WAI: Race Track Event mission loaded";
};