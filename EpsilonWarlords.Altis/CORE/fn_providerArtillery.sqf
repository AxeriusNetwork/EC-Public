//Spawn a SupportProvider mosule of type Virtual_Artillery
private _providerArty = _logicGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"];

//Setup provider values
{
   _providerArty setVariable [(_x select 0),(_x select 1)];
}forEach [
   ["BIS_SUPP_vehicles",["O_MBT_02_arty_F","B_MBT_01_arty_F"]],        //types of vehicles to use
   // ["BIS_SUPP_vehicleinit",""],    //init code for vehicle
   ["BIS_SUPP_filter","SIDE"]        //whether default vehicles comes from "SIDE" or "FACTION"
];

//Sync the modules and the _player together
[_caller, _requester, _providerArty] call BIS_fnc_addSupportLink;