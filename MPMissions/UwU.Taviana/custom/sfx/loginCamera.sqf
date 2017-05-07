private [ "_camera", "_welcomeMessage", "_camDistance" ];
	_welcomeMessage = format["Welcome to Ultima's Universe %1, Enjoy your stay!",format["%1", name player]];
	_camDistance = 100;
	waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
	//intro song
	//playsound "introSong"; 
	//intro move
	showCinemaBorder true;
	camUseNVG false;
	_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+_camDistance];
	_camera cameraEffect ["internal","back"];
	_camera camSetFOV 2.000;
	_camera camCommit 0;
	waitUntil {camCommitted _camera};
	_camera camSetTarget vehicle player;
	_camera camSetRelPos [0,0,2];
	_camera camCommit 8;
	cutText [_welcomeMessage, "PLAIN DOWN"];
	waitUntil {camCommitted _camera};
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;