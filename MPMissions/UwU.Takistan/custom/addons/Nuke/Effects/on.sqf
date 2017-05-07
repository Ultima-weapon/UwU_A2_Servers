sleep 3;

_rad1 = ppEffectCreate ["colorCorrections", 1501];
_rad1 ppEffectEnable true;
_rad1 ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
_rad1 ppEffectCommit 5;
_rad2 = ppEffectCreate ["filmGrain", 2005];
_rad2 ppEffectEnable true;
_rad2 ppEffectAdjust [0.1, -5, 0.1, 0.01, 5, false];
_rad2 ppEffectCommit 5;
_rad3 = ppEffectCreate ["wetDistortion", 2006];
_rad3 ppEffectAdjust [1, 0.009, 0.009, 0.4, 0.9, 0.456, 0.283, 0, 0.474, 0.876, 0.211, 0.576, 0, 0, 0.122];
_rad3 ppEffectEnable true;
_rad3 ppEffectCommit 0;
