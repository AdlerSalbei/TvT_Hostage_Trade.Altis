if (HT_playTime == -1) exitWith {};

HT_countTime = 0;

[
    {
        params ["", "_handle"];
        HT_countTime = HT_countTime +1;

        if (HT_countTime == HT_playTime) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;

            missionNamespace setVariable ["HT_gameEnded", ["EAST", "BLUFOR ELIMINATED!"], true];
        };
        switch (HT_playTime - HT_countTime) do {
            case 30     : {["HT_notification",["HOSTAGE TRADE","00:30 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 60     : {["HT_notification",["HOSTAGE TRADE","01:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 120    : {["HT_notification",["HOSTAGE TRADE","02:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 180    : {["HT_notification",["HOSTAGE TRADE","03:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 240    : {["HT_notification",["HOSTAGE TRADE","04:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 300    : {["HT_notification",["HOSTAGE TRADE","05:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 600    : {["HT_notification",["HOSTAGE TRADE","10:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
            case 1200   : {["HT_notification",["HOSTAGE TRADE","20:00 minutes left in the round."]] remoteExec ["bis_fnc_showNotification",0,false];};
        };
    },
    1,
    []
] call CBA_fnc_addPerFrameHandler;
