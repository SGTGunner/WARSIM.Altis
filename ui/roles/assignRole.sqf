private ["_display","_unit"];

disableSerialization;

_display = findDisplay 2000;
_unit = player;
_roleList = _display displayCtrl 1500;
_loadoutList = _display displayCtrl 1501;
_chooseRoleBtn = _display displayCtrl 1602;

_roleIndex = lbCurSel _roleList;
_item = _roleList lbData _roleIndex;
_roles = (missionConfigFile >> "CfgWarsim" >> "roles" >> (toLower (str (side _unit))) >> _item) call f_fnc_classProperties;

_loadoutFile = "";
_loadoutIndex = lbCurSel _loadoutList;

if (_loadoutIndex != -1) then {
	_loadoutItem = _loadoutList lbData _loadoutIndex;
	_loadout = (missionConfigFile >> "CfgWarsim" >> "loadouts" >> (toLower (str (side _unit))) >> (format ["item%1", _loadoutItem])) call f_fnc_classProperties;
	_loadoutFile = (_loadout select 1 select 1);
} else {
	_loadoutFile = "";
};

_unitXP = _unit getVariable ["XP", 0];
_roleXP = _roles select 2 select 1;
_diffXP = _roleXP - _unitXP;

if (_diffXP <= 0) then {
	[_unit, _item, _loadoutFile] call f_fnc_assignRole;
};