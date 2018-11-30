waitUntil {!isNull player && player == player};

[ 
	["VR SYSTEM","<t color='#487eb0'>Welcome to Wave Defence! Contact your Instructor to get your Loadout!",0]
] spawn BIS_fnc_EXP_camp_playSubtitles;

// Explosions
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions1.wss", (getPos TrigNorth)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions2.wss", (getPos TrigSouth)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss", (getPos TrigEast)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions4.wss", (getPos TrigWest)];

// Firefight
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight1.wss", 	(getPos TrigNorth)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight2.wss", 	(getPos TrigSouth)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight3.wss", 	(getPos TrigEast)];
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss", 	(getPos TrigWest)];