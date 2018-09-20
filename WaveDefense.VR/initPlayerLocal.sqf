[ 
	["VR SYSTEM","Welcome to Wave Defence! Contact your Instructor to get your Loadout!",0]
] spawn BIS_fnc_EXP_camp_playSubtitles;

if (CAP_WaitingWave) then {
	[ 
  		["VR SYSTEM","Waiting to start the Next Wave. Contact your Instructor!",0],
  		["VR SYSTEM","Waiting to start the Next Wave.. Contact your Instructor!",4],
  		["VR SYSTEM","Waiting to start the Next Wave... Contact your Instructor!",8]
	] spawn BIS_fnc_EXP_camp_playSubtitles;
};