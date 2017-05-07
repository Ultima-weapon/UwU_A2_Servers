waitUntil {sleep 0.3; !isNil "TTNukeEffects"};
_radTimer = 0;
TTRadZoneEffects = false;

_rad1 = ppEffectCreate ["colorCorrections", 1501];
_rad1 ppEffectEnable true;
_rad1 ppEffectAdjust [1, 1, 0, [0,0,0,0], [1.1,0.7,1.1,1.1], [1.0,0.7,1.0,1.1]]; 
_rad1 ppEffectCommit 45;

if (TTShowMrk && isNil "TTDelNuke") then {
    _nil = createMarkerLocal ["TTNukeMrk", TTEffectsTrigger];
    "TTNukeMrk" setMarkerShapeLocal "ELLIPSE";
    "TTNukeMrk" setMarkerTypeLocal "Warning";
    "TTNukeMrk" setMarkerColorLocal "ColorRed";
    "TTNukeMrk" setMarkerBrushLocal "SOLID";
    "TTNukeMrk" setMarkerSizeLocal [TTRadZ, TTRadZ];
    _null = createMarkerLocal ["TTNukeMrkText", TTEffectsTrigger];
    "TTNukeMrkText" setMarkerColorLocal "ColorBlack";
    "TTNukeMrkText" setMarkerTypeLocal "Vehicle";
    "TTNukeMrkText" setMarkerTextLocal TTTxtMrk;
};

sleep 5;

TTnukeTrigger setTriggerActivation ["ANY", "PRESENT", true];

TTnukeTrigger setTriggerStatements 

[
"(player distance thisTrigger) < TTRadZ",
		
"TitleText[""Geiger on..."",""PLAIN DOWN""];execVM ""custom\addons\Nuke\Effects\on.sqf"";TTRadZoneEffects = true;",
		
"TitleText[""Geiger off..."",""PLAIN DOWN""];execVM ""custom\addons\Nuke\Effects\off.sqf"";TTRadZoneEffects = false;"
];

waitUntil{sleep 0.3; !isNil "TTwindAsh"};

winds =
{
    while {true} do
    {
	
        _ran = ceil random 2;
        _pos = position player;
        _velocity = [random 10,random 10,-1];
        _color = [1.0, 0.9, 0.8];
        _alpha = 0.02 + random 0.02;
        _ps = "#particlesource" createVehicleLocal _pos;  
        _ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _pos];
        _ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
        _ps setParticleCircle [0.1, [0, 0, 0]];
        _ps setDropInterval 0.01;
        sleep (random 1);
        _delay = 1 + random 5;
        sleep _delay;
        deletevehicle _ps;
    };
};

ash =
{
    _pos = position player;
    _parray = 
    [
    ["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8, 1],
    "",
    "Billboard",
    1,
    4,
    [0,0,0],
    [0,0,0],
    1,
    0.000001,
    0,
    1.4,
    [0.05,0.05],
    [[0.1,0.1,0.1,1]],
    [0,1],
    0.2,
    1.2,
    "",
    "",
    vehicle player
    ];
	
    _ash = "#particlesource" createVehicleLocal _pos;  
    _ash setParticleParams _parray;
    _ash setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    _ash setParticleCircle [0.0, [0, 0, 0]];
    _ash setDropInterval 0.003;
};
waitUntil {((!isNil "dayz_animalCheck") || (!isNil "dayz_spawnCheck") || (!isNil "dayz_locationCheck") || (!isNil "dayz_slowCheck"))};
player spawn ash;
player spawn winds;
doobreath =
{
    private ["_pos", "_ps"];
    sleep random 2;
    _pos = _this selectionposition "neck";
		
    while {_this distance player < 800 and _this distance TTnukeTrigger < TTRadZ and alive _this and vehicle _this == _this and _pos select 2 != 0} do 
    {
        _pos = _this selectionposition "neck";
        _ps = "#particlesource" createvehiclelocal getpos _this;
        _ps setparticleparams [["\ca\data\particleeffects\universal\universal.p3d", 16, 12, 13, 0], "", "Billboard", 0.5, 0.5, [_pos select 0, (_pos select 1) + 0.15, _pos select 2], [0, 0.2, -0.2], 1, 1.275, 1, 0.2, [0, 0.2, 0], [[1, 1, 1, 0.01], [1, 1, 1, 0.01], [1, 1, 1, 0]], [1000], 1, 0.04, "", "", _this];
        _ps setparticlerandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
        _ps setdropinterval 0.001;
        _this setvariable ["runningbreath", floor time + 5];
        sleep 0.5;
        deletevehicle _ps;
        sleep 2 + random 2;  
    };		
};

[] spawn
{
    while {true} do 
    {
        sleep 5;
        _near = nearestobjects [player, ["Man"], 500];
        {
            if (alive _x and vehicle _x == _x and _x getvariable ["runningbreath", -1] < time) then 
            {
                _x setvariable ["runningbreath", floor time + 5];
                _x spawn doobreath;
            };
        }   foreach _near;
    };
};


while {true} do
{
    if (TTRadZoneEffects and typeof player in TTAntiR) then
    {
        [player,"radzone1",0,true] call dayz_zombieSpeak;
    };
	
    if (TTRadZoneEffects and !(typeof player in TTAntiR)) then
    {
        _radsound = "radzone1";
        _bloodloss = 1;
        if(_radTimer > 5 AND _radTimer < 10) then
        {
            _radsound = "radzone2";
            _bloodloss = 1;
        };
        if(_radTimer > 10) then
        {
            _radsound = "radzone3";
            _bloodloss = 1;
        };
        if(_radTimer > 15) then 
        {
            _radsound = "radzone4";
            _bloodloss = TTBlood;
        };
        _result = r_player_blood - _bloodloss;
        if (_result < 0) then
        {
            _id = [player,"rad"] spawn player_death;
        } else {
            r_player_blood = _result;
        };
        addCamShake [2, 1, 25];
        [player,_radsound,0,true] call dayz_zombieSpeak;
        _radTimer = _radTimer + 1;
    } else {
        _radTimer = 0;	
    };
	
    sleep 2;
};
