#include "component.hpp"
params ["_from", "_to"];

private _roleFrom = _from getVariable [QGVAR(role), "RIFLEMAN"];
private _loadoutFrom = getUnitLoadout _from;
private _specialVarsFrom = switch (_roleFrom) do {
    case "ASSULTER" : {
        private _return = [];

        _return pushBack (_from getVariable [QGVAR(),""]);

        _return
    };
};

private _roleTo = _to getVariable [QGVAR(role), "RIFLEMAN"];
private _loadoutTo = getUnitLoadout _to;
private _specialVarsTo = switch (_roleTo) do {
    case "ASSULTER" : {
        private _return = [];

        _return pushBack [QGVAR(), (_to getVariable [QGVAR(),""])];
        _return setVariable [QGVAR(), nil, true];

        _return
    };
};

_from setVariable [QGVAR(role), _roleTo, true];
_from setUnitLoadout _loadoutTo;
{
    _from setVariable [_x select 0, _x select 1, true];
}forEach _specialVarsTo;

_to setVariable [QGVAR(role), _roleFrom, true];
_to setUnitLoadout _loadoutFrom;
{
    _to setVariable [_x select 0, _x select 1, true];
}forEach _specialVarsFrom;
