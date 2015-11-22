/*
	Author: Kingsley
	Description: Load data from the database
	Parameter(s):
		0: OBJECT - The player unit to use as the index
		1: STRING - The database class name (CfgWarsim >> common >> server >> files >> [this name])
		2: STRING - Return the value from this key
		3: STRING - Type of the data to return (SCALAR, STRING, ARRAY)
	Returns: Return value of parameter 2
	Example: [player, "players", "position", "STRING"] call s_fnc_dbRead;
*/

private ["_unit", "_file", "_key", "_type", "_puid", "_profileName", "_unitFileName", "_database", "_filename", "_filePath"];

_unit = _this select 0;
_file = _this select 1;
_key = _this select 2;
_type = _this select 3;
_puid = getPlayerUID _unit;
_result = "";

_profileName = _unit getVariable ["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2_%3", _puid, (_profileName call iniDB_CRC32), (toUpper (str (side _unit)))];

_database = (missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "database") call BIS_fnc_getCfgData;
_filename = (missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "files" >> _file >> "filename") call BIS_fnc_getCfgData;
_filePath = format ["%1\%2", _database, _filename];

_result = [_filePath, _unitFileName, _key, _type] call iniDB_read;

_result