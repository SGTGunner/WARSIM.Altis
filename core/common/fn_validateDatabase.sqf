/*
	Author: Kingsley
	Description: Validates the database files and alerts if files are missing
	Parameter(s): Nothing
	Returns: True if all fine, false if not all files exist
	Example: _allFilesExist = call s_fnc_validateDatabase;
*/

if (!isServer) exitWith {};

private ["_database","_dbFiles","_filename","_filePath","_result"];

_database = (missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "database") call BIS_fnc_getCfgData;
_dbFiles = (missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "files") call f_fnc_itemsArrayFromConfig;
_result = true;

{
	_filename = (missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "files" >> (_x select 0) >> "filename") call BIS_fnc_getCfgData;
	_filePath = format ["%1\%2", _database, _filename];

	if ( !(_filePath call iniDB_exists) ) then {
		systemChat (format ["%1.ini does not exist", _filePath]);
		_result = false;
	};	
} count _dbFiles;

_result