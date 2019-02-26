if (!isServer) exitWith {};

_vehicle = "";
_faction = "";
_factions = HT_FACTIONS select HT_OpforFaction;

if (HT_isWoodland) then {
    _faction = _factions select 0;
}else{
    _faction = _factions select 1;
};

["OPF_F", _faction] call GRAD_Loadout_fnc_FactionSetLoadout;

_searchDistance = 50;
_spawns = [HT_bluforSpawn, ["rhs_2P3_1", "RoadCone_L_F"], HT_SpawnDistance, _searchDistance] call HT_fnc_findSpawnPos;
HT_opforSpawn = getPos(_spawns select 2);
_base = getPos(_spawns select 1);
respawn_east setPos _base;

_set = _faction;
if ((_set find "_d") >= 1 || (_set find "_w") >= 1) then {
    _split = _set splitString "_";
    _split deleteAt ((count _split)-1);
    _set = _split joinString "_";
};

[(_spawns select 1),_set,_base,(_spawns select 2),"Buymenu"] call grad_lbm_fnc_addInteraction;

_playerCount = count allPlayers;
_hostageGroup = createGroup Civilian;

for "_i" from 1 to (ceil (_playerCount/8)) do {
    _hostage = _hostageGroup createUnit ["C_man_p_beggar_F", HT_opforSpawn, [], 5, "NONE"];
    [_hostage, true] call ACE_captives_fnc_setHandcuffed;
    HT_HOSTAGES pushBack _hostage;
};
