params ["_briefcase","_caller"];

if (isNil "_briefcase") exitWith {};

if (_briefcase in HT_SUITCASES) then {hint "Briefcase contains 100.000 Dollars worth in Gold.";};
if (_briefcase in HT_SUITCASES_FAKE) then {
    switch (side _caller) do {
        case WEST : {hint "Briefcase contains Nothing.";};
        case EAST : {
            _chance = random 100;
            if (_chance >= 70) then {
                hint "Briefcase contains Nothing.";
            }else{
                hint "Briefcase contains 100.000 Dollar worth in Gold.";
            };
        };
    };
};
