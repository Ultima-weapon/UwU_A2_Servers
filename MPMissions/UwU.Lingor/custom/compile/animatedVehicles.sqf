if (_inVehicle && {_vehicle isKindOf "MV22"}) then {
   if (isEngineOn _vehicle) then {[_vehicle,0] call mv22_pack;};
   if (mv22_fold < 0) then {
     themv22 = _vehicle;
     if !(isEngineOn themv22) then {
       mv22_fold = themv22 addAction ["Fold","custom\actions\mv22_fold.sqf","",5,false,true];
       mv22_unfold = themv22 addAction ["UnFold","custom\actions\mv22_unfold.sqf","",5,false,true];
       mv22_open = themv22 addAction ["Open Ramp","custom\actions\mv22_open.sqf","",5,false,true];
       mv22_close = themv22 addAction ["Close Ramp","custom\actions\mv22_close.sqf","",5,false,true];
     };
   };
   if (isEngineOn themv22) then {
     themv22 removeAction mv22_fold;
     mv22_fold = -1;
     themv22 removeAction mv22_unfold;
     mv22_unfold = -1;
     themv22 removeAction mv22_open;
     mv22_open = -1;
     themv22 removeAction mv22_close;
     mv22_close = -1;
   };
} else {
    if (!isNil "themv22") then {
       themv22 removeAction mv22_fold;
       mv22_fold = -1;
       themv22 removeAction mv22_unfold;
       mv22_unfold = -1;
       themv22 removeAction mv22_open;
       mv22_open = -1;
       themv22 removeAction mv22_close;
       mv22_close = -1;
   };
};

if (_inVehicle && {_vehicle isKindOf "ArmoredSUV_Base_PMC"}) then {
   if ((_vehicle animationPhase "HideGun_01") == 1) then {
     _unit = _vehicle turretUnit [0];
     if (!(isNull _unit)) then {
       _unit action ["moveToCargo",_vehicle,2];
       titleText ["\n\nYou must open the hatch first.","PLAIN DOWN"];titleFadeOut 4;
     };
   };
   if (suv_close < 0) then {
     thesuv = _vehicle;
     suv_close = thesuv addAction ["Close Hatch","custom\actions\suv_close.sqf","",5,false,true];
     suv_open = thesuv addAction ["Open Hatch","custom\actions\suv_open.sqf","",5,false,true];
   };
} else {
    if (!isNil "thesuv") then {
        thesuv removeAction suv_close;
        suv_close = -1;
        thesuv removeAction suv_open;
        suv_open = -1;
    };
};

if (_inVehicle && {(typeOf _vehicle) in ["UH1Y","UH1Y_DZ","UH1Y_DZE"]}) then {
   if (isEngineOn _vehicle) then {[_vehicle,0] call uh1y_pack;};
   if (uh1y_fold < 0) then {
     theuh1y = _vehicle;
     if !(isEngineOn theuh1y) then {
       uh1y_fold = theuh1y addAction ["Fold","custom\actions\uh1y_fold.sqf","",5,false,true];
       uh1y_unfold = theuh1y addAction ["UnFold","custom\actions\uh1y_unfold.sqf","",5,false,true];
     };
   };
   if (isEngineOn theuh1y) then {
     theuh1y removeAction uh1y_fold;
     uh1y_fold = -1;
     theuh1y removeAction uh1y_unfold;
     uh1y_unfold = -1;
   };
} else {
    if (!isNil "theuh1y") then {
       theuh1y removeAction uh1y_fold;
       uh1y_fold = -1;
       theuh1y removeAction uh1y_unfold;
       uh1y_unfold = -1;
   };
};

if (_inVehicle && {_vehicle isKindOf "AH1Z"}) then {
   if (isEngineOn _vehicle) then {[_vehicle,0] call ah1z_pack;};
   if (ah1z_fold < 0) then {
     theah1z = _vehicle;
     if !(isEngineOn theah1z) then {
       ah1z_fold = theah1z addAction ["Fold","custom\actions\ah1z_fold.sqf","",5,false,true];
       ah1z_unfold = theah1z addAction ["UnFold","custom\actions\ah1z_unfold.sqf","",5,false,true];
     };
   };
   if (isEngineOn theah1z) then {
     theah1z removeAction ah1z_fold;
     ah1z_fold = -1;
     theah1z removeAction ah1z_unfold;
     ah1z_unfold = -1;
   };
} else {
    if (!isNil "theah1z") then {
       theah1z removeAction ah1z_fold;
       ah1z_fold = -1;
       theah1z removeAction ah1z_unfold;
       ah1z_unfold = -1;
   };
};