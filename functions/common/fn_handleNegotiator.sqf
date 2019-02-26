params ["_unit"];
[
    {(!isNil "HT_loadoutApplied") && (SETUPTIMEREMAINING == 0)},
    {
        _loadout = getUnitLoadout _unit;
        _loadout = ((_loadout select 5) set [0,"tf_rt1523g_big"]);
        _unit setUnitLoadout _loadout;
    },
    []
] call CBA_fnc_waitUntilAndExecute;
