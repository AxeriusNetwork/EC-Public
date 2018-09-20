CAP_Squad_OPFOR = [
	"O_Soldier_SL_F",
	"O_Soldier_F",
	"O_Soldier_LAT_F",
	"O_Soldier_M_F",
	"O_Soldier_TL_F",
	"O_Soldier_AR_F",
	"O_Soldier_A_F",
	"O_medic_F"
];

CAP_WeapSquad_OPFOR = [
	"O_Soldier_SL_F",
	"O_Soldier_AR_F",
	"O_Soldier_GL_F",
	"O_Soldier_M_F",
	"O_Soldier_AT_F",
	"O_Soldier_AAT_F",
	"O_Soldier_A_F",
	"O_medic_F"
];

CAP_Team_OPFOR = [
	"O_Soldier_TL_F",
	"O_Soldier_AR_F",
	"O_Soldier_GL_F",
	"O_Soldier_LAT_F"
];

CAP_ReconTeam_OPFOR = [
	"O_recon_TL_F",
	"O_recon_M_F",
	"O_recon_medic_F",
	"O_recon_F"
];

if (playerSide isEqualTo east) then {CAP_UnitGroup = createGroup west;};

if (playerSide isEqualTo west) then {CAP_UnitGroup = createGroup east;};

if (playerSide isEqualTo independent) then {CAP_UnitGroup = createGroup east;};

CAP_wavePerSession = 5;

if !(alive player) then {
	[ 
	  ["VR SYSTEM","You have failed Wave Defence! Better luck next time..",0] 
	] spawn BIS_fnc_EXP_camp_playSubtitles;
	sleep 4;
	endMission "loser";
};

for "_w" from 1 to CAP_wavePerSession do {

	CAP_TrigOpfor = false;
	CAP_StartWave = false;
	CAP_WaitingWave = true;
	call CAP_fnc_Dead;

	waitUntil {CAP_StartWave};

	[ 
	  ["VR SYSTEM","Wave Started! Good Luck",0]
	] spawn BIS_fnc_EXP_camp_playSubtitles;

	call CAP_fnc_unitsSelect;

	call CAP_fnc_objectsSelect;

	call CAP_fnc_loadoutsSelect;

	{
		CAP_unit = CAP_UnitGroup createUnit [_x, position CAP_objects, [], 0,"NONE"];
		private _handler = [CAP_unit,CAP_loadouts] execVM 'loadout\spawnedAI.sqf';
		waitUntil {scriptDone _handler};
	} forEach CAP_units;

	_wp = CAP_UnitGroup addWaypoint [position waypointObj, 0];
	CAP_Units = units CAP_UnitGroup;

	waitUntil {CAP_TrigOpfor};

};

[ 
  ["VR SYSTEM","You have completed Wave Defence, congratulations!",0]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep 4;
endMission "end1";