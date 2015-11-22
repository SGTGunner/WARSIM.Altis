private ["_unit","_roleItem"];

_unit = _this select 0;
_roleItem = _this select 1;

(missionConfigFile >> "CfgWarsim" >> "roles" >> (toLower (str (side _unit))) >> _roleItem) call f_fnc_classProperties