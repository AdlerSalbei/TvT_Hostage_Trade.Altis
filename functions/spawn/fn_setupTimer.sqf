#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

SETUPTIMEREMAINING = HT_SetupTime;
publicVariable "SETUPTIMEREMAINING";

INFO("Setup countdown starting...");
_countdown = {
    SETUPTIMEREMAINING = SETUPTIMEREMAINING - 1;
    publicVariable "SETUPTIMEREMAINING";
    if (SETUPTIMEREMAINING <= 0) then {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        [] call HT_fnc_timeTracker;
    };
};
[_countdown, 1, []] call CBA_fnc_addPerFrameHandler;
