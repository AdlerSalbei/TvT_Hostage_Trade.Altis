_num = getNumber (missionConfigFile >> "CfgIslands" >> worldName >> "isWoodland");
switch (_num) do {
    case 0 : {HT_isWoodland = true;};
    case 1 : {HT_isWoodland = false;};
};
