// 0 = mapsize
// 1 = spawnpos
_maximumX = _this select 0;
_maximumY = _this select 0;
_positionX = (_this select 1) select 0;
_positionY = (_this select 1) select 1;
_resultInsideMap = true;

diag_log format ["MapsizeX: %1, MapsizeY: %2, PositionX: %3, PositionY: %4",_maximumX,_maximumY,_positionX,_positionY];

if (_positionX < 0 || _positionX > _maximumX) then {_resultInsideMap = false;};
if (_positionY < 0 || _positionY > _maximumY) then {_resultInsideMap = false;};

_resultInsideMap
