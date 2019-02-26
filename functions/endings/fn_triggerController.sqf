[
    {((count HT_hostageAtBlufor) == (count HT_HOSTAGES))},
    {
        missionNamespace setVariable ["HT_gameEnded", ["WEST", "BLUFOR RESCUED ALL HOSTAGES!"], true];
    },
    []
] call CBA_fnc_waitUntilAndExecute;
