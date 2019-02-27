#include "component.hpp"
private ["_overcast"];

if (!isServer) exitWith {};

//OVERCAST =====================================================================
//random
if (HT_WeatherSetting == -1) then {
    _availableSettings = getArray (missionConfigFile >> "Params" >> "WeatherSetting" >> "values");
    _availableSettings = _availableSettings - [-1];
    _overcast = selectRandom _availableSettings;

//fixed
} else {
    _overcast = HT_WeatherSetting;
};

[_overcast * 0.01] call bis_fnc_setOvercast;

//FOG ==========================================================================
_mid = 0.03;

//extra chance of fog when its raining
if (_overcast >= 75) then {
    _mid = _mid + 0.08;
};

//extra chance of fog in the morning
if (HT_TimeOfDay <= 8) then {
    _mid = _mid + 0.12;
};

_fog = random [0,_mid,0.4];
0 setFog _fog;
