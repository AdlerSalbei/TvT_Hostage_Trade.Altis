if (isServer) then {
    addMissionEventHandler ["HandleDisconnect",HT_fnc_onDisconnect];
};

if (!hasInterface) exitWith {};

{
    if (local _x) then {
        _x addEventhandler ["GetInMan",HT_fnc_onGetIn];
        _x addEventhandler ["GetOutMan",HT_fnc_onGetOut];
        _x addEventhandler ["Killed",HT_fnc_onKilled];
        _x addEventhandler ["AnimChanged",HT_fnc_onAnimChanged];
    };
} forEach allUnits;

["weapon",HT_fnc_onWeaponChanged] call CBA_fnc_addPlayerEventHandler;
["ace_unconscious",HT_fnc_onUnconscious] call CBA_fnc_addEventHandler;
