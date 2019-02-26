params [["_briefcase",objNull],["_unit",objNull],["_vehicleMode",false]];

if (isNull _unit) exitWith {};
if (isNull _briefcase) exitWith {};
if (_unit getVariable ["HT_hasBriefcase",false]) exitWith {hint "You are allready carring a suitcase!"};

private _prevOwner = _briefcase getVariable ["HT_owner",objNull];
if (!isNull _prevOwner) then {
    _prevOwner setVariable ["HT_hasBriefcase",false,true];
    [_prevOwner,true] remoteExec ["allowSprint",_unit,false];
};

if (_vehicleMode) then {
    _briefcase attachTo [vehicle _unit,[0,0,-100]];
} else {
    _briefcase attachTo [_unit,[-0.03,-0.06,-0.19],"RightHand"];
};
_briefcase setVectorDirAndUp [[1,0,0],[0,0,1]];

[_unit,false] remoteExec ["allowSprint",_unit,false];
_unit setVariable ["HT_hasBriefcase",true,true];
_briefcase setVariable ["HT_owner",_unit,true];

if (currentWeapon _unit != "") then {
    [_unit,["SwitchWeapon",_unit,_unit,99]] remoteExec ["action",_unit,false];
};
