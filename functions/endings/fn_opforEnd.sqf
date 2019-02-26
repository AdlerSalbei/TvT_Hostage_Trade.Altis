_trg = createTrigger ["EmptyDetector", _base];
_trg setTriggerArea [100, 100, 0, false];
_trg setTriggerActivation ["STATIC", "PRESENT", false];
_trg setTriggerStatements [
  "this",
  "{
      private _suitcases = 0;
      private _fake = 0;
      {
          if ((typeOf _x) == 'Land_Suitcase_F') then {
              if (_x in HT_SUITCASES) then {
                  _suitcases +1;
              }else{
                 _fake +1;
              };
          };
      }forEach thisList;
      if ((_suitcases + _fake) >= 1) then {
          _text = format ['You successfully brought back %1 suitcases, of which %3 were fake and %2 contained gold!', (_suitcases + _fake), _suitcases, _fake];
          missionNamespace setVariable ['HT_gameEnded', ['EAST', _text], true];
      };
  ",
  ""
];
