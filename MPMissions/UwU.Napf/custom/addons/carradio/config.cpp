
#define true		1
#define false		0

#define VSoft		0
#define VArmor		1
#define VAir		2

#define TEast		0
#define TWest		1
#define TGuerrila	2
#define TCivilian	3
#define TSideUnknown	4
#define TEnemy		5
#define TFriendly	6
#define TLogic		7

#define private		0
#define protected	1
#define public		2


class CfgPatches
{
	class CLAY_CarRadio
	{
		units[] = {CLAY_CarRadioLogic};
		weapons[] = {};
		requiredAddons[] = {};
		requiredVersion  = 1.51;
		version = "2011-01-26";
	};
};

#include "description.h"

class CfgVehicles
{
	class Logic;
	class CLAY_CarRadioLogic: Logic
	{
		displayName = "Car Radio";
		icon = "i_carradio.paa";
		picture = "i_carradio.paa";
		vehicleClass = "Modules";
		class EventHandlers
		{
			init = "nul = [] execVM 'custom\addons\carradioinitCarRadio.sqf';";
		};
	};
};
