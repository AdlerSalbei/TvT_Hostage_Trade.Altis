#include "component.hpp"

_allPlayers = [] call BIS_fnc_listPlayers;
_teamSize = west countside _allPlayers;
BLUFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;

_teamSize = independent countside _allPlayers;
INDEPWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;

_teamSize = east countside _allPlayers;
OPFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE;
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE;
WAVERESPAWNPLAYERSLEFTIND = INDEPWAVESIZE;

publicVariable "BLUFORWAVESIZE";
publicVariable "OPFORWAVESIZE";
publicVariable "INDEPWAVESIZE";
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
publicVariable "WAVERESPAWNPLAYERSLEFTIND";

INFO_1("Blufor wave size is %1", BLUFORWAVESIZE);
INFO_1("Independent wave size is %1", INDEPWAVESIZE);
INFO_1("Opfor wave size is %1", OPFORWAVESIZE);
