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

    class LOP_AM_Landrover {
        displayName = "Land Rover";
        description = "Seats: 7";
        code = "";
        price = 10000;
        stock = 10;
    };

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['HT_fnc_initBoatBox',0,true]}";
        price = 5000;
        stock = 10;
    };
};
