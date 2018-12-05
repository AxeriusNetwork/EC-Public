//    this addAction ["Transport Helicopter",{[(_this # 2),400,"westTransport"] call CAP_fnc_SupportBuy;}];

///////

_caller = _this # 1;
_cost = _this # 3 # 0;
_support = _this # 3 # 1;

//Create a side logic
private _center = createCenter sideLogic;

//Create a group for our modules
private _logicGroup = createGroup _center;

private _pos = [0,0,0];

//Create position
if (side _caller isEqualTo west) then {
	_pos = (getpos westSupport);
};

if (side _caller isEqualTo east) then {
	_pos = (getpos eastSupport);
};

//Spawn a SupportRequestor module
private _requester = _logicGroup createUnit ["SupportRequester",_pos, [], 0, "FORM"];

///////

_caller setVariable ["BIS_WL_funds", (_caller getVariable "BIS_WL_funds") - _cost, TRUE];

///////

if (_support isEqualTo "westTransport") then {
	[_caller, "Transport", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Drop
	private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport",_pos, [], 0, "FORM"];

	//Setup provider values
	{
		_providerTransport setVariable [(_x select 0),(_x select 1)];
	}forEach [
		["BIS_SUPP_vehicles",["B_Heli_Transport_01_F"]],		//types of vehicles to use
		// ["BIS_SUPP_vehicleinit",""],	//init code for vehicle
		["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerTransport] call BIS_fnc_addSupportLink;

};

if (_support isEqualTo "westArtillery") then {
	[_caller, "Artillery", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Artillery
	private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerArty setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["B_MBT_01_arty_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerArty] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "westCAS_Bombing") then {
	[_caller, "CAS_Bombing", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Bombing
	private _providerCASBombing = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASBombing setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["B_Plane_CAS_01_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerCASBombing] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "westCAS_Heli") then {
	[_caller, "CAS_Heli", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Heli
	private _providerCASHeli = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASHeli setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["B_Heli_Attack_01_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerCASHeli] call BIS_fnc_addSupportLink;

};

/////// /////// ///////

if (_support isEqualTo "eastTransport") then {
	[_caller, "Transport", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Drop
	private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport", _pos, [], 0, "FORM"];

	//Setup provider values
	{
		_providerTransport setVariable [(_x select 0),(_x select 1)];
	}forEach [
		["BIS_SUPP_vehicles",["O_Heli_Transport_04_bench_F"]],		//types of vehicles to use
		// ["BIS_SUPP_vehicleinit",""],	//init code for vehicle
		["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerTransport] call BIS_fnc_addSupportLink;

};

if (_support isEqualTo "eastArtillery") then {
	[_caller, "Artillery", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_Artillery
	private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerArty setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["O_MBT_02_arty_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerArty] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "eastCAS_Bombing") then {
	[_caller, "CAS_Bombing", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Bombing
	private _providerCASBombing = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASBombing setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["O_Plane_CAS_02_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerCASBombing] call BIS_fnc_addSupportLink;
};

if (_support isEqualTo "eastCAS_Heli") then {
	[_caller, "CAS_Heli", 1] call BIS_fnc_limitSupport;

	//Spawn a SupportProvider mosule of type Virtual_CAS_Heli
	private _providerCASHeli = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"];

	//Setup provider values
	{
	   _providerCASHeli setVariable [(_x select 0),(_x select 1)];
	}forEach [
	   ["BIS_SUPP_vehicles",["O_Heli_Attack_02_dynamicLoadout_F"]],        //types of vehicles to use
	   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
	   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
	];

	//Sync the modules and the _caller together
	[_caller, _requester, _providerCASHeli] call BIS_fnc_addSupportLink;

};

///////

private _limitSupport = 1;
_caller setVariable ["CAP_limitSupport", (_caller getVariable "CAP_limitSupport") + _limitSupport, TRUE];