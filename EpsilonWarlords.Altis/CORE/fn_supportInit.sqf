//Define Player
private _player = player;

//Create a side logic
private _center = createCenter sideLogic;

//Create a group for our modules
private _logicGroup = createGroup _center;

//Spawn a SupportRequestor module
private _requester = _logicGroup createUnit ["SupportRequester",getpos _player, [], 0, "FORM"];

//Setup requestor limit values
{
	[_requester, _x, 1] call BIS_fnc_limitSupport;
}forEach [
	"Artillery",
	"CAS_Heli",
	"CAS_Bombing",
	"Transport"
];
private _limitSupport = 1;
_player setVariable ["CAP_limitSupport", (_player getVariable "CAP_limitSupport") + _limitSupport, TRUE];

//Create a position 1km away from _player in random direction
private _pos = [_player, 1000, (floor (random 360))] call BIS_fnc_relPos;

///////

//Spawn a SupportProvider mosule of type Virtual_Drop
private _providerTransport = _logicGroup createUnit ["SupportProvider_Virtual_Transport", _pos, [], 0, "FORM"];

//Setup provider values
{
	_providerTransport setVariable [(_x select 0),(_x select 1)];
}forEach [
	["BIS_SUPP_vehicles",[]],		//types of vehicles to use
	["BIS_SUPP_vehicleinit",""],	//init code for vehicle
	["BIS_SUPP_filter","SIDE"]		//whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_player, _requester, _providerTransport] call BIS_fnc_addSupportLink;

///////

//Spawn a SupportProvider mosule of type Virtual_Artillery
private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

//Setup provider values
{
   _providerArty setVariable [(_x select 0),(_x select 1)];
}forEach [
   ["BIS_SUPP_vehicles",[]],        //types of vehicles to use
   ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_player, _requester, _providerArty] call BIS_fnc_addSupportLink;

///////

//Spawn a SupportProvider mosule of type Virtual_CAS_Bombing
private _providerCASBombing = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"];

//Setup provider values
{
   _providerCASBombing setVariable [(_x select 0),(_x select 1)];
}forEach [
   ["BIS_SUPP_vehicles",[]],        //types of vehicles to use
   ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_player, _requester, _providerCASBombing] call BIS_fnc_addSupportLink;

///////

//Spawn a SupportProvider mosule of type Virtual_CAS_Heli
private _providerCASHeli = _logicGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"];

//Setup provider values
{
   _providerCASHeli setVariable [(_x select 0),(_x select 1)];
}forEach [
   ["BIS_SUPP_vehicles",[]],        //types of vehicles to use
   ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_player, _requester, _providerCASHeli] call BIS_fnc_addSupportLink;

///////