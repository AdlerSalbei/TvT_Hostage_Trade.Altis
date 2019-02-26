if (!isServer) exitWith {};
//Parameters
HT_WeatherSetting 		= "WeatherSetting" 		call BIS_fnc_getParamValue;
HT_TimeOfDay 			= "TimeOfDay" 			call BIS_fnc_getParamValue;
HT_SetupTime 			= "SetupTime" 			call BIS_fnc_getParamValue;
HT_playTime             = "PlayTime" 			call BIS_fnc_getParamValue;
HT_SpawnDistance        = "SpawnDistance"		call BIS_fnc_getParamValue;
HT_BluforFaction        = "BluforFaction"       call BIS_fnc_getParamValue;
HT_OpforFaction         = "OpforFaction"        call BIS_fnc_getParamValue;

publicVariable "HT_SetupTime";
publicVariable "HT_BluforFaction ";
publicVariable "HT_OpforFaction";

//Public Vars
HT_DIFRENTENDING = false;
HT_SUITCASES = [];
HT_SUITCASES_FAKE = [];
HT_HOSTAGES = [];
HT_FACTIONS = [["pmc", "pmc"], ["rebells", "rebells"]];
HT_hostageAtBlufor = [];

publicVariable "HT_DIFRENTENDING";
call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

//Setup
[] call HT_fnc_setWeather;
[] call HT_fnc_setTime;
[] call HT_fnc_isWoodland;
[] call HT_fnc_bluforSpawn;
[] call HT_fnc_opforSpawn;
[] call HT_fnc_setupTimer;
[] call HT_fnc_triggerController;
