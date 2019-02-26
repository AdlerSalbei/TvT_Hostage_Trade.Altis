class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class I_G_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        price = 1000;
        stock = 10;
    };

    class CUP_I_SUV_ION {
        displayName = "SUV (unarmed)";
        description = "Seats: 7+6";
        price = 10000;
        stock = 10;
    };

/*
    class RHS_MELB_MH6M {
        displayName = "MH6M";
        description = "Seats: 2+6";
        code = "if (isServer) then {(_this select 2) disableTIEquipment true}";
        price = 11000;
        stock = 2;
    };
*/

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['HT_fnc_initBoatBox',0,true]}";
        price = 5000;
        stock = 10;
    };
};
