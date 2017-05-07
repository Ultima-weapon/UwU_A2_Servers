_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 14400; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = [
		["Random",[[8876.1641, 16260.472, 0],[7587.0171, 14221.998, 0],[5789.9204, 15317.989, 0],[5984.3174, 13589.515, 0],[3936.8379, 14387.571, 0],[4691.8608, 12267.877, 0],[6291.979, 12740.054, 0],[5794.8022, 11695.465, 0],[6253.1118, 10445.891, 0],[6489.9155, 9683.1045, 0],[7808.2021, 9318.6074, 0],[9832.37,9853.36, 0],[8444.5938, 17123.244, 0],[10049.203, 16467.189, 0],[10686.2,15883.3, 0],[10575.794, 14068.857, 0],[12085.853, 15345.522, 0],[5051.2803, 11196.765, 0],[14726.621, 14107.868, 0],[15495.981, 13431.276, 0],[14245.889, 12714.578, 0],[12913.013, 11756.14, 0],[16410.053, 15302.249, 0],[12791.802, 9626.2422, 0],[14931.782, 10882.149, 0],[7383.05,6598.69, 0],[18306.078, 17137.08, 0],[5990.39,8893.48, 0],[9048.1934, 5428.6768, 0],[3603.1506, 9727.3291, 0],[2180.1565, 7626.7544, 0],[3654.7224, 7928.7563, 0],[2072.7058, 9780.8652, 0],[2411.7112, 11241.985, 0],[2877.75,6243.71, 0],[13515.016, 5313.1172, 0],[18249.895, 2206.3149, 0],[17203.361, 3525.9858, 0],[14448.045, 2914.2048, 0],[2557.7725, 7784.0161, 0],[2560.0894, 8248.7227, 0],[3200.5864, 7428.8589, 0],[6349.5601, 9400.2988, 0],[6850.7959, 9643.5898, 0],[6334.1348, 10818.069, 0],[16431.096, 18415.654, 0],[17051.783, 18746.586, 0],[7410.8555, 14823.762, 0],[9191.4619, 17585.988, 0],[10656.134, 17037.621, 0],[8659.707, 15989.149, 0],[8930.8291, 15925.417, 0],[9149.332, 15644.616, 0],[14259.116, 14121.588, 0],[14481.524, 13712.073, 0],[14352.377, 16932.207, 0],[14993.102, 16172.912, 0],[5193.6675, 4471.2915, 0],[4783.3022, 4828.5498, 0],[9990.627, 7592.1777, 0],[10057.302, 18093.361, 0],[18076.391, 2579.5398, 0],[16577.482, 18223.15, 0]],0,0,1],
		["Lenzburg", [8876.1641, 16260.472, 0],0,0],
		["Trueb", [7587.0171, 14221.998, 0],0,0],
		["Seltisberg", [5789.9204, 15317.989, 0],0,0],
		["Neue Welt", [5984.3174, 13589.515, 0],0,0],
		["Bubendorf", [3936.8379, 14387.571, 0],0,0],
		["Huttwil", [4691.8608, 12267.877, 0],0,0],
		["Ruchfeld", [6291.979, 12740.054, 0],0,0],
		["Oberdorf", [5794.8022, 11695.465, 0],0,0],
		["Muttenz", [6253.1118, 10445.891, 0],0,0],
		["Muenchenstein", [6489.9155, 9683.1045, 0],0,0],
		["Chatzbach", [7808.2021, 9318.6074, 0],0,0],
		["Bruderholz", [9832.37,9853.36, 0],0,0],
		["Freidorf", [8444.5938, 17123.244, 0],0,0],
		["Olten", [10049.203, 16467.189, 0],0,0],
		["Ruemlingen", [10686.2,15883.3, 0],0,0],
		["Hirsegg", [10575.794, 14068.857, 0],0,0],
		["Lausen", [12085.853, 15345.522, 0],0,0],
		["Unterdorf", [5051.2803, 11196.765, 0],0,0],
		["Luzern", [14726.621, 14107.868, 0],0,0],
		["Emmen", [15495.981, 13431.276, 0],0,0],
		["Wolhusen", [14245.889, 12714.578, 0],0,0],
		["Romoos", [12913.013, 11756.14, 0],0,0],
		["Meggen", [16410.053, 15302.249, 0],0,0],
		["Liestal", [12791.802, 9626.2422, 0],0,0],
		["Sachseln", [14931.782, 10882.149, 0],0,0],
		["Eggwil", [7383.05,6598.69, 0],0,0],
		["Pfeffikon", [18306.078, 17137.08, 0],0,0],
		["Signau", [5990.39,8893.48, 0],0,0],
		["Schangen", [9048.1934, 5428.6768, 0],0,0],
		["Hasle", [3603.1506, 9727.3291, 0],0,0],
		["Worb", [2180.1565, 7626.7544, 0],0,0],
		["Munsingen", [3654.7224, 7928.7563, 0],0,0],
		["Ittingen", [2072.7058, 9780.8652, 0],0,0],
		["Hindelbank", [2411.7112, 11241.985, 0],0,0],
		["Homburg", [2877.75,6243.71, 0],0,0],
		["Sorenberg", [13515.016, 5313.1172, 0],0,0],
		["South Airstrip", [18249.895, 2206.3149, 0],0,0],
		["Froburg", [17203.361, 3525.9858, 0],0,0],
		["Brienz", [14448.045, 2914.2048, 0],0,0],
		["Eastern Worb", [2557.7725, 7784.0161, 0],0,0],
		["Northern Worb", [2560.0894, 8248.7227, 0],0,0],
		["Worb Industrial Sector", [3200.5864, 7428.8589, 0],0,0],
		["Southern Muenchenstein", [6349.5601, 9400.2988, 0],0,0],
		["Eastern Muenchenstein", [6850.7959, 9643.5898, 0],0,0],
		["Northen Muttenz", [6334.1348, 10818.069, 0],0,0],
		["Suhrenfeld Military Sector", [16431.096, 18415.654, 0],0,0],
		["Suhrenfeld Barracks Sector", [17051.783, 18746.586, 0],0,0],
		["Northern Trueb", [7410.8555, 14823.762, 0],0,0],
		["Harbour", [9191.4619, 17585.988, 0],0,0],
		["Magden", [10656.134, 17037.621, 0],0,0],
		["Western Lenzburg", [8659.707, 15989.149, 0],0,0],
		["Eastern Lenzburg", [8930.8291, 15925.417, 0],0,0],
		["Lenzburg Industrial Sector", [9149.332, 15644.616, 0],0,0],
		["Western Luzern", [14259.116, 14121.588, 0],0,0],
		["Southern Luzern", [14481.524, 13712.073, 0],0,0],
		["Airport", [14352.377, 16932.207, 0],0,0],
		["Eastern Airport", [14993.102, 16172.912, 0],0,0],
		["Airbase", [5193.6675, 4471.2915, 0],0,0],
		["Airbase Hangars Sector", [4783.3022, 4828.5498, 0],0,0],
		["Milan Military Sector", [9990.627, 7592.1777, 0],0,0],
		["Nordstern", [10057.302, 18093.361, 0],0,0],
		["South Airbase Barracks", [18076.391, 2579.5398, 0],0,0],
		["Suhrenfeld Hotels Sector", [16577.482, 18223.15, 0],0,0]
		];