params ["_unit"];

_type = typeOf _unit;
_side = side _unit;

_split = _type splitString "_";
_split deleteAt 0;
_type = _split joinString "_";

_allPlayers = [] call BIS_fnc_listPlayers;
_numberOfTeammates = switch (_side) do {
    case ("WEST"): {
        west countside _allPlayers;
    };
    case ("EAST"): {
        east countside _allPlayers;
    };
    case ("GUER"): {
        independent countside _allPlayers;
    };
    case ("CIV"): {
        civilian countside _allPlayers;
    };
    default {
        1
    };
};

_numberOfGroupMates = count (units (group _unit));

_money = 0;
switch (true) do {
    case (_unit getVariable "HT_isCommander") : {_money = 100000 + (500*_numberOfTeammates);};
    case (_type == "Soldier_SL_F") : {_money = 5000 + (500*_numberOfGroupMates);};
    case (_type == "Soldier_TL_F") : {_money = 1000 + (500*_numberOfGroupMates);};
    case (_type == "medic_F") : {_money = 1000 + (50*_numberOfGroupMates);};
    case (_type == "soldier_AR_F") : {_money = 1000;};
    case (_type == "soldier_AAR_F") : {_money = 1000;};
    case (_type == "Soldier_F") : {_money = 1000;};
};
[_unit, _money] call grad_moneymenu_fnc_setFunds;
