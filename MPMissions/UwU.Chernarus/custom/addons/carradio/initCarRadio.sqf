
private ["_userPlaylist", "_keyPlay", "_keyNext", "_keyPre", "_keyVolUp", "_keyVolDown", "_CLAY_CarRadio_KeyPressed"];

sleep 0.1;
#include "userconfig\CLAY_CarRadio\CLAY_CarRadio.hpp";

CLAY_CarRadio_UserPlaylist = _userPlaylist;

CLAY_CarRadio_KeyPlay    = _keyPlay;
CLAY_CarRadio_KeyNext    = _keyNext;
CLAY_CarRadio_KeyPre     = _keyPre;
CLAY_CarRadio_KeyVolUp   = _keyVolUp;
CLAY_CarRadio_KeyVolDown = _keyVolDown;

CLAY_CarRadio_KeyPressedCode = compile preprocessFile "custom\addons\carradio\scripts\key.sqf";
_CLAY_CarRadio_KeyPressed = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CLAY_CarRadio_KeyPressedCode"];

If (isNil "CLAY_RadioAddMusic") Then {CLAY_RadioAddMusic = []};
If (isNil "CLAY_RadioAddVehicles") Then {CLAY_RadioAddVehicles = []};
If (isNil "CLAY_RadioNoVehicles") Then {CLAY_RadioNoVehicles = []};
If (isNil "CLAY_RadioShowTooltips") Then {CLAY_RadioShowTooltips = false};

_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
_trigger1 setTriggerArea [0, 0, 0, false];
_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; CLAY_ID_RADIO = CLAY_RadioVeh addAction ['Car Radio','custom\addons\carradio\scripts\radio.sqf'];", "CLAY_RadioEndTimer = true; CLAY_RadioPlaying = false; playMusic ''; CLAY_RadioVeh removeAction CLAY_ID_RADIO; CLAY_RadioVeh = nil;"];


CLAY_RadioPlaying = false;
CLAY_RadioEndTimer = true;

CLAY_RadioGameMusic = 
[
	//["Ambient01_Cold_Wind", "Ambient: Cold Wind", 153], 
	//["Ambient02_Vague_Shapes", "Ambient: Vauge Shapes", 219], 
	//["Ambient03_Indian_Summer", "Ambient: Indian Summer", 102], 
	//["Ambient04_Electronic_Warfare", "Ambient: Electronic Warfare", 76], 
	//["Ambient05_Cobalt", "Ambient: Cobalt", 43], 
	//["Ambient06_Khe_Sanh_Riff", "Ambient: Khe Sanh Riff", 211], 
	//["Ambient07_Manhattan", "Ambient: Manhatten", 101], 
	//["Ambient08_Reforger", "Ambient: Reforger", 155], 
	//["Short01_Defcon_Three", "Defcon Three", 38], 
	["Track01_Dead_Forest", "Dead Forest", 64], 
	["Track02_Insertion", "Insertion", 105], 
	["Track03_First_to_Fight", "First to Fight", 119], 
	["Track04_Reinforcements", "Reinforcements", 88], 
	["Track05_Warpath", "Warpath", 143], 
	["Track06_Abandoned_Battlespace", "Abandoned Battlespace", 111], 
	["Track07_Last_Men_Standing", "Last Man Standing", 63], 
	["Track08_Harvest_Red", "Harvest Red", 78], 
	["Track09_Movement_To_Contact", "Movement to Contact", 81], 
	["Track10_Logistics", "Logistics", 148], 
	["Track11_Large_Scale_Assault", "Large Scale Assault", 42], 
	["Track12_The_Movement", "The Movement", 72], 
	["Track13_Sharping_Knives", "Sharping Knives", 180], 
	["Track14_Close_Quarter_Combat", "Close Quarter Combat", 188], 
	["Track15_Morning_Sortie", "Morning Sortie", 55], 
	["Track16_Valentine", "Valentine", 86], 
	["Track17_Marauder_Song", "Marauder Song", 68], 
	["Track18_Ghost_Waltz", "Ghost Waltz", 113], 
	["Track19_Debriefing", "Debriefing", 104], 
	["Track20_Badlands", "Badlands", 137], 
	["Track21_Rise_Of_The_Fallen", "Rise of the Fallen", 89], 
	["Track22_Chernarussian_Anthem", "Chernarussian Anthem", 129], 
	["Track26_Organ_Works", "Organ Works", 69], 
	["Track27_Killing_Machines", "Eastern Eggs - Killing Machines", 210],
	//Eagle Wing - 15.07.2010
	["ToWar", "To War", 160], 
	["AllHelllBreaksLoose", "All Hell Breaks Loose", 150], 
	["Fallout", "Fallout", 163], 
	["Defcon", "Defcon", 145], 
	["Wasteland", "Wasteland", 142], 
	["SkyNet", "Sky Net", 175], 
	["MAD", "Mutual Assured Destruction", 153]
];

CLAY_RadioGameMusicOA = 
[
	["EP1_Track01", "Arrowhead", 218],
	["EP1_Track01D", "Arrowhead Drums", 28],
	["EP1_Track02", "Good Morning T-Stan", 164],
	["EP1_Track03", "Airborne", 57],
	["EP1_Track03D", "Airborne Drums", 75],
	["EP1_Track04", "Arrival", 253],
	["EP1_Track05", "Zargabad Market", 103],
	["EP1_Track06", "Nightlife", 175],
	["EP1_Track07", "Coltan-Blues", 180],
	["EP1_Track07D", "Coltan-Drums", 75],
	["EP1_Track08", "Revolver-Jam", 136],
	["EP1_Track09", "Dancing Scimitar", 159],
	["EP1_Track10", "Death from Above", 176],
	["EP1_Track11", "Night-Visions", 124],
	["EP1_Track12", "Crude Oil", 238],
	["EP1_Track13", "Iron Mountain", 167],
	["EP1_Track13D1", "Mountain Drums 1", 73],
	["EP1_Track13D2", "Mountain Drums 2", 75],
	["EP1_Track13V", "Mountain Vocals", 40],
	["EP1_Track14", "Concrete Cell", 263],
	["EP1_Track15", "Warmongers", 140]
];


If (count CLAY_CarRadio_UserPlaylist > 0) Then
{
	CLAY_RadioCustomMusic = CLAY_CarRadio_UserPlaylist;
}
Else
{
	CLAY_RadioCustomMusic = [];
};

CLAY_RadioPlayList = CLAY_RadioGameMusic;

CLAY_RadioTrack = 0;
CLAY_RadioVol = 0.5;
CLAY_RadioVolStep = 10;

CLAY_RadioSrc = 1;
CLAY_RadioRepeat = false;
CLAY_RadioRandom = false;
CLAY_RadioKeyColor = 1;
CLAY_RadioDisplay = 9;
CLAY_RadioColor = "Black";
