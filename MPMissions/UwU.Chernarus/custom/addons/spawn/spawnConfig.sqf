_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 14400; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = [
		["Kamenka", [1867.8379, 2290.2583, 0],0,0],
		["Komarovo", [3633.8445, 2392.9741, 0],0,0],
		["Balota", [4482.1094, 2424.5408, 0],0,0],
		["Balota Airstrip", [4787.6616, 2551.0151, 0],0,0],
		["Cherno 1", [6560.6025, 2419.9658, 0],0,0],
		["Cherno 2", [6504.7559, 2773.7056, 0],0,0],
		["Cherno 4", [6674.2568, 2583.6072, 0],0,0],
		["Cherno 3", [6975.0464, 2645.3413, 0],0,0],
		["Elektro 1", [10168.299, 1954.9338, 0],0,0],
		["Elektro 3", [10454.194, 2245.2053, 0],0,0],
		["Elektro 2", [10469.834, 2467.689, 0],0,0],
		["Skalisty", [13657.813, 2925.7288, 0],0,0],
		["Kamyshovo", [12067.335, 3621.5562, 0],0,0],
		["Tulga", [12866.335, 4463.1636, 0],0,0],
		["Rog", [11254.334, 4278.8921, 0],0,0],
		["Pusta", [9162.2178, 3838.3701, 0],0,0],
		["Three Valleys", [13256.896, 5440.0186, 0],0,0],
		["Solnichniy", [13334.822, 6261.1094, 0],0,0],
		["Solnichniy Factory", [13090.676, 7070.6646, 0],0,0],
		["Nizhnoye", [12889.117, 8149.4814, 0],0,0],
		["Orlovets", [12163.348, 7298.52, 0],0,0],
		["Berezino 1", [12031.008, 9118.2402, 0],0,0],
		["Berezino 4", [12249.986, 9588.9346, 0],0,0],
		["Berezino 2", [12734.031, 9623.2559, 0],0,0],
		["Berezino 3", [12870.814, 10054.313, 0],0,0],
		["Khelm", [12313.479, 10851.807, 0],0,0],
		["Olsha", [13367.774, 12848.616, 0],0,0],
		["NEAF", [12076.522, 12637.961, 0],0,0],
		["Krasnostav", [11128.36, 12342.763, 0],0,0],
		["Gvozdno", [8717.3887, 11794.308, 0],0,0],
		["Pavlovo", [1700.5154, 3838.8384, 0],0,0],
		["Bor", [3338.4927, 3923.6582, 0],0,0],
		["Msta", [11345.774, 5475.9185, 0],0,0],
		["Staroye", [10126.361, 5483.3281, 0],0,0],
		["Dolina", [11281.19, 6607.8843, 0],0,0],
		["Orlovets Factory", [11457.82, 7483.894, 0],0,0],
		["DubrovkaNW", [10007.422, 10392.041, 0],0,0],
		["Dubrovka", [10467.023, 9791.6279, 0],0,0],
		["Polana", [10713.679, 8045.3086, 0],0,0],
		["Mogilevka", [7599.5488, 5169.6831, 0],0,0],
		["Nadezhdino", [5850.4556, 4746.9932, 0],0,0],
		["Zub", [6548.4966, 5590.0073, 0],0,0],
		["Kozlovka", [4432.9712, 4648.2036, 0],0,0],
		["Drozhino", [3415.1025, 4941.2129, 0],0,0],
		["Zelenogorsk", [2743.4209, 5304.1323, 0],0,0],
		["Green Mountain", [3720.9399, 6005.7715, 0],0,0],
		["Shakhovka", [9659.7217, 6564.8687, 0],0,0],
		["Guglovo", [8462.3857, 6697.4175, 0],0,0],
		["Vyshnoye", [6538.7881, 6129.7109, 0],0,0],
		["Pulkovo", [4943.1729, 5617.7466, 0],0,0],
		["Sosnovka", [2530.4241, 6358.1699, 0],0,0],
		["Myshkino", [1994.825, 7389.6553, 0],0,0],
		["Pustoshka", [3057.0288, 7854.3584, 0],0,0],
		["Vybor", [3860.8384, 8891.998, 0],0,0],
		["Pogorevka", [4523.5366, 6417.9312, 0],0,0],
		["Rogovo", [4743.606, 6770.0415, 0],0,0],
		["Gorka", [9615.8896, 8845.5264, 0],0,0],
		["Novy Sobor", [7039.3799, 7689.1279, 0],0,0],
		["Stary Sobor", [6158.9712, 7749.9517, 0],0,0],
		["Kabanino", [5380.0811, 8599.0205, 0],0,0],
		["Lopatino", [2769.7209, 9947.7793, 0],0,0],
		["Devils Castle", [6894.8286, 11444.771, 0],0,0],
		["Grishino", [6018.1162, 10304.021, 0],0,0],
		["NWAF 2", [4762.6807, 10202.887, 0],0,0],
		["NWAF 4", [5227.6763, 9775.2021, 0],0,0],
		["NWAF 3", [4630.3066, 9666.2881, 0],0,0],
		["NWAF 6", [4087.0801, 10787.999, 0],0,0],
		["NWAF 5", [4616.1626, 10697.177, 0],0,0],
		["NWAF 1", [4670.3218, 10454.917, 0],0,0],
		["NWAF 7", [4216.0415, 10355.757, 0],0,0]
		];