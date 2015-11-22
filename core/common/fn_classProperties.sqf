private ["_config","_output","_props"];

_config = _this;
_output = [];

if (!isClass _config) exitWith {};

{
	_output pushBack [(configName _x), (_x call BIS_fnc_getCfgData)];
} forEach (configProperties [_config]);

_output