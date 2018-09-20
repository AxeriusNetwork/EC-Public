CAP_fnc_removeAll = {
	
	removeAllWeapons _this;
	removeAllItems _this;
	removeAllAssignedItems _this;
	removeUniform _this;
	removeVest _this;
	removeBackpack _this;
	removeHeadgear _this;
	removeGoggles _this;
};

CAP_fnc_RIFLE_East = {

	_this forceAddUniform "U_O_Protagonist_VR";
	for "_i" from 1 to 3 do {_this addItemToUniform "30Rnd_762x39_Mag_Tracer_F";};
	_this addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 4 do {_this addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 16 do {_this addItemToBackpack "30Rnd_762x39_Mag_Tracer_F";};
	for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShellRed";};
	_this addHeadgear "H_HelmetSpecO_blk";_this addGoggles "G_Goggles_VR";
	_this addWeapon "arifle_AK12_F";_this addPrimaryWeaponItem "acc_flashlight";
};

CAP_fnc_RIFLE_West = {

	_this forceAddUniform "U_B_Protagonist_VR";
	for "_i" from 1 to 3 do {_this addItemToUniform "30Rnd_762x39_Mag_Tracer_F";};
	_this addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 4 do {_this addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 16 do {_this addItemToBackpack "30Rnd_762x39_Mag_Tracer_F";};
	for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShellRed";};
	_this addHeadgear "H_PilotHelmetHeli_B";_this addGoggles "G_Goggles_VR";
	_this addWeapon "arifle_AK12_F";_this addPrimaryWeaponItem "acc_flashlight";
};

CAP_fnc_UGL_East = {

	_this forceAddUniform "U_O_Protagonist_VR";
	for "_i" from 1 to 3 do {_this addItemToUniform "30Rnd_762x39_Mag_Tracer_F";};
	for "_i" from 1 to 2 do {_this addItemToUniform "SmokeShellRed";};
	_this addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 4 do {_this addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShellRed";};
	for "_i" from 1 to 9 do {_this addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 9 do {_this addItemToBackpack "30Rnd_762x39_Mag_Tracer_F";};
	_this addHeadgear "H_HelmetSpecO_blk";_this addGoggles "G_Goggles_VR";
	_this addWeapon "arifle_AK12_GL_F";_this addPrimaryWeaponItem "acc_flashlight";
};

CAP_fnc_UGL_West = {

	_this forceAddUniform "U_B_Protagonist_VR";
	for "_i" from 1 to 3 do {_this addItemToUniform "30Rnd_762x39_Mag_Tracer_F";};
	for "_i" from 1 to 2 do {_this addItemToUniform "SmokeShellRed";};
	_this addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 4 do {_this addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 2 do {_this addItemToBackpack "SmokeShellRed";};
	for "_i" from 1 to 9 do {_this addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 9 do {_this addItemToBackpack "30Rnd_762x39_Mag_Tracer_F";};
	_this addHeadgear "H_PilotHelmetHeli_B";_this addGoggles "G_Goggles_VR";
	_this addWeapon "arifle_AK12_GL_F";_this addPrimaryWeaponItem "acc_flashlight";
};

allUnits addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
		sleep 2.5;
	    deleteVehicle _unit;
}];

CAP_fnc_unitsSelect = {
	CAP_units = selectRandom [
		CAP_Squad_OPFOR,
		CAP_WeapSquad_OPFOR,
		CAP_Team_OPFOR,
		CAP_ReconTeam_OPFOR
	];
};

CAP_fnc_objectsSelect = {
	CAP_objects = selectRandom [
		spawnObj_0,
		spawnObj_1,
		spawnObj_2,
		spawnObj_3,
		spawnObj_4,
		spawnObj_5,
		spawnObj_6
	];
};

CAP_fnc_loadoutsSelect = {
	CAP_loadouts = selectRandom [
		"RIFLE",
		"UGL"
	];
};

InstructorGuy addAction ["- START WAVE -",{
	sleep 2.5;
	CAP_StartWave = true;
	playMusic "LeadTrack01_F_Bootcamp";
}];

InstructorGuy addAction ["-- Loadout: Rifleman -- ",{
	player call CAP_fnc_removeAll;
	player call CAP_fnc_RIFLE_West;
}];