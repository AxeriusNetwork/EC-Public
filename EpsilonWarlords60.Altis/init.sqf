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

	[_target, ["B_Patrol_Soldier_TL_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_A_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_AR_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Medic_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Engineer_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_HeavyGunner_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_MG_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_M_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_AT_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["B_Patrol_Soldier_UAV_F",0,3] ] call BIS_fnc_addRespawnInventory;

_target = east;

	[_target, ["O_Soldier_TL_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_A_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_AR_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Medic_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Engineer_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_AR_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_AR_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_M_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_AT_F",0,3] ] call BIS_fnc_addRespawnInventory;
	[_target, ["O_Soldier_UAV_F",0,3] ] call BIS_fnc_addRespawnInventory;

///////

//    this addAction ["Transport Helicopter",{[(_this # 2),400,"westTransport"] call CAP_fnc_SupportBuy;}];

///////

// params ["player","_cost","_support"];

systemChat format["%1",player];
systemChat format["%1",_cost];
systemChat format["%1",_support];

_cost = 400;
_support = "westTransport";

//Create a side logic
private _center = createCenter sideLogic;

//Create a group for our modules
private _logicGroup = createGroup _center;

private _pos = [0,0,0];

//Create position
if ((side player) isEqualTo west) then {
	_pos = (getpos westSupport);
};

if ((side player) isEqualTo east) then {
	_pos = (getpos eastSupport);
};

//Spawn a SupportRequestor module
private _requester = _logicGroup createUnit ["SupportRequester",_pos, [], 0, "FORM"];

///////

player setVariable ["BIS_WL_funds", (player getVariable "BIS_WL_funds") - _cost, TRUE];
private _text = format["Removed: %1 CP",_cost];
[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;

///////

if (_support isEqualTo "westTransport") then {
	if (CAP_debug) then {
		private _text = format["Transport Created!"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};
	[player, "Transport", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Drop
	private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport",_pos, [], 0, "FORM"];

	if (CAP_debug) then {
		private _text = format["Spawn Module and Type defined"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};

	//Setup provider values
	{
		_providerTransport setVariable _x;
	}forEach [
		["BIS_SUPP_vehicles",["B_Heli_Transport_01_F"]],		//types of vehicles to use
		// ["BIS_SUPP_vehicleinit",""],	//init code for vehicle
		["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerTransport] call BIS_fnc_addSupportLink;
	if (CAP_debug) then {
		private _text = format["Modules and Caller Synced"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};
};

if (_support isEqualTo "westArtillery") then {
	if (CAP_debug) then {
		private _text = format["Artillery Created!"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};
	[player, "Artillery", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Artillery
	private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerArty setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["B_MBT_01_arty_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerArty] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "westCAS_Bombing") then {
	if (CAP_debug) then {
		private _text = format["CAS Bombing Created!"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};
	[player, "CAS_Bombing", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Bombing
	private _providerCASBombing = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASBombing setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["B_Plane_CAS_01_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerCASBombing] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "westCAS_Heli") then {
	if (CAP_debug) then {
		private _text = format["CAS Helicopter Created!"];
		[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
	};
	[player, "CAS_Heli", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Heli
	private _providerCASHeli = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASHeli setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["B_Heli_Attack_01_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerCASHeli] call BIS_fnc_addSupportLink;

};

/////// /////// ///////

if (_support isEqualTo "eastTransport") then {
	[player, "Transport", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Drop
	private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport", _pos, [], 0, "FORM"];

	//Setup provider values
	{
		_providerTransport setVariable _x;
	}forEach [
		["BIS_SUPP_vehicles",["O_Heli_Transport_04_bench_F"]],		//types of vehicles to use
		// ["BIS_SUPP_vehicleinit",""],	//init code for vehicle
		["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerTransport] call BIS_fnc_addSupportLink;

};

if (_support isEqualTo "eastArtillery") then {
	[player, "Artillery", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Artillery
	private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerArty setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["O_MBT_02_arty_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerArty] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "eastCAS_Bombing") then {
	[player, "CAS_Bombing", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Bombing
	private _providerCASBombing = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASBombing setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["O_Plane_CAS_02_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerCASBombing] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "eastCAS_Heli") then {
	[player, "CAS_Heli", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Heli
	private _providerCASHeli = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASHeli setVariable _x;
	}forEach [
	   ["BIS_SUPP_vehicles",["O_Heli_Attack_02_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the player together
	[player, _requester, _providerCASHeli] call BIS_fnc_addSupportLink;

};

///////

private _limitSupport = 1;
player setVariable ["CAP_limitSupport", (player getVariable "CAP_limitSupport") + _limitSupport, TRUE];

if (CAP_debug) then {
	private _text = format["Limit Support: %1",(player getVariable "CAP_limitSupport")];
	[_text,3,5,[1,0.8,1,1],true] call BIS_fnc_WLSmoothText;
};