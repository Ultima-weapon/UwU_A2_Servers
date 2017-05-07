class ExtraRc {

	class ItemToolbox {
		class BuildBox {
			text = "Origins Construction";
			script = "['USOrdnanceBox'] execVM 'custom\EVD\EVD_deploy.sqf'";
		};		
	};
	class ItemRadio {
		class switchOnOff {
            text = "Switch ON/OFF";
            script = "execVM 'custom\compile\switch_on_off.sqf'";
        };
		class GroupManagement {
			text = "Group Management";
			script = "execVM 'custom\addons\dzgm\loadGroupManagement.sqf'";
		};
	};
	class Binocular_Vector  {
		class viewdistanceTitle {
				text = "View Distance:";
				script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance500m {
				text = "500 Meters";
				script = "setViewDistance 500; systemChat('ViewDistance: 500');";
		};
		class distance1000m {
				text = "1000 Meters";
				script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance2000m {
				text = "2000 Meters";
				script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
				text = "3000 Meters";
				script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
				text = "5000 Meters";
				script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance7500m {
				text = "7500 Meters";
				script = "setViewDistance 7500; systemChat('ViewDistance: 7500'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance10000m {
				text = "10000 Meters";
				script = "setViewDistance 10000; systemChat('ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance15000m {
				text = "15000 Meters";
				script = "setViewDistance 15000; systemChat('ViewDistance: 15000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance20000m {
				text = "20000 Meters";
				script = "setViewDistance 20000; systemChat('ViewDistance: 20000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	class Binocular {
		class viewdistanceTitle {
				text = "View Distance:";
				script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance500m {
				text = "500 Meters";
				script = "setViewDistance 500; systemChat('ViewDistance: 500');";
		};
		class distance1000m {
				text = "1000 Meters";
				script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance2000m {
				text = "2000 Meters";
				script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
				text = "3000 Meters";
				script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
				text = "5000 Meters";
				script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance7500m {
				text = "7500 Meters";
				script = "setViewDistance 7500; systemChat('ViewDistance: 7500'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance10000m {
				text = "10000 Meters";
				script = "setViewDistance 10000; systemChat('ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance15000m {
				text = "15000 Meters";
				script = "setViewDistance 15000; systemChat('ViewDistance: 15000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance20000m {
				text = "20000 Meters";
				script = "setViewDistance 20000; systemChat('ViewDistance: 20000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	class Laserdesignator {
		class viewdistanceTitle {
				text = "View Distance:";
				script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance500m {
				text = "500 Meters";
				script = "setViewDistance 500; systemChat('ViewDistance: 500');";
		};
		class distance1000m {
				text = "1000 Meters";
				script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance2000m {
				text = "2000 Meters";
				script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
				text = "3000 Meters";
				script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
				text = "5000 Meters";
				script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance7500m {
				text = "7500 Meters";
				script = "setViewDistance 7500; systemChat('ViewDistance: 7500'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance10000m {
				text = "10000 Meters";
				script = "setViewDistance 10000; systemChat('ViewDistance: 10000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance15000m {
				text = "15000 Meters";
				script = "setViewDistance 15000; systemChat('ViewDistance: 15000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance20000m {
				text = "20000 Meters";
				script = "setViewDistance 20000; systemChat('ViewDistance: 20000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
	class ItemAmethyst {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Amethyst.sqf""";
        };
	};	
	class ItemCitrine {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Citrine.sqf""";
        };
		
    };
	class ItemEmerald {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Emerald.sqf""";
        };
		
    };	
	class ItemObsidian {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Obsidian.sqf""";
        };
		
    };	
	class ItemRuby {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Ruby.sqf""";
        };
		
    };	
	class ItemSapphire {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Sapphire.sqf""";
        };
		
    };	
	class ItemTopaz {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Topaz.sqf""";
        };
		
    };
	class ItemLightbulb {
        class Start_Crafting {
            text = "Start Crafting!";
            script = "closeDialog 0;createDialog ""Advanced_Crafting"";execVM ""custom\addons\Buildables\Lights.sqf""";
        };
		
    };	
};