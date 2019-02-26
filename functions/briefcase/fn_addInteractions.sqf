params ["_briefcase"];

private _actionPick = ["HT_pickup","Pick up","",{

    params ["_briefcase","_caller"];
    [_briefcase, _caller] remoteExec ["HT_fnc_attachBriefcase",2,false];

},{isNull ((_this select 0) getVariable ["HT_owner",objNull])},{},[],[0,0,0],2] call ace_interact_menu_fnc_createAction;
[_briefcase,0,["ACE_MainActions"],_actionPick] call ace_interact_menu_fnc_addActionToObject;

_actionDrop = ["HT_drop","Drop Briefcase","",{
    params ["_caller"];

    [_caller] remoteExec ["HT_fnc_dropBriefcase",2,false];

},{(_this select 0) getVariable ["HT_hasBriefcase",false]}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions"],_actionDrop,true] call ace_interact_menu_fnc_addActionToClass;

_actionGive = ["HT_give","Give Briefcase","",{
    params ["_unit","_caller"];

    [_unit] remoteExec ["HT_fnc_attachBriefcase",2,false];

},{(_this select 1) getVariable ["HT_hasBriefcase",false] && {isPlayer (_this select 0)} && {alive (_this select 0)}}] call ace_interact_menu_fnc_createAction;
["CAManBase",0,["ACE_MainActions"],_actionGive,true] call ace_interact_menu_fnc_addActionToClass;

private _actionCheck = ["HT_check","Check Briefcase","",{

    params ["_briefcase","_caller"];
    [_briefcase,_caller] call HT_fnc_checkBriefcase;

},{isNull ((_this select 0) getVariable ["HT_owner",objNull])},{},[],[0,0,0],2] call ace_interact_menu_fnc_createAction;
[_briefcase,0,["ACE_MainActions"],_actionCheck] call ace_interact_menu_fnc_addActionToObject;

[_briefcase, 1] call ace_cargo_fnc_setSize;
