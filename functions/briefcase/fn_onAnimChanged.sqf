params ["_unit", "_newAnimation"];

if (_unit getVariable ["HT_hasBriefcase",false] && {_newAnimation == "ACE_AmovPercMstpSsurWnonDnon"}) then {
    [_unit] remoteExec ["HT_fnc_dropBriefcase",2,false];
};
