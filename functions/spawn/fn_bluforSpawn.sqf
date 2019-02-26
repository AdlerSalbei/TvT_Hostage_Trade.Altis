if (!isServer) exitWith {};

_faction = "";
_factions = HT_FACTIONS select HT_BluforFaction;

if (HT_isWoodland) then {
    _faction = _factions select 0;
}else{
    _faction = _factions select 1;
};

["BLU_F", _faction] call GRAD_Loadout_fnc_FactionSetLoadout;

_randomPos = [];
for [{_i=0},{_i<1000},{_i=_i+1}] do {
    _searchPos = [random worldSize,random worldSize,0];
    if !(surfaceIsWater _searchPos) then {
        _randomPos = _searchPos findEmptyPosition [0,50];
    } else {
        _randomPos = [];
    };
    if (count _randomPos > 0) exitWith {};
};

if (count _randomPos == 0) then {
    diag_log "Keine gute Position gefunden";
}else{
    _searchDistance = 50;

    _spawns = [_randomPos, ["rhs_2P3_1", "RoadCone_L_F"], 1, _searchDistance] call HT_fnc_findSpawnPos;
    HT_bluforSpawn = getPos(_spawns select 2);
    _base = getPos(_spawns select 1);
    respawn_west setPos _base;

    _set = _faction;
    if ((_set find "_d") >= 1 || (_set find "_w") >= 1) then {
        _split = _set splitString "_";
        _split deleteAt ((count _split)-1);
        _set = _split joinString "_";
    };

    [(_spawns select 1),_set,_base,(_spawns select 2),"Buymenu"] call grad_lbm_fnc_addInteraction;
    _playerCount = count allPlayers;

    for "_i" from 1 to (ceil ((_playerCount/5))) do {
        _case = createVehicle ["Land_Suitcase_F", _base, [], 0, "NONE"];
        _case setVariable ["ace_cargo_canLoad", true, true];
        [_case, 1] call ace_cargo_fnc_setSize;
        [_case] call HT_fnc_addInteractions;
        HT_SUITCASES pushBack _case;
    };

    for "_i" from 1 to (ceil (_playerCount/8)) do {
        _case = createVehicle ["Land_Suitcase_F", _base, [], 0, "NONE"];
        _case setVariable ["ace_cargo_canLoad", true, true];
        [_case, 1] call ace_cargo_fnc_setSize;
        [_case] call HT_fnc_addInteractions;
        HT_SUITCASES_FAKE pushBack _case;
    };

    HT_bluforTrigger = createTrigger ["EmptyDetector", _base];
    HT_bluforTrigger setTriggerArea [50, 50, 0, false];
    HT_bluforTrigger setTriggerActivation ["CIV", "PRESENT", true];
    HT_bluforTrigger setTriggerStatements [
        "this",
        "{
            HT_hostageAtBlufor pushBackUnique _x;
        }forEach thisList;",
        ""
    ];
};
