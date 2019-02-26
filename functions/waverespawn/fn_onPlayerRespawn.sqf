#include "component.hpp"

[profileName,playerSide] remoteExec ["HT_fnc_removeFromWave",2,false];

setPlayerRespawnTime 99999;

hint "";

[] call HT_fnc_resetPlayerVars;
