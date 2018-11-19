[ 
	["<t color='#273c75'>VR SYSTEM","<t color='#487eb0'>Welcome to Wave Defence! Contact your Instructor to get your Loadout!",0]
] spawn BIS_fnc_EXP_camp_playSubtitles;

while {true} do {
	if (CAP_WaitingWave) then {
		[ 
	  		["<t color='#273c75'>VR SYSTEM","<t color='#487eb0'>Waiting to start the Next Wave. Contact your Instructor!",0],
	  		["<t color='#273c75'>VR SYSTEM","<t color='#487eb0'>Waiting to start the Next Wave.. Contact your Instructor!",4],
	  		["<t color='#273c75'>VR SYSTEM","<t color='#487eb0'>Waiting to start the Next Wave... Contact your Instructor!",8]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
	};
};


