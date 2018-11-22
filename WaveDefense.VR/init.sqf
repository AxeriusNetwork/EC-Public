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

if ((getPlayerUID player) == "_SP_PLAYER_") then {

	_players = [
		slot_1,slot_2,slot_3,
		slot_4,slot_5,slot_6
	];

	{
		if (playerSide == west) then {
			if (!isPlayer _x) then {
				_unit = _x;
				_unit call CAP_fnc_removeAll;
				if (_x == slot_1) then { _unit call CAP_fnc_RIFLE_West; };
				if (_x == slot_2) then { _unit call CAP_fnc_UGL_West; };
				if (_x == slot_3) then { _unit call CAP_fnc_RIFLE_West; };
				if (_x == slot_4) then { _unit call CAP_fnc_UGL_West; };
				if (_x == slot_5) then { _unit call CAP_fnc_RIFLE_West; };
				if (_x == slot_6) then { _unit call CAP_fnc_UGL_West; };
			};
		};

		if (playerSide == east) then {
			if (!isPlayer _x) then {
				_unit = _x;
				_unit call CAP_fnc_removeAll;
				if (_x == slot_1) then { _unit call CAP_fnc_RIFLE_East; };
				if (_x == slot_2) then { _unit call CAP_fnc_UGL_East; };
				if (_x == slot_3) then { _unit call CAP_fnc_RIFLE_East; };
				if (_x == slot_4) then { _unit call CAP_fnc_UGL_East; };
				if (_x == slot_5) then { _unit call CAP_fnc_RIFLE_East; };
				if (_x == slot_6) then { _unit call CAP_fnc_UGL_East; };
			};
		};
	} foreach _players;
};

[] spawn {
	while {true} do {
	  	{ 
			sleep 2.5;
			deleteVehicle _x;
		} foreach allDeadMen;
	};
};

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

InstructorGuy addAction ["<t color='#fbc531'>-- <t color='#9c88ff'>Loadout: <t color='#487eb0'>Rifleman <t color='#fbc531'>-- ",{
	_unit = (_this select 1);
	_unit call CAP_fnc_removeAll;
	_unit call CAP_fnc_RIFLE_West;
}];

InstructorGuy addAction ["<t color='#fbc531'>-- <t color='#9c88ff'>Loadout: <t color='#487eb0'>Rifleman UGL <t color='#fbc531'>-- ",{
	_unit = (_this select 1);
	_unit call CAP_fnc_removeAll;
	_unit call CAP_fnc_UGL_West;
}];

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
