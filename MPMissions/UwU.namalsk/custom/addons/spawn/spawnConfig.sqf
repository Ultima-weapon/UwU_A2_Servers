_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 14400; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = [
			["Seraja Army Base", [4157.5698, 6636.252, 0],0,0],
			["Southern Army Base", [3558.3298, 6664.4048, 0],0,0],
			["Norinsk", [3940.0078, 7536.5967, 0],0,0],
			["Object A2", [4976.6655, 6619.644, 0],0,0],
			["Brensk Railway Station", [4845.8853, 6201.1484, 0],0,0],
			["Western Army Checkpoint", [4081.9597, 9224.0859, 0],0,0],
			["Sebjan Warehouse", [4690.1934, 8916.7041, 0],0,0],
			["Sebjan Dam", [5781.0708, 9809.7734, 0],0,0],
			["Sebjan Chemical Factory", [6308.022, 9307.7139, 0],0,0],
			["Sebjan", [5807.0181, 8676.9521, 0],0,0],
			["Old Hospital", [7293.3511, 7967.5581, 0],0,0],
			["Tara Harbor", [7694.8877, 7602.1001, 0],0,0],
			["Old Sawmill", [7046.0806, 5808.7622, 0],0,0],
			["Nitija Army Base", [5986.1616, 6641.3848, 0],0,0],
			["Sebjan Mine", [4947.3247, 8158.6709, 0],0,0],
			["Jalovisko", [8199.6846, 10729.502, 0],0,0],
			["Northern Army Base", [4829.1992, 10839.983, 0],0,0],
			["Lubjansk", [4498.3965, 11127.151, 0],0,0],
			["Lubjansk South", [4407.7451, 10748.695, 0],0,0],
			["Vorkuta Central", [6784.3296, 11291.731, 0],0,0],
			["Nemsk Factory", [7668.0474, 8760.8672, 0],0,0],
			["Crashed C130", [3173.5461, 7504.5532, 0],0,0],
			["Vorkuta North", [6943.7725, 11424.083, 0],0,0],
			["Alakit", [5777.3901, 10784.223, 0],0,0],
			["Vorkuta South", [6719.9434, 11113.122, 0],0,0]
		];