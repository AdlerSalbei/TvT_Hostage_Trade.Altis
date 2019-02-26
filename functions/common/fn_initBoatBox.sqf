params ["_box","_type","_amount"];

_box setVariable ["HT_boatType",_type];
_box setVariable ["HT_boatsInBox",_amount];

[_box, true, 1] call ace_cargo_fnc_makeLoadable;

if (!hasInterface) exitWith {};

_onAction = {
    [_this select 0, _this select 1] remoteExec ["HT_fnc_unloadBoat",2,false];
};

_condition = {
    (_this select 0) getVariable ["HT_boatsInBox",0] > 0
};

_action = ["uo_spawnBoatAction", "Unload boat", "\A3\ui_f\data\igui\cfg\actions\unloadVehicle_ca.paa", _onAction, _condition] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
