//Define Player
_player = player;

//Setup requestor limit values
{
	[_requester, _x, 1] call BIS_fnc_limitSupport;
}forEach [
	"Artillery",
	"CAS_Heli",
	"CAS_Bombing",
	"Transport"
];
_limitSupport = 1;
_player setVariable ["CAP_limitSupport", (_player getVariable "CAP_limitSupport") + _limitSupport, TRUE];