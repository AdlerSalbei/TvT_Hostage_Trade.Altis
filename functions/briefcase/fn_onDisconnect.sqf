params [["_unit",objNull]];

if (_unit getVariable ["HT_hasBriefcase",false]) then {
    [_unit] call HT_fnc_dropBriefcase;
};

false
