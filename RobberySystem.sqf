// fn_RobberySystemCountDown.sqf
sleep 0.01;

timer = 600;
publicvariable "timer";
 
waitUntil {!isnil "timer"};
 
while {(timer >= 0)} do {
	hintSilent parsetext format ["<t size=1.5' align='center'>%1</t>",(timer / 3600) call compile loadfile "\fn_RobberySystemTime.sqf"];
    timer = timer - 1;
    publicvariable "timer";
    sleep 1;
};

timer = 0;
 
ableToRob = true;
publicvariable "ableToRob";

// fn_RobberySystemTime.sqf
_playtime = _this;

_h = (_playtime-(_playtime % 1));
_m = ((_playtime % 1)*60)-((_playtime % 1)*60) % 1;
_s = (((_playtime % 1)*3600)-((_playtime % 1)*3600) % 1) - (_m*60);
_hh = "";
if (_h < 10) then {_hh = "0"};
_mm = "";
if (_m < 10) then {_mm = "0"};
_ss = "";
if (_s < 10) then {_ss = "0"};
_playtimeHMS = format ["%1%2:%3%4:%5%6",_hh,_h,_mm,_m,_ss,_s];
_playtimeHMS;

// holdAction for the Safe Object
while {ableToRob} do {
	[
		ARP_B1_safe,"<t color='#c0392b'>Rob Safe",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
		"_this distance _target < 3","_caller distance _target < 3",
		{ systemChat format["%1 started cracking safe.",_caller] },
		{ playSound "SafeCrackingSingle"; systemChat format["%1 is cracking safe. [%2/%3].",_caller,_progress,_maxProgress] },
		{ _this call ARP_fnc_robberySystemInit },
		{ systemChat format["%1 stopped cracking safe.",_caller] },
		[ _this select 0, _this select 1, _this select 2, _this select 3,],
		120,0,true,false
	] remoteExec ["BIS_fnc_holdActionAdd", 0, ARP_B1_safe];
};

// fn_RobberySystemInit
params ["_safe"."_robber","_action","_arguments"]

createDialog "ARP_Robbery";

// DialogRobSafe.hpp
class ARP_Robbery {
	idd = 666;
	movingEnabled - false;
	onLoad = "[] spawn {call ARP_fnc_robberySystem}";
	class controls {
		ARP_List : RscListBox {
			idc = 667
		};
		ARP_Text : RscText {
			idc = 668
		};
		ARP_Button : RscButton {
			idc = 669
		};
	};
};

// fn_RobberySystem
disableSerialization;

_display = findDisplay 666;

_list = _display displayCtrl 667;

_text = _display displayCtrl 668;

{
	_list lbAdd format["%1",name _x];
} forEach allPlayers - (entities "HeadlessClient_F")

_randomNumber = round(10000);

_text = lbAdd format["%1",_randomNumber];
