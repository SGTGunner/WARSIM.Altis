private ["_unit"];

_unit = _this;

_id = [_unit, "players", "id", "STRING"] call s_fnc_dbRead;
_position = [_unit, "players", "position", "STRING"] call s_fnc_dbRead;
_direction = [_unit, "players", "direction", "SCALAR"] call s_fnc_dbRead;
_loadout = [_unit, "players", "loadout", "ARRAY"] call s_fnc_dbRead;
_xp = [_unit, "players", "xp", "SCALAR"] call s_fnc_dbRead;

_unit setVariable ["PERS_ID", _id, true];
_unit setVariable ["PERS_POSITION", _position, true];
_unit setVariable ["PERS_DIRECTION", _direction, true];
_unit setVariable ["PERS_LOADOUT", _loadout, true];
_unit setVariable ["PERS_XP", _xp, true];

[_unit, _loadout] call f_fnc_setLoadout;
_unit setPos (call compile _position);
_unit setDir _direction;
