private ["_config","_output","_props"];

_config = _this;
_output = [];

if (!isClass _config) exitWith {};

{
	_props = [];
	
	{
		_props pushBack [(configName _x), (_x call BIS_fnc_getCfgData)];
	} forEach (configProperties [_x]);
	
	_output pushBack [(configName _x), _props];
} forEach ("true" configClasses _config);

_output