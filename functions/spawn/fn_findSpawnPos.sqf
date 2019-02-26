params ["_center","_items", "_spawnDistance", "_searchDistance"];

_result = [2,nil,nil];

_mapSizeArray = [] call HT_fnc_getMapSize;
_mapSizeArray params ["_mapSize", "_mapSizeKnown"];

_iterationNothing = 0;
_iterationOutside = 0;
_iterationSlope = 0;
_iterationSecondPos = 0;
_iterationTooClose = 0;

_found = false;

_testPos1 = [0,0,0];
_testPos2 = [0,0,0];

_startTime = time;

while {!_found} do {

	_found = true;

	if (time > (_startTime + 15)) then {
		_searchDistance = _searchDistance + 50;
		if (_spawnDistance > 0) then {_spawnDistance = _spawnDistance - 25;} else {_spawnDistance = 0;};
		diag_log format ["widening spawn radius by 25m (search up to: %1, distance min: %2)", _searchDistance, _spawnDistance];
	};


	// put something very big in there, just to be sure there is enough room
	_testPos1 = [_center,[_spawnDistance,_spawnDistance + 100], random 360,0,[2,_searchDistance],[_searchDistance,"rhsusf_CH53E_USMC"]] call SHK_pos;
	if (count _testPos1 < 1) then {
		_result = [1,nil,nil];
		_iterationNothing = _iterationNothing + 1;
		 _found = false;
	 } else {
	    // if map size is known and spawn position is outside map, result is 1
		if (!([_mapSize, _testPos1] call HT_fnc_insideMap) && _mapSizeKnown) then {
			_result = [1,nil,nil];
			_iterationOutside = _iterationOutside + 1;
			_found = false;
		} else {
			if ([_testPos1, 5] call HT_fnc_checkSlope > 0.4) then {_result = [1,nil,nil];
				_iterationSlope = _iterationSlope + 1;
				_found = false;
    		} else {
    			_testPos2 = [_testPos1,[20,60], random 360,0,[2,60], [_searchDistance,"rhsusf_CH53E_USMC"]] call SHK_pos;

    			if (count _testPos2 < 1) then {_result = [1,nil,nil];
    				_iterationSecondPos = _iterationSecondPos + 1;
    			  	_found = false;
    			} else {
    				if (_testPos1 distance _testPos2 < 10) then {
    					// deleteVehicle _testVehicle1;
    					_result = [1,nil,nil];
    					_iterationTooClose = _iterationTooClose + 1;
    					_found = false;
    				} else {
    					if ([_testPos2, 5] call HT_fnc_checkSlope > 0.4) then {
    						_result = [1,nil,nil];
    						_iterationSlope = _iterationSlope + 1;
    						_found = false;
    					};
    				};
    			};
    		};
		};
	};
	sleep 0.0001;
};

_vehicle1 = createVehicle [(_items select 0), _testPos1, [], 2, "CAN_COLLIDE"];
_vehicle2 = createVehicle [(_items select 1), _testPos2, [], 0, "CAN_COLLIDE"];

_result = [2, _vehicle1, _vehicle2];

diag_log format ["HT found spawn positions after %1 x nothing, %2 x outside map, %3 x too slopy, %4 x too close", _iterationNothing, _iterationOutside, _iterationSlope, _iterationSecondPos];

_result
