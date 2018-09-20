params ["_unit","_loadout"];

_unit call CAP_fnc_removeAll;

if (_loadout isEqualTo "RIFLE") then { _unit call CAP_fnc_RIFLE_East };

if (_loadout isEqualTo "UGL") then { _unit call CAP_fnc_UGL_East };