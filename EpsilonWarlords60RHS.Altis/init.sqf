///////

enableSaving [FALSE, FALSE];
0 setFog [0.1, 0.12, 22];

if (isServer) then {
	10e10 setOvercast 0.5;
};


///////

[] call CAP_fnc_actionInit;

CAP_debug = true;

///////

_target = west;

	[_target, ["rhsusf_army_ucp_rifleman",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_autorifleman",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_grenadier",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_riflemanat",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_machinegunner",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_aa",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_javelin",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_rifleman_m590",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_medic",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_maaws",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_engineer",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_explosives",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_sniper",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_sniper_m107",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_sniper_m24sws",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhsusf_army_ucp_uav",0,3] ] call BIS_fnc_addRespawnInventory;

_target = east;

	[_target, ["rhs_msv_emr_rifleman",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_arifleman",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_grenadier",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_grenadier_rpg",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_machinegunner",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_aa",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_at",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_engineer",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_medic",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_msv_emr_marksman",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["rhs_vdv_marksman_asval",0,3] ] call BIS_fnc_addRespawnInventory;

///////



CAP_helipads = [
	hpad1,
	hpad2
];

for "_i" from 0 to 5 do {
	_randomPos = selectRandom CAP_helipads;
	_ammoPos = (getPosATL _randomPos);
	_ammo = createVehicle ["ACE_medicalSupplyCrate", _ammoPos, [], 0, "NONE"];
};