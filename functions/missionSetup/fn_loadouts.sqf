/*  Sets factions for grad-loadout
*
*/

#include "component.hpp"

private _loadoutBlufor = ["LOADOUT_BLUFOR", 0] call BIS_fnc_getParamValue;
private _lodaoutOpfor =  ["LOADOUT_OPFOR", 0] call BIS_fnc_getParamValue;

["BLU_F", grad_missionsettings_loadoutFactionBlu] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", grad_missionsettings_loadoutFactionOpf] call GRAD_Loadout_fnc_FactionSetLoadout;

GRAD_loadoutFactionSet = true;
