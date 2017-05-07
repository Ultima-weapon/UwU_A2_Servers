
disableSerialization;
CLAY_RadioDialog = createDialog "CLAY_CarRadio_RadioDlg";


If (CLAY_RadioShowTooltips) Then
{
	_display = findDisplay 666;

	_control = _display displayCtrl 603;
	_control ctrlSetTooltip "Volume Up";
	_control ctrlCommit 0;

	_control = _display displayCtrl 604;
	_control ctrlSetTooltip "Volume Down";
	_control ctrlCommit 0;

	_control = _display displayCtrl 615;
	_control ctrlSetTooltip "Previous Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 616;
	_control ctrlSetTooltip "Next Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 617;
	_control ctrlSetTooltip "Next Playlist";
	_control ctrlCommit 0;

	_control = _display displayCtrl 618;
	_control ctrlSetTooltip "Previous Playlist";
	_control ctrlCommit 0;

	_control = _display displayCtrl 619;
	_control ctrlSetTooltip "Close";
	_control ctrlCommit 0;

	_control = _display displayCtrl 620;
	_control ctrlSetTooltip "Open Playlist Editor";
	_control ctrlCommit 0;

	_control = _display displayCtrl 621;
	_control ctrlSetTooltip "Repeat on/off";
	_control ctrlCommit 0;

	_control = _display displayCtrl 622;
	_control ctrlSetTooltip "Random on/off";
	_control ctrlCommit 0;

	_control = _display displayCtrl 623;
	_control ctrlSetTooltip "Change Key Color";
	_control ctrlCommit 0;

	_control = _display displayCtrl 624;
	_control ctrlSetTooltip "Change Display Color";
	_control ctrlCommit 0;

	_control = _display displayCtrl 625;
	_control ctrlSetTooltip "Change Background Color";
	_control ctrlCommit 0;

	_control = _display displayCtrl 626;
	_control ctrlSetTooltip "Play/Pause";
	_control ctrlCommit 0;

	_control = _display displayCtrl 634;
	_control ctrlSetTooltip "Add Selected Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 635;
	_control ctrlSetTooltip "Add All Tracks";
	_control ctrlCommit 0;

	_control = _display displayCtrl 636;
	_control ctrlSetTooltip "Remove Selected Track";
	_control ctrlCommit 0;

	_control = _display displayCtrl 637;
	_control ctrlSetTooltip "Remove All Tracks";
	_control ctrlCommit 0;

	_control = _display displayCtrl 640;
	_control ctrlSetTooltip "Restore User-Defined Playlist";
	_control ctrlCommit 0;
};


If (CLAY_RadioPlaying) Then
{
	_title = (CLAY_RadioPlayList select CLAY_RadioTrack) select 1;
	ctrlSetText [610, _title];
	ctrlSetText [626, "||"];
}
Else
{
	playMusic "";
};

switch (CLAY_RadioSrc) do
{
	case 1:
	{
		CLAY_RadioPlayList = CLAY_RadioGameMusic;
		ctrlSetText [611, "ArmA2 Music"];
	};
	case 2:
	{
		CLAY_RadioPlayList = CLAY_RadioGameMusicOA;
		ctrlSetText [611, "A2OA Music"];
	};
	case 3:
	{
		If (isNil "CLAY_RadioAddMusic") Then
		{
			CLAY_RadioPlayList = [];
		}
		Else
		{
			CLAY_RadioPlayList = CLAY_RadioAddMusic;
		};
		ctrlSetText [611, "User Music"];
	};
	case 4:
	{
		If (isNil "CLAY_RadioAddMusic") Then
		{
			CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA;
		}
		Else
		{
			CLAY_RadioPlayList = CLAY_RadioGameMusic + CLAY_RadioGameMusicOA + CLAY_RadioAddMusic;
		};
		ctrlSetText [611, "All Music"];
	};
	case 5:
	{
		CLAY_RadioPlayList = CLAY_RadioCustomMusic;
		ctrlSetText [611, "Custom"];
	};
};

If (CLAY_RadioRepeat) Then
{
	ctrlSetText [612, "Repeat"];
};

If (CLAY_RadioRandom) Then
{
	ctrlSetText [613, "Random"];
};

CLAY_RadioKeyColor = CLAY_RadioKeyColor - 1;
["kCol"] execVM "custom\addons\carradio\scripts\settings.sqf";

CLAY_RadioDisplay = CLAY_RadioDisplay - 1;
["dCol"] execVM "custom\addons\carradio\scripts\settings.sqf";

If (CLAY_RadioColor == "Silver") Then
{
	_control = (findDisplay 666) displayCtrl 600;
	_control ctrlSetBackgroundColor [0.8,0.8,0.8,1];
	_control ctrlCommit 0;
	_control = (findDisplay 666) displayCtrl 601;
	_control ctrlSetTextColor [0,0,0,1];
	_control ctrlCommit 0;
};

CLAY_RadioVol = CLAY_RadioVol - 0.05;
CLAY_RadioVolStep = CLAY_RadioVolStep - 1;
["volUp"] execVM "custom\addons\carradio\scripts\settings.sqf";
