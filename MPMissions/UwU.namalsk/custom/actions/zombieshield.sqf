private ["_mypos", "_dir", "_createShield", "_sounddist", "_timeplay", "_shield", "_shieldUp", "_timer", "_zombies", "_count", "_zombie", "_soundList","_humRank"];
 
player playActionNow "Medic";
sleep 1;
titleText ["You are building an Anti-Zombie Frequency Emitter.","PLAIN DOWN"]; titleFadeOut 5;
 
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_createShield = createVehicle ["SkeetMachine", _mypos, [], 0, "CAN_COLLIDE"];
_createShield setDir _dir;
_createShield setposATL _mypos;
sleep 1;
 
player removeMagazine "PartEngine";
player removeMagazine "ItemJerrycan";
sleep 0.01;
player addMagazine "ItemJerrycanEmpty";
 
titleText ["Device activated.","PLAIN DOWN"]; titleFadeOut 5;
 
_humRank = player getVariable['humanity', 0];
// NO RANK
if(_humRank < 5000 && _humRank > -5000) then {_sounddist = 50; _timeplay = 20;};
// HERO RANK
if(_humRank >= 5000 && _humRank < 10000) then {_sounddist = 45; _timeplay = 20*1.2;};
if(_humRank >= 10000 && _humRank < 15000) then {_sounddist = 40; _timeplay = 20*1.4;};
if(_humRank >= 15000 && _humRank < 25000) then {_sounddist = 35; _timeplay = 20*1.6;};
if(_humRank >= 25000 && _humRank < 40000) then {_sounddist = 30; _timeplay = 20*1.8;};
if(_humRank >= 40000 && _humRank < 60000) then {_sounddist = 25; _timeplay = 20*2;};
if(_humRank >= 60000 && _humRank < 90000) then {_sounddist = 20; _timeplay = 20*2.2;};
if(_humRank >= 90000 && _humRank < 130000) then {_sounddist = 15; _timeplay = 20*2.4;};
if(_humRank >= 130000 && _humRank < 185000) then {_sounddist = 10; _timeplay = 20*2.6;};
if(_humRank >= 185000 && _humRank < 250000) then {_sounddist = 5; _timeplay = 20*2.8;};
if(_humRank >= 250000) then {_sounddist = 0; _timeplay = 20*3;};
// BANDIT RANK
if(_humRank <= -5000 && _humRank > -10000) then {_sounddist = 51; _timeplay = 20*0.95;};
if(_humRank <= -10000 && _humRank > -15000) then {_sounddist = 52; _timeplay = 20*0.90;};
if(_humRank <= -15000 && _humRank > -25000) then {_sounddist = 53; _timeplay = 20*0.85;};
if(_humRank <= -25000 && _humRank > -40000) then {_sounddist = 54; _timeplay = 20*0.80;};
if(_humRank <= -40000 && _humRank > -60000) then {_sounddist = 55; _timeplay = 20*0.75;};
if(_humRank <= -60000 && _humRank > -90000) then {_sounddist = 56; _timeplay = 20*0.70;};
if(_humRank <= -90000 && _humRank > -130000) then {_sounddist = 57; _timeplay = 20*0.65;};
if(_humRank <= -130000 && _humRank > -185000) then {_sounddist = 58; _timeplay = 20*0.60;};
if(_humRank <= -185000 && _humRank > -250000) then {_sounddist = 59; _timeplay = 20*0.55;};
if(_humRank <= -250000) then {_sounddist = 60; _timeplay = 200*0.50;};
while {_timeplay > 1} do {
    _shield = nearestObject [player, "SkeetMachine"];
    [nil,_shield,rSAY,["engine_12s", _sounddist]] call RE;
 
    _shieldUp = (alive _shield);
    _timer = time;
    while {_shieldUp} do {
        _zombies = (getPosATL _shield) nearEntities ["zZombie_Base",50];
        _count = count _zombies;
 
        for "_i" from 0 to (_count -1) do {
            _zombie = _zombies select _i;
            _zombie setdamage 1;
            sleep 0.01;
        };
        if ((time - _timer) > 10) exitwith {};
    };
    _soundList = ["PMC_ElectricBlast1","PMC_ElectricBlast2"] call BIS_fnc_selectRandom;
    [nil,_shield,rSAY,[_soundList, _sounddist]] call RE;
    _timeplay = _timeplay - 1;
};
 
sleep 1;
deleteVehicle _createShield;
titleText ["Device deactivated.","PLAIN DOWN"]; titleFadeOut 5;