#include "component.hpp"

deadPlayersBlu = [];
deadPlayersOpf = [];
deadPlayersInd = [];
newBluSpawns = [];
newOpfSpawns = [];
newIndSpawns = [];

if (isServer) then {
    [] call HT_fnc_setWaveSize;
    [] call HT_fnc_startWaveLoops;
    addMissionEventHandler ["HandleDisconnect", {[_this select 0,side (_this select 0)] call HT_fnc_removeFromWave}];
};

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_respawnCount",0];
    [] call HT_fnc_resetPlayerVars;
};
