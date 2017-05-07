/* 
	Modified by Ultima-weapon
	Ultima-Weapon's Universe [UwU]
	http://ultima-weapons-universe.enjin.com/ 
*/

if(isServer) then {

	private ["_complete","_crate","_mission","_static_gun","_crate_type","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	//Armed Land Vehicle
	_vehclass 		= armed_vehicle call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
	switch (toLower worldName) do {
		case "chernarus":{
			_pos_location = [
				["Kamenka", [1867.8379, 2290.2583, 0]],
				["Komarovo", [3633.8445, 2392.9741, 0]],
				["Balota", [4482.1094, 2424.5408, 0]],
				["Balota Airstrip", [4787.6616, 2551.0151, 0]],
				["Cherno 1", [6560.6025, 2419.9658, 0]],
				["Cherno 2", [6504.7559, 2773.7056, 0]],
				["Cherno 4", [6674.2568, 2583.6072, 0]],
				["Cherno 3", [6975.0464, 2645.3413, 0]],
				["Elektro 1", [10168.299, 1954.9338, 0]],
				["Elektro 3", [10454.194, 2245.2053, 0]],
				["Elektro 2", [10469.834, 2467.689, 0]],
				["Skalisty", [13657.813, 2925.7288, 0]],
				["Kamyshovo", [12067.335, 3621.5562, 0]],
				["Tulga", [12866.335, 4463.1636, 0]],
				["Rog", [11254.334, 4278.8921, 0]],
				["Pusta", [9162.2178, 3838.3701, 0]],
				["Three Valleys", [13256.896, 5440.0186, 0]],
				["Solnichniy", [13334.822, 6261.1094, 0]],
				["Solnichniy Factory", [13090.676, 7070.6646, 0]],
				["Nizhnoye", [12889.117, 8149.4814, 0]],
				["Orlovets", [12163.348, 7298.52, 0]],
				["Berezino 1", [12031.008, 9118.2402, 0]],
				["Berezino 4", [12249.986, 9588.9346, 0]],
				["Berezino 2", [12734.031, 9623.2559, 0]],
				["Berezino 3", [12870.814, 10054.313, 0]],
				["Khelm", [12313.479, 10851.807, 0]],
				["Olsha", [13367.774, 12848.616, 0]],
				["NEAF", [12076.522, 12637.961, 0]],
				["Krasnostav", [11128.36, 12342.763, 0]],
				["Gvozdno", [8717.3887, 11794.308, 0]],
				["Pavlovo", [1700.5154, 3838.8384, 0]],
				["Bor", [3338.4927, 3923.6582, 0]],
				["Msta", [11345.774, 5475.9185, 0]],
				["Staroye", [10126.361, 5483.3281, 0]],
				["Dolina", [11281.19, 6607.8843, 0]],
				["Orlovets Factory", [11457.82, 7483.894, 0]],
				["DubrovkaNW", [10007.422, 10392.041, 0]],
				["Dubrovka", [10467.023, 9791.6279, 0]],
				["Polana", [10713.679, 8045.3086, 0]],
				["Mogilevka", [7599.5488, 5169.6831, 0]],
				["Nadezhdino", [5850.4556, 4746.9932, 0]],
				["Zub", [6548.4966, 5590.0073, 0]],
				["Kozlovka", [4432.9712, 4648.2036, 0]],
				["Drozhino", [3415.1025, 4941.2129, 0]],
				["Zelenogorsk", [2743.4209, 5304.1323, 0]],
				["Green Mountain", [3720.9399, 6005.7715, 0]],
				["Shakhovka", [9659.7217, 6564.8687, 0]],
				["Guglovo", [8462.3857, 6697.4175, 0]],
				["Vyshnoye", [6538.7881, 6129.7109, 0]],
				["Pulkovo", [4943.1729, 5617.7466, 0]],
				["Sosnovka", [2530.4241, 6358.1699, 0]],
				["Myshkino", [1994.825, 7389.6553, 0]],
				["Pustoshka", [3057.0288, 7854.3584, 0]],
				["Vybor", [3860.8384, 8891.998, 0]],
				["Pogorevka", [4523.5366, 6417.9312, 0]],
				["Rogovo", [4743.606, 6770.0415, 0]],
				["Gorka", [9615.8896, 8845.5264, 0]],
				["Novy Sobor", [7039.3799, 7689.1279, 0]],
				["Stary Sobor", [6158.9712, 7749.9517, 0]],
				["Kabanino", [5380.0811, 8599.0205, 0]],
				["Lopatino", [2769.7209, 9947.7793, 0]],
				["Devils Castle", [6894.8286, 11444.771, 0]],
				["Grishino", [6018.1162, 10304.021, 0]],
				["NWAF 2", [4762.6807, 10202.887, 0]],
				["NWAF 4", [5227.6763, 9775.2021, 0]],
				["NWAF 3", [4630.3066, 9666.2881, 0]],
				["NWAF 6", [4087.0801, 10787.999, 0]],
				["NWAF 5", [4616.1626, 10697.177, 0]],
				["NWAF 1", [4670.3218, 10454.917, 0]],
				["NWAF 7", [4216.0415, 10355.757, 0]]
			];
		};
		case "napf":{
			_pos_location = [
				["Lenzburg", [8876.1641, 16260.472, 0]],
				["Trueb", [7587.0171, 14221.998, 0]],
				["Seltisberg", [5789.9204, 15317.989, 0]],
				["Neue Welt", [5984.3174, 13589.515, 0]],
				["Bubendorf", [3936.8379, 14387.571, 0]],
				["Huttwil", [4691.8608, 12267.877, 0]],
				["Ruchfeld", [6291.979, 12740.054, 0]],
				["Oberdorf", [5794.8022, 11695.465, 0]],
				["Muttenz", [6253.1118, 10445.891, 0]],
				["Muenchenstein", [6489.9155, 9683.1045, 0]],
				["Chatzbach", [7808.2021, 9318.6074, 0]],
				["Bruderholz", [9832.37,9853.36, 0]],
				["Freidorf", [8444.5938, 17123.244, 0]],
				["Olten", [10049.203, 16467.189, 0]],
				["Ruemlingen", [10686.2,15883.3, 0]],
				["Hirsegg", [10575.794, 14068.857, 0]],
				["Lausen", [12085.853, 15345.522, 0]],
				["Unterdorf", [5051.2803, 11196.765, 0]],
				["Luzern", [14726.621, 14107.868, 0]],
				["Emmen", [15495.981, 13431.276, 0]],
				["Wolhusen", [14245.889, 12714.578, 0]],
				["Romoos", [12913.013, 11756.14, 0]],
				["Meggen", [16410.053, 15302.249, 0]],
				["Liestal", [12791.802, 9626.2422, 0]],
				["Sachseln", [14931.782, 10882.149, 0]],
				["Eggwil", [7383.05,6598.69, 0]],
				["Pfeffikon", [18306.078, 17137.08, 0]],
				["Signau", [5990.39,8893.48, 0]],
				["Schangen", [9048.1934, 5428.6768, 0]],
				["Hasle", [3603.1506, 9727.3291, 0]],
				["Worb", [2180.1565, 7626.7544, 0]],
				["Munsingen", [3654.7224, 7928.7563, 0]],
				["Ittingen", [2072.7058, 9780.8652, 0]],
				["Hindelbank", [2411.7112, 11241.985, 0]],
				["Homburg", [2877.75,6243.71, 0]],
				["Sorenberg", [13515.016, 5313.1172, 0]],
				["South Airstrip", [18249.895, 2206.3149, 0]],
				["Froburg", [17203.361, 3525.9858, 0]],
				["Brienz", [14448.045, 2914.2048, 0]],
				["Eastern Worb", [2557.7725, 7784.0161, 0]],
				["Northern Worb", [2560.0894, 8248.7227, 0]],
				["Worb Industrial Sector", [3200.5864, 7428.8589, 0]],
				["Southern Muenchenstein", [6349.5601, 9400.2988, 0]],
				["Eastern Muenchenstein", [6850.7959, 9643.5898, 0]],
				["Northen Muttenz", [6334.1348, 10818.069, 0]],
				["Suhrenfeld Military Sector", [16431.096, 18415.654, 0]],
				["Suhrenfeld Barracks Sector", [17051.783, 18746.586, 0]],
				["Northern Trueb", [7410.8555, 14823.762, 0]],
				["Harbour", [9191.4619, 17585.988, 0]],
				["Magden", [10656.134, 17037.621, 0]],
				["Western Lenzburg", [8659.707, 15989.149, 0]],
				["Eastern Lenzburg", [8930.8291, 15925.417, 0]],
				["Lenzburg Industrial Sector", [9149.332, 15644.616, 0]],
				["Western Luzern", [14259.116, 14121.588, 0]],
				["Southern Luzern", [14481.524, 13712.073, 0]],
				["Airport", [14352.377, 16932.207, 0]],
				["Eastern Airport", [14993.102, 16172.912, 0]],
				["Airbase", [5193.6675, 4471.2915, 0]],
				["Airbase Hangars Sector", [4783.3022, 4828.5498, 0]],
				["Milan Military Sector", [9990.627, 7592.1777, 0]],
				["Nordstern", [10057.302, 18093.361, 0]],
				["South Airbase Barracks", [18076.391, 2579.5398, 0]],
				["Suhrenfeld Hotels Sector", [16577.482, 18223.15, 0]]
			];
		};
		case "lingor":{
			_pos_location = [
				["Medlina", [1698.2728, 608.19336, 0]],
				["Alma", [1203.9924, 592.44324, 0]],
				["Mercadio", [534.57129, 931.08551, 0]],
				["Drassen", [971.86395, 1766.6132, 0]],
				["Verto", [2104.4998, 1086.9586, 0]],
				["Rock Cafe", [2896.8037, 1324.5605, 0]],
				["Ralon", [3286.209, 1515.5829, 0]],
				["Calamar", [3828.3474, 1472.7954, 0]],
				["Sargento", [4297.3359, 1690.4199, 0]],
				["Melana Resort", [4705.125, 1870.5652, 0]],
				["Bilbado", [4060.7, 2345.0037, 0]],
				["Research Lab 102", [3421.1252, 3766.6194, 0]],
				["Motodrom Rapido", [1922.6033, 4517.4087, 0]],
				["Regina Tributa", [927.57318, 5021.5088, 0]],
				["Benio", [856.64136, 5598.0586, 0]],
				["Vidora", [2785.6826, 5370.9512, 0]],
				["Rosalia", [3405.3394, 5096.249, 0]],
				["Distrito Turistico", [4011.7578, 5033.6431, 0]],
				["Calapedro", [4791.3721, 5078.8423, 0]],
				["San Arulco", [4149.0122, 4544.4688, 0]],
				["Centro Esencia", [3711.9893, 4556.1895, 0]],
				["Morada", [3144.592, 4587.4668, 0]],
				["Faunaverde", [4723.3696, 3143.2578, 0]],
				["Montehofo", [3585.9399, 2795.4971, 0]],
				["Negrosa", [4913.4629, 2696.5176, 0]],
				["Lagosa", [5436.3374, 2104.5081, 0]],
				["Prospero", [5597.6309, 3267.8198, 0]],
				["Victorin", [6621.3857, 3326.3127, 0]],
				["Marcella", [6811.1563, 2144.3533, 0]],
				["El Villon", [7500.8418, 1913.8586, 0]],
				["Monga-Tamba-Pachi", [7671.9023, 2902.4526, 0]],
				["Palida", [8318.8057, 2860.9172, 0]],
				["Building", [6069.5698, 1760.6586, 0]],
				["Corazon", [5827.6191, 4638.3301, 0]],
				["Manteria", [6808.8735, 4703.7256, 0]],
				["Sanvigado", [6589.0029, 4349.2559, 0]],
				["Cafe Prada South", [7016.9897, 5735.5288, 0]],
				["Tres Palmas Inn", [6418.1719, 5793.4741, 0]],
				["Maruko", [6587.939, 6538.291, 0]],
				["Airport Terminal (West)", [6099.6914, 6766.8203, 0]],
				["Conoteta", [8637.2393, 7845.1719, 0]],
				["Cemarin", [8372.5771, 8785.4121, 0]],
				["San Isabel", [5118.2563, 6945.5122, 0]],
				["Research Lab 101", [4364.9629, 6769.4038, 0]],
				["Aculto-Garibosa", [3687.0007, 6459.0557, 0]],
				["Gayucca", [3923.0681, 5904.8486, 0]],
				["Tucos", [4467.5986, 5669.1431, 0]],
				["Barracks", [5187.9038, 5476.7856, 0]],
				["Checkpoint Oeste", [5398.9761, 5077.6099, 0]],
				["Calixo", [3275.8403, 6209.2446, 0]],
				["FOB Eddie", [3045.7483, 6477.4067, 0]],
				["FOB Eddie 2", [2758.9204, 6864.7163, 0]],
				["Prison", [3091.5913, 8037.5361, 0]],
				["Pintosa", [1364.8784, 1412.1613, 0]],
				["Villa Oscura", [648.92084, 4687.8394, 0]],
				["Fernando", [3081.7029, 5971.0171, 0]],
				["Presidente Palace", [6869.2939, 6409.1436, 0]],
				["Zuela", [528.13885, 1397.0074, 0]],
				["Zona Residencial", [4418.1411, 4931.6899, 0]],
				["Cafe Prada", [6819.8062, 6067.6177, 0]],
				["Airport Terminal (East)", [6560.959, 6837.7388, 0]],
				["Tucos (North)", [4455.2627, 6040.2598, 0]],
				["Gatoro", [4027.7668, 9277.6094, 0]],
				["Medicolin", [3247.5833, 9433.7051, 0]],
				["Zanjeer", [1286.6865, 7435.5381, 0]],
				["Arapesca", [913.44141, 8188.9297, 0]],
				["Fantasmo", [9286.9316, 4032.8284, 0]],
				["Bantanam North", [9243.4004, 5055.9131, 0]],
				["North Military Base 1", [1935.9822, 8777.6797, 0]],
				["North Military Base 2", [2522.0386, 9178.0166, 0]],
				["North Military Base 3", [832.84277, 7705.6685, 0]]
			];
		};
		case "sauerland":{
			_pos_location = [
				["Wenden Airfield", [15269.454, 18561.916, 0]],
				["Old Airfield", [17025.402, 2002.5928, 0]],
				["Fernsehturm", [11088.31, 4002.9553, 0]],
				["Heidermuehle", [18236.965, 4600.7134, 0]],
				["Arnsberg", [1548.4891, 24001.635, 0]],
				["Suederbarup", [13100.252, 810.17828, 0]],
				["Klein Sodenau", [369.17911, 25038.863, 0]],
				["Reine", [23841.941, 6976.6738, 0]],
				["Heggen", [18941.576, 14371.465, 0]],
				["Berghausen", [21180.15, 12630.672, 0]],
				["Moosbach", [23220.2,12550, 0]],
				["Garbow", [6064.2339, 16748.203, 0]],
				["Ihrhofen", [9590.2,18883, 0]],
				["Ihren", [11751.979, 17175.313, 0]],
				["Berghoven", [18451.602, 22197.6, 0]],
				["Grossenfelde", [16782.324, 22384.234, 0]],
				["Oberdorf", [12235.536, 5905.9258, 0]],
				["Oeventrop", [8185.9746, 22308.031, 0]],
				["Schmallenberg", [8918.7881, 13666.422, 0]],
				["Schueren", [10962.186, 13369.05, 0]],
				["Hoeinghausen", [21829.002, 9406.9531, 0]],
				["Fahrenbrecht", [3394.824, 1908.1086, 0]],
				["Meschede", [16756.123, 17354.289, 0]],
				["Uhlenbusch", [3782.2,13394, 0]],
				["Niederbergbach", [21644.25, 17371.664, 0]],
				["Rhaude", [3741.5422, 5427.0972, 0]],
				["Osterholz", [2932.7324, 8094.626, 0]],
				["Remblinghausen", [19243.2,10908, 0]],
				["Buersfeld", [16524.2,8784, 0]],
				["Seedorf", [16629.861, 15752.437, 0]],
				["Niedersalvey", [6270.5967, 6061.1021, 0]],
				["Old Airfield 2", [16973.58, 1840.6829, 0]],
				["Old Airfield Town", [17091.068, 1310.3103, 0]],
				["Old Airfield Village", [16375.906, 1302.205, 0]],
				["Fahrenbrecht 2", [3137.7576, 1573.5107, 0]],
				["Fahrenbrecht 3", [3058.6182, 1105.7908, 0]],
				["Fahrenbrecht 4", [2872.8777, 781.78711, 0]],
				["Fahrenbrecht 5", [3283.3281, 883.0658, 0]],
				["Fahrenbrecht 6", [3030.2761, 3742.9856, 0]],
				["Niedersalvey 2", [5835.1636, 5876.0605, 0]],
				["Uhlenbusch 2", [3609.031, 13833.808, 0]],
				["Uhlenbusch 3", [4023.7253, 13675.433, 0]],
				["West Military Base", [1105.3364, 15183.339, 0]],
				["Arnsberg 2", [1400.8392, 23630.836, 0]],
				["Nordern 1", [1362.3033, 23290.398, 0]],
				["Nordern Barracks", [1488.2198, 22436.875, 0]],
				["Nordern 2", [1486.3866, 23007.014, 0]],
				["River Railway", [2938.9727, 23343.287, 0]],
				["North Military Base", [3612.8738, 24988.32, 0]],
				["Town With Church", [12151.469, 15260.933, 0]],
				["Wenden Barracks", [15102.944, 18589.408, 0]],
				["Meschede 1", [15226.739, 18132.395, 0]],
				["Meschede 2", [15621.885, 18026.115, 0]],
				["Meschede 3", [15955.719, 17817.848, 0]],
				["Meschede 4", [16279.222, 18043.605, 0]],
				["Meschede 5", [16721.852, 18025.49, 0]],
				["Meschede 6", [17362.547, 18218.281, 0]],
				["Meschede 7", [17752.25, 18212.738, 0]],
				["Meschede 8", [17995.221, 17931.566, 0]],
				["Meschede 9", [17464.176, 17155.836, 0]],
				["Meschede 10", [17164.379, 17567.193, 0]],
				["Meschede 11", [17803.031, 16775.938, 0]],
				["Meschede 12", [18163.98, 16745.107, 0]],
				["Meschede 13", [17885.594, 16152.522, 0]],
				["North Military Base 2", [19880.184, 25226.951, 0]],
				["Reine 2", [23523.695, 7248.5322, 0]],
				["SE Military Base", [23956.162, 3173.1858, 0]],
				["Strelingen", [3359.6086, 19225.355, 0]],
				["Garbow Military Base", [7073.9038, 17244.992, 0]],
				["Garbow Industrial", [6519.2881, 16911.307, 0]]
			];
		};
		case "tavi":{
			_pos_location = [
				["Blato", [11766.242, 783.62885, 0]],
				["Seven", [10987.998, 769.48853, 0]],
				["Marina", [10031.798, 1386.2731, 0]],
				["Topolka", [8916.6074, 2310.0403, 0]],
				["Branibor", [7677.5615, 4578.5151, 0]],
				["Branibor 2", [7929.0435, 4297.4546, 0]],
				["Branibor 3", [7421.5361, 4292.8755, 0]],
				["Branibor 4", [7666.1294, 3984.3154, 0]],
				["Bashka Luka Military Base", [9339.6211, 5262.5767, 0]],
				["Kryvoe", [9082.3438, 5408.0596, 0]],
				["Krasnoz 1", [9362.6025, 7889.311, 0]],
				["Krasnoz 2", [9015.4082, 8153.9185, 0]],
				["Krasnoz Airport", [7534.6147, 7974.6338, 0]],
				["Krasnoz Military Base", [7777.1079, 9102.8564, 0]],
				["Vedich", [6692.4927, 9846.4492, 0]],
				["Chernovar", [5823.189, 9829.9883, 0]],
				["Bilgrad", [5524.2417, 8855.0576, 0]],
				["Bilgrad 2", [5331.8662, 8612.4229, 0]],
				["Shtangrad", [3351.1626, 7519.98, 0]],
				["Shtangrad Military Base", [3620.0962, 7653.1587, 0]],
				["Mitrovice", [3883.342, 7268.2354, 0]],
				["Mitrovice 2", [3845.9675, 7028.6748, 0]],
				["Komarovo", [10611.676, 6542.5581, 0]],
				["Komarovo Military Base", [10439.436, 6744.6108, 0]],
				["Zhuta Military Base", [17182.637, 5623.7471, 0]],
				["Stare Pole Military Base", [16777.328, 6288.9771, 0]],
				["Swamp Military Base", [16276.947, 10036.184, 0]],
				["Dubovo Airport", [16675.242, 10540.636, 0]],
				["Dubovo Airport 2", [16454.418, 11563.869, 0]],
				["Dubovo", [16209.043, 11587.123, 0]],
				["StariSad", [17580.254, 6303.3359, 0]],
				["Byelov", [17298.441, 7485.8291, 0]],
				["Kopech", [16515.439, 8274.0859, 0]],
				["Boye", [15187.44, 7867.7446, 0]],
				["Postoyna", [15549.432, 8506.21, 0]],
				["Molotovsk", [16897.236, 12676.642, 0]],
				["Martin", [16191.419, 13642.562, 0]],
				["Mill Military Base", [16436.6, 14266.563, 0]],
				["Gorka", [15136.348, 14889.47, 0]],
				["Sevastopol Military Base", [15082.46, 15898.194, 0]],
				["Sevastopol", [15473.854, 16372.353, 0]],
				["Sevastopol 2", [15402.354, 16141.029, 0]],
				["Dalnogorsk", [15035.327, 18216.568, 0]],
				["Dalnogorsk Military Base", [14636.279, 18555.789, 0]],
				["Ekaterinburg", [10900.545, 18839.094, 0]],
				["Ekaterinburg 2", [11073.892, 18622.762, 0]],
				["Yaroslav", [10193.348, 19048.738, 0]],
				["Yaroslav Military Base", [9985.3721, 18905.855, 0]],
				["Jaroslavski Airport", [10225.507, 18611.068, 0]],
				["Lyubol", [10435.554, 16920.193, 0]],
				["Etanovsk", [12639.455, 11777.848, 0]],
				["Etanovsk 2", [12661.685, 12136.558, 0]],
				["Vishkov", [11258.344, 15792.933, 0]],
				["Stari Grad", [11242.693, 15382.672, 0]],
				["Dubravka", [11831.151, 15687.939, 0]],
				["Lyepestok", [11595.344, 15394.919, 0]],
				["Zelenogorod", [12236.24, 15394.267, 0]],
				["Bori", [11644.896, 14948.265, 0]],
				["Nina", [12650.064, 15090.02, 0]],
				["Nina Military Base", [12439.564, 14960.65, 0]],
				["Kustik", [12973.656, 15015.534, 0]],
				["Chrveni Gradok", [12747.379, 14423.039, 0]],
				["Vinograd Factory", [13668.726, 13561.216, 0]],
				["Doriyanov", [12517.958, 13720.994, 0]],
				["Solibor", [14033.917, 12297.51, 0]],
				["Prilep", [14128.186, 12013.017, 0]],
				["Novi Bor", [14414.153, 11331.182, 0]],
				["Sabina Center", [14603.089, 10243.351, 0]],
				["Uyezd", [15246.176, 10062.691, 0]],
				["Podgorica", [14625.55, 9763.1006, 0]],
				["Sabina", [15077.591, 9616.7559, 0]],
				["Dyelnica", [15446.245, 9556.1709, 0]],
				["Slovany", [15258.28, 9234.3994, 0]],
				["Slovany 2", [15646.354, 9105.2607, 0]],
				["Dyelnica 2", [15731.443, 9479.9375, 0]],
				["Nekhay Military Special", [14849.834, 11913.729, 0]]
			];
		};
		case "takistan":{
			_pos_location = [
				["Landay", [1999.8049, 333.89359, 0]],
				["Ahmaday", [3599.5557, 1262.9868, 0]],
				["Chak Chak", [4440.0664, 667.60712, 0]],
				["Sakhe", [3752.6982, 4460.8936, 0]],
				["Sakhe 2", [3284.1165, 3675.4705, 0]],
				["Jilavur", [2565.6787, 5079.543, 0]],
				["Khushab", [1538.7018, 5681.293, 0]],
				["Shukurkalay", [1475.2213, 3576.6296, 0]],
				["Chaman", [548.4129, 2759.2986, 0]],
				["Chaman 2", [1009.7563, 3189.5881, 0]],
				["Mulladost", [2005.9639, 7654.5181, 0]],
				["Gospandi", [3662.0393, 8584.4795, 0]],
				["Lalezar", [4497.4453, 9376.4346, 0]],
				["Nagara", [3025.105, 9925.2148, 0]],
				["Nagara Oilfield East", [4191.394, 10836.333, 0]],
				["Shamali", [4165.9824, 11759.761, 0]],
				["Rasman Military 1", [5799.0752, 11206.194, 0]],
				["Rasman", [6288.9844, 11246.689, 0]],
				["Rasman Military 2", [6045.0684, 11653.766, 0]],
				["Safid Ab", [6842.2051, 12252.953, 0]],
				["Rasman South", [6037.6655, 10469.76, 0]],
				["Rasman Bastam", [5741.624, 9899.874, 0]],
				["Bastam North", [5602.1592, 9325.6768, 0]],
				["Bastam", [5640.9932, 8909.7793, 0]],
				["Bastam East", [6788.7056, 8918.7549, 0]],
				["Garmarud", [9167.0332, 6688.6724, 0]],
				["Garmsar", [10846.38, 6323.3657, 0]],
				["Garmsar Military", [10432.103, 6378.3984, 0]],
				["Hazar Bagh", [11830.018, 2589.0579, 0]],
				["Chardarakht East", [10974.319, 2452.8206, 0]],
				["Chardarakht West", [10201.649, 2379.0244, 0]],
				["Jaza East", [9237.1113, 1841.6443, 0]],
				["Jaza West", [8752.9492, 1864.3501, 0]],
				["Loy Manara", [8464.0469, 2413.1255, 0]],
				["Airfield", [8215.832, 2114.9724, 0]],
				["Airfield East", [7556.0806, 1802.1805, 0]],
				["Loy Manara Oilfield Town", [7095.9995, 1070.2653, 0]],
				["Sultansafe", [6506.8423, 2019.0903, 0]],
				["Huzrutimam", [6079.6367, 1155.9662, 0]],
				["Timurkalay", [8919.7119, 5345.1431, 0]],
				["Anar", [5964.4966, 5669.4463, 0]],
				["Anar East", [6816.8599, 6055.4316, 0]],
				["Feruz Abad", [5258.0444, 6120.1489, 0]],
				["Kakaru", [5325.3687, 4722.5317, 0]],
				["Nur", [1810.3278, 11795.336, 0]],
				["Zavarak", [9853.1455, 11435.367, 0]],
				["Zavarak 2", [10476.996, 11003.627, 0]],
				["Karachinar North", [12258.796, 11098.416, 0]],
				["Karachinar", [12312.442, 10419.859, 0]],
				["Ravanay", [11510.062, 8340.0977, 0]],
				["Airfield North Town", [8016.6895, 2954.416, 0]],
				["Imarat", [8283.3564, 7785.1221, 0]],
				["Rasman East", [7038.3872, 11500.55, 0]],
				["Gospandi 2", [3246.991, 8140.3496, 0]],
				["Daryache", [5105.1289, 5353.0151, 0]],
				["Falar", [5976.4209, 7275.0044, 0]],
				["Karachinar SW", [12202.271, 9978.0322, 0]],
				["Karachinar SE", [12538.564, 9980.1094, 0]]
			];
		};
	};
		
	_location 		= _pos_location call BIS_fnc_selectRandom;
	_position		= (_location select 1);

	[_mission,_position,"Medium",format["Patrol %1",_vehname],"MainBandit",false,false] call mission_init;
	
	diag_log format["WAI: [Mission:[Bandit] Patrol]: Starting... %1",_position];

	//Spawn units
	_units = [[_position select 0,_position select 1,0.1],3,"Hard","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_group;

	//Spawn vehicles
	_vehicle = [_vehclass,_position,_mission] call custom_publish;

	// load the guns
	[_vehicle,_vehclass] spawn load_ammo;

	//Setup patrol
	[_vehicle,_position,_units,_pos_location,3] call patrol;
	
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] patrol spawned a %1",_vehname];
	};
	
	//Condition
	_complete = [
		[_mission,_vehicle], // mission number and crate
		["patrol"], 		 // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle], 		 // cleanup objects
		format["Heroes have started to patrol in %1",(_location select 0)],	// mission announcement
		"Bandits have taken out the hero patrol!",		// mission success
		"Heroes managed to reach their destination"		// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_vehicle,6,4,15,2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Armed Vehicle]: Ended at %1",_position];
	
	b_missionsrunning = b_missionsrunning - 1;
};