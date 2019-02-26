params ["_unit"];

if !(_unit getVariable ["HT_hasBriefcase",false]) exitWith {};

[_unit,true] remoteExec ["HT_fnc_attachBriefcase",2,false];
