params ["_unit","_isUnconscious"];

if !(_isUnconscious) exitWith {};
if !(_unit getVariable ["HT_hasBriefcase",false]) exitWith {};

[_unit] remoteExec ["HT_fnc_dropBriefcase",2,false];
