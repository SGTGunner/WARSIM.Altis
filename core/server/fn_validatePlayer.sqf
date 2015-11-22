private ["_unit"];

_unit = _this;

_checkID = [_unit, "players", "id", "STRING"] call s_fnc_dbRead;

if (isNil "_checkID") then {
	// Player record doesn't exist, proceed to create new one
	_unit call s_fnc_createPlayer;
} else {
	if (_checkID == "") then {
		// Player record doesn't exist, proceed to create new one
		_unit call s_fnc_createPlayer;
	} else {
		// Player record exists, proceed to load it
		_unit call s_fnc_loadPlayer;
	};
};