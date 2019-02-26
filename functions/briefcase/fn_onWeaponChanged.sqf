params ["_unit","_weapon"];

if !(_unit getVariable ["HT_hasBriefcase",false]) exitWith {};

if !(_weapon in ["","ACE_FakePrimaryWeapon"]) then {
    [_unit] remoteExec ["HT_fnc_dropBriefcase",2,false];
};
