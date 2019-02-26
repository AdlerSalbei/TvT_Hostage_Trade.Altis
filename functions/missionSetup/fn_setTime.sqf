if (!isServer) exitWith {};

//random
if (HT_TimeOfDay == -1) then {
    HT_TimeOfDay  = selectRandom [7,8,9,10,11,12,13,14,15,16,17,18];
};

_hour = if (HT_TimeOfDay  > 0) then {HT_TimeOfDay  - 1} else {23};
_minute = 60 - (round (HT_SetupTime/60));

_date = [2] call HT_fnc_findMaxMoonDate;
_date set [3,_hour];
_date set [4,_minute];
[_date] call bis_fnc_setDate;
