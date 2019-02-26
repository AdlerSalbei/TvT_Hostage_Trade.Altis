/*    handles player respawn
*
*     executed locally when player dies
*/

#include "component.hpp"

if (player getVariable ["wr_interrupted", false]) exitWith {};

[] call HT_fnc_resetPlayerVars;

//check JIP player is spawning for the first time
_joinTime = player getVariable ["joinTime", 0];
if (serverTime - _joinTime < 30 && didJIP) exitWith {INFO("Player is JIP. Exiting onPlayerKilled.")};

["Terminate"] call BIS_fnc_EGSpectator;
["Initialize", [player, [playerside], false, false, false, true, true, true, true, true]] call BIS_fnc_EGSpectator;

private _maxRespawns = switch (playerSide) do {
    case (WEST): {[missionConfigFile >> "missionsettings","bluforWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    case (EAST): {[missionConfigFile >> "missionsettings","opforWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    case (INDEPENDENT): {[missionConfigFile >> "missionsettings","indepWaveLifes",9999] call BIS_fnc_returnConfigEntry};
    default {9999};
};
if (player getVariable ["wr_respawnCount",0] >= _maxRespawns) then {player setVariable ["wr_interrupted",true]};

INFO("Starting waverespawn procedure...");
player setVariable ["wr_timeOfDeath",CBA_missionTime];
player setVariable ["wr_respawnCount",(player getVariable ["wr_respawnCount",0]) + 1];

setPlayerRespawnTime 99999;

//do the steps
[CBA_missionTime] call HT_fnc_playerCountdown;
[{player getVariable "wr_playerCountdownDone"}, {_this call HT_fnc_waveCountdown}, [CBA_missionTime]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call HT_fnc_prepareRespawn}, []] call CBA_fnc_waitUntilAndExecute;
