#include "\x\cba\addons\main\script_macros_mission.hpp"

if (hasInterface) then {
    _endMission = {
        _value = _this select 1;
        _value params ["_winningSide", "_endText"];

        [_winningSide,_endText] spawn {
            params ["_winningSide","_endText"];

            if (missionNamespace getVariable ["HT_DIFRENTENDING", false]) exitWith {INFO("A different ending is already in progress.")};
            HT_DIFRENTENDING = true;

            _winningText = switch (_winningSide) do {
                case "WEST": {"BLUFOR WINS"};
                case "EAST": {"OPFOR WINS"};
            };
            _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1<br/>%2</t>", _endText, _winningText];
            [_text,0,0,2,2] spawn BIS_fnc_dynamicText;

            _isVictory = if (_winningSide == (player getVariable ["originalSide", "UNKNOWN"])) then {true} else {false};
            [{["end1", _this select 0, true, true, true] spawn BIS_fnc_endMission}, [_isVictory], 5] call CBA_fnc_waitAndExecute;
        };
    };

    //dedicated
    if (!isServer) then {
        "HT_gameEnded" addPublicVariableEventHandler _endMission;
    };

    //localhost
    if (isServer) then {
        [{count (missionNamespace getVariable ["HT_gameEnded", []]) > 0}, {
            ["HT_gameEnded", HT_gameEnded] call (_this select 0);
        }, [_endMission]] call CBA_fnc_waitUntilAndExecute;
    };
};
