_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 14400; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

_spawnPoints = [
		["Random",[[3794.76, 3458.42, 0],[5634.09, 2141.91, 0],[5381.54, 1563.68, 0],[6574.42, 2979.15, 0],[5197.61, 5569.64, 0],[5765,15, 6044.84, 0],[6200.25, 6493.49, 0],[4686.23, 6460.87, 0],[6207.1, 7756.95, 0],[3437.23, 8951.36, 0]],0,0,1],
		["Port Justice", [3794.76, 3458.42, 0],0,0],
		["Kassfort", [5634.09, 2141.91, 0],0,0],
		["Jayne", [5381.54, 1563.68, 0],0,0],
		["Dogtown", [6574.42, 2979.15, 0],0,0],
		["Eslie", [5197.61, 5569.64, 0],0,0],
		["Whisperton", [5765.15, 6044.84, 0],0,0],
		["Madica", [6200.25, 6493.49, 0],0,0],
		["Old Prison", [4686.23, 6460.87, 0],0,0],
		["Rockley", [6207.1, 7756.95, 0],0,0],
		["Linfort", [3437.23, 8951.36, 0],0,0]
		];