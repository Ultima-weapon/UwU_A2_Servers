/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {
	[
		[									// Position(s) (can be multiple)
			[13386, 6685, 0],
			[13461, 6417, 0],
			[13431, 6031, 0],
			[13384, 5432, 0],
			[13501, 4737, 0],
			[13371, 4147, 0],
			[12807, 3684, 0],
			[12057, 3489, 0],
			[11211, 3233, 0],
			[10892, 2777, 0],
			[10583, 2393, 0],
			[10385, 2215, 0],
			[9818, 2029, 0],
			[9179, 2063, 0],
			[8701, 2428, 0],
			[8283, 3051, 0],
			[7799, 3179, 0],
			[7055, 3215, 0],
			[6507, 2806, 0],
			[6127, 2258, 0],
			[5533, 2073, 0],
			[5106, 2131, 0],
			[4503, 2452, 0],
			[3930, 2620, 0],
			[3249, 2203, 0],
			[2540, 2034, 0],
			[1914, 2245, 0],
			[1125, 2377, 0],
			[635, 1798, 0]
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