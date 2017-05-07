if (TTLaptopOn) then {
    _lappy = createVehicle [TTLapTyp, TTLapPos, [], 0, "CAN_COLLIDE"];
    _lappy setDir TTLapDir;
    _lappy setPos TTLapPos;
    _lappy setVehicleVarName "LAPTOP";
    LAPTOP = _lappy;
    publicVariable "LAPTOP";
};
if (isNil "TayTayfirstNR") then {

    waitUntil {not alive LAPTOP};
	
    _xx = TTDropPos select 0;
    _y = TTDropPos select 1;
    _z = TTDropPos select 2;
    _TTName = TTDropPos select 3;
    _coords = [_xx,_y,_z];	
	
    TTnukeTrigger = createTrigger ["EmptyDetector",_coords];
    publicVariable "TTnukeTrigger";
	
    TTEffectsTrigger = createTrigger ["EmptyDetector",_coords];
    publicVariable "TTEffectsTrigger";

    _msgSystem = format["Warning!! Someone found the Presidential 'Football' and launched a nuclear attack on %1. If you are within 1.5 kilometers, you might want to run the fuck away!.", str _TTName];
    _msgDebug = format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Warning!!</t><br/><img size='4.75' image='custom\addons\Nuke\GUI\nuke.paa'/><br/><t align='center' color='#ffffff'>Someone found the Presidential 'Football' and launched a nuclear attack on %1. If you are within 1.5 kilometers, you might want to run the fuck away!.</t>",str _TTName];

    [nil, nil, rspawn, [_msgSystem], { systemChat (_this select 0) }] call RE;

        [nil, nil, rspawn, [_msgDebug], {
			if (isNil "hint_debug_msn") then {
				hint_debug_msn=false;
			};
			if (isNil "debugMonitor") then {
				debugMonitor=false;
			};
			if (debugMonitor) then {
				hint_debug_msn=true;
				debugMonitor=false;
			};
			hint parseText (_this select 0);
			sleep 15;
			if (hint_debug_msn) then {
				hint_debug_msn=false;
				debugMonitor=true;
				[] spawn fnc_debug;
			};
		}] call RE;

    TayTayfirstNR = true;
    publicVariable "TayTayfirstNR";

    _do = '
    if (isServer) then
    {
        [] spawn
        {
            call compile (''[nil, nil, rSPAWN, [], {
                TTDropSpot = createVehicle ["HeliHEmpty",TTnukeTrigger,[], 0, "NONE"];
                siren = createVehicle ["HeliHEmpty",TTDropSpot,[], 0, "NONE"];
			
                TTDropSpot SAY "eve"; sleep 2; siren SAY "puk";
			
                _sirenPlayCnt = 0;
			
                while {(_sirenPlayCnt < 10)} do
                {
                    TTDropSpot SAY "nam"; sleep 8;
                    _sirenPlayCnt = _sirenPlayCnt + 1;
                    sleep 1;
                };
			
                if (_sirenPlayCnt < 3) then
                {
                    TTDropSpot SAY "nam"; sleep 7; siren SAY "nam"; sleep 8;
                    TTDropSpot SAY "nam"; sleep 7;
                };
			
                TTDropSpot SAY "eve"; sleep 10;
                siren SAY "puk"; sleep 90;
			
                deleteVehicle siren;
				
                earthquake =
                {
                    for "_i" from 0 to 140 do 
                    {
                        _vx = vectorup _this select 0;
                        _vy = vectorup _this select 1;
                        _vz = vectorup _this select 2;
                        _coef = 0.03 - (0.0001 * _i);
                        _this setvectorup [
                        _vx+(-_coef+random (2*_coef)),
                        _vy+(-_coef+random (2*_coef)),
                        _vz+(-_coef+random (2*_coef))
                        ];
                        sleep (0.01 + random 0.01);
                    };
                };
			
                environ =
                {
                    "colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
                    "colorCorrections" ppEffectCommit 0;
                    "colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
                    "colorCorrections" ppEffectCommit 3;
                    "colorCorrections" ppEffectEnable true;
                    "filmGrain" ppEffectEnable true; 
                    "filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
                    "filmGrain" ppEffectCommit 5;
                };

			
                if (player distance TTDropSpot < 2000) then
                {
                    "dynamicBlur" ppEffectEnable true;
                    "dynamicBlur" ppEffectAdjust [0.5];
                    "dynamicBlur" ppEffectCommit 3;
                    sleep 0.1;
                    "dynamicBlur" ppEffectAdjust [2];
                    "dynamicBlur" ppEffectCommit 1;
                    "dynamicBlur" ppEffectAdjust [1];
                    "dynamicBlur" ppEffectCommit 4;
                };

                player spawn environ;

                player spawn earthquake;
			

                sleep 2;
				
                if (player distance TTDropSpot < 1000) then {
                    playSound "nuke";
                };
				
                if (player distance TTDropSpot < TTDeaZ) then {
                    _id = [player,"rad"] spawn player_death;
                };				
				
			
                _Cone = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _Cone setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
                [0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
                [0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", TTDropSpot];
                _Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
                _Cone setParticleCircle [10, [-10, -10, 20]];
                _Cone setDropInterval 0.005;

                _top = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _top setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 21, [0, 0, 0],
                [0, 0, 65], 0, 1.7, 1, 0, [100,80,110], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", TTDropSpot];
                _top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
                _top setDropInterval 0.002;

                _top2 = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _top2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 112, 0], "", "Billboard", 1, 22, [0, 0, 0],
                [0, 0, 60], 0, 1.7, 1, 0, [100,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", TTDropSpot];
                _top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
                _top2 setDropInterval 0.002;

                _smoke = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
                [0, 0, 70], 0, 1.7, 1, 0, [50,20,120], 
                [[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]],
                [0.5, 0.1], 1, 1, "", "", TTDropSpot];
                _smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
                _smoke setDropInterval 0.002;

                _Wave = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 20/2, [0, 0, 0],
                [0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
                [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", TTDropSpot];
                _Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
                _Wave setParticleCircle [50, [-80, -80, 2.5]];
                _Wave setDropInterval 0.0002;

                _light = "#lightpoint" createVehicleLocal [((getpos TTDropSpot select 0)),(getpos TTDropSpot select 1),((getpos TTDropSpot select 2)+800)];
                _light setLightAmbient[1500, 1200, 1000];
                _light setLightColor[1500, 1200, 1000];
                _light setLightBrightness 10000.0;


                if (TTVehDam) then {
                    _array = nearestObjects [TTnukeTrigger, ["All"], TTVehDis];
                    sleep 0.1;
                    {_nukeX = _x;
						_nukeX setDamage 1;
						sleep .15;
					} forEach _array;
                    sleep 0.1;
                };

                sleep 3;
				
                if (TTPlyDeath && player distance TTDropSpot > 1500) then {
                    playSound "nuke";
                };
				
                _Wave setDropInterval 0.001;
			
                deletevehicle _top;
                deletevehicle _top2;

                sleep 3;
                setaperture -1;

                _top3 = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _top3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 24, [0, 0, 450],
                [0, 0, 49], 0, 1.7, 1, 0, [120,130,150], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", TTDropSpot];
                _top3 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
                _top3 setDropInterval 0.002;
			
                sleep 4;
			
                deletevehicle _top3;

                sleep 4;
			

                if (player distance TTDropSpot < 4000) then
                {
                    "dynamicBlur" ppEffectAdjust [0];
                    "dynamicBlur" ppEffectCommit 1;
                };

                _top4 = "#particlesource" createVehicleLocal getpos TTDropSpot;
                _top4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 22, [0, 0, 770],
                [0, 0, 30], 0, 1.7, 1, 0, [100,120,140], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", TTDropSpot];
                _top4 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
                _top4 setDropInterval 0.002;
			
                sleep 3;
			

			
                _top4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 3, 48, 0], "", "Billboard", 1, 25, [0, 0, 830],
                [0, 0, 30], 0, 1.7, 1, 0, [100,120,140], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", TTDropSpot];

                _Wave setDropInterval 0.001*10;
                _Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 20/2, [0, 0, 0],
                [0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
                [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", TTDropSpot];
                _Wave setParticleCircle [50, [-40, -40, 2.5]];

                deleteVehicle _light;

				if (TTVehDam) then {
                    _array = nearestObjects [TTnukeTrigger, ["All"], TTRadZ*0.33];
                    sleep 0.1;
                    {_nukeX = _x; 
						_nukeX setDamage 0.25;
						sleep .15;
					} forEach _array;
                    sleep 0.1;
                };
				
                sleep 4;
			
                deletevehicle _top4;

				if (TTVehDam) then {
                    _array = nearestObjects [TTnukeTrigger, ["All"], TTRadZ*0.66];
                    sleep 0.1;
                    {_nukeX = _x; 
						_nukeX setDamage 0.25;
						sleep .15;
					} forEach _array;
                    sleep 0.1;
                };
				
                _i = 0;
                while {_i < 100} do
                {
                    _light setLightBrightness (100.0 - _i)/100;
                    _i = _i + 1;
                    sleep 0.1;
                };
			
                for "_i" from 0 to 15 do
			
                {
                    _smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
                    [0, 0, 60+_i], 0, 1.7, 1, 0, [40,15,120], 
                    [[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]],
                    [0.5, 0.1], 1, 1, "", "", TTDropSpot];
                };

				if (TTVehDam) then {
                    _array = nearestObjects [TTnukeTrigger, ["All"], TTRadZ];
                    sleep 0.1;
                    {_nukeX = _x; 
						_nukeX setDamage 0.25;
						sleep .15;
					} forEach _array;
                    sleep 0.1;
                };
				
                _timeNow = time;
                waituntil {(time - _timeNow) > 180};

                _smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
                [0, 0, 30], 0, 1.7, 1, 0, [40,25+10,80], 
                [[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]],
                [0.5, 0.1], 1, 1, "", "", TTDropSpot];
			
                _smoke setDropInterval 0.012;
                _Cone setDropInterval 0.02;
                _Wave setDropInterval 0.01;

                sleep 10;
			
                deleteVehicle _Wave;
                deleteVehicle _cone;
                deleteVehicle _smoke;
                deleteVehicle TTDropSpot;

                sleep 300;

            }] call RE;'');
		
        };
	
    };
    ';
    _unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;

	
    Sleep 185;
    //t
    sleep 60;
    TTNukeEffects = true;
    publicVariable "TTNukeEffects";
    sleep 10;
    TTwindAsh = true;
    publicVariable "TTwindAsh";
	

    if (TTNukeRem) then {
        //Sleep 20;
        sleep TTTimeRem;
        deleteVehicle TTnukeTrigger;
        TTDelNuke = true;
        publicVariable "TTDelNuke";

        _do = '
        if (isServer) then
        {
            [] spawn
            {
                call compile (''[nil, nil, rSPAWN, [], {
                    _rem1 = ppEffectCreate ["colorCorrections", 1501];
                    _rem1 ppEffectEnable true;
                    _rem1 ppEffectAdjust [1, 1, 0, [0,0,0,0], [1.1,0.7,1.1,1.1], [1.0,0.7,1.0,1.1]]; 
                    _rem1 ppEffectCommit 45;
                    _rem2 = ppEffectCreate ["filmGrain", 2005];
                    _rem2 ppEffectEnable true;
                    _rem2 ppEffectAdjust [0, 0, 0, 0, 0, false];
                    _rem2 ppEffectCommit 45;
                    _rem3 = ppEffectCreate ["wetDistortion", 2006];
                    _rem3 ppEffectEnable false;
                    deleteMarkerLocal "TTNukeMrk";
                    deleteMarkerLocal "TTNukeMrkText";
                    TTRadZoneEffects = false;
                }] call RE;'');
		
            };
	
        };
        ';
        _unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	
    };
};
