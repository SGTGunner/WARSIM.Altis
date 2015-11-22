private ["_unit"];

_unit = _this;
_puid = getPlayerUID _unit;
_profileName = _unit getVariable ["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2_%3", _puid, (_profileName call iniDB_CRC32), (toUpper (str (side _unit)))];
_startXP = (missionConfigFile >> "CfgWarsim" >> "common" >> "startingXP") call BIS_fnc_getCfgData;

[_unit, "players", "id", _unitFileName] call s_fnc_dbWrite;
[_unit, "players", "position", ((getPos _unit) call f_fnc_positionToString)] call s_fnc_dbWrite;
[_unit, "players", "direction", (getDir _unit)] call s_fnc_dbWrite;
[_unit, "players", "loadout", ([_unit] call f_fnc_getLoadout)] call s_fnc_dbWrite;
[_unit, "players", "xp", _startXP] call s_fnc_dbWrite;

_unit setVariable ["PERS_ID", _unitFileName, true];
_unit setVariable ["PERS_POSITION", ((getPos _unit) call f_fnc_positionToString), true];
_unit setVariable ["PERS_DIRECTION", (getDir _unit), true];
_unit setVariable ["PERS_LOADOUT", ([_unit] call f_fnc_getLoadout), true];
_unit setVariable ["PERS_XP", _startXP, true];