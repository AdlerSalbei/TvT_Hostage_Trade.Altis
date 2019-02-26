_side = side player;

//switch (_side) do {
//      case WEST : {
            _markerstr = createMarkerLocal ["BLUFOR SPAWN", HT_bluforSpawn];
            _markerstr setMarkerShapeLocal"ICON";
            _markerstr setMarkerTypeLocal "hd_flag";
            _markerstr setMarkerColorLocal "ColorWEST";
//      };
//      case EAST : {
            _markerstr = createMarkerLocal ["OPFOR SPAWN", HT_opforSpawn];
            _markerstr setMarkerShapeLocal "ICON";
            _markerstr setMarkerTypeLocal "hd_flag";
            _markerstr setMarkerColorLocal "ColorEAST";
//      };
//};
