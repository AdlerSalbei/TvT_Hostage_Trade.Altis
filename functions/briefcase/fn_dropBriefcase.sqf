params ["_unit"];

hint format ["%1", (HT_SUITCASES + HT_SUITCASES_FAKE)];
private _briefcase = "";
{
    if (_unit == (_x getVariable ["HT_owner",objNull])) exitWith {_briefcase = _x;};
}forEach (HT_SUITCASES + HT_SUITCASES_FAKE);

if (count (str _briefcase) == 0) exitWith {};

detach _briefcase;
[_unit,true] remoteExec ["allowSprint",_unit,false];

private _offset = if !(isNull objectParent _unit) then {[3,0,0]} else {[2,0,0]};
_briefcase attachTo [_unit,_offset,""];
[{detach _this},_briefcase,0.5] call CBA_fnc_waitAndExecute;

_unit setVariable ["HT_hasBriefcase",false,true];
_briefcase setVariable ["HT_owner",objNull,true];
