//Spawn a SupportProvider mosule of type Virtual_Drop
private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport", _pos, [], 0, "FORM"];

//Setup provider values
{
	_providerTransport setVariable [(_x select 0),(_x select 1)];
}forEach [
	["BIS_SUPP_vehicles",["O_Heli_Transport_04_bench_F","B_Heli_Transport_01_F"]],		//types of vehicles to use
	// ["BIS_SUPP_vehicleinit",""],	//init code for vehicle
	["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_caller, _requester, _providerTransport] call BIS_fnc_addSupportLink;