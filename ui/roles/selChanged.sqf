private ["_display","_unit"];

disableSerialization;

_display = findDisplay 2000;
_control = _this select 0;
_index = _this select 1;
_unit = player;
_content = _display displayCtrl 2202;
_loadoutList = _display displayCtrl 1501;
_chooseRoleBtn = _display displayCtrl 1602;

_item = _control lbData _index;
_roles = (missionConfigFile >> "CfgWarsim" >> "roles" >> (toLower (str (side _unit))) >> _item) call f_fnc_classProperties;

_loadouts = _roles select 3 select 1;
lbClear _loadoutList;
_loadoutList lbSetCurSel -1;

{
	_loadout = (missionConfigFile >> "CfgWarsim" >> "loadouts" >> (toLower (str (side _unit))) >> (format ["item%1", _x])) call f_fnc_classProperties;
	_index = _loadoutList lbAdd (_loadout select 0 select 1);
	_loadoutList lbSetData [_index, (_loadout select 1 select 1)];
} count _loadouts;

_content htmlLoad (_roles select 1 select 1);
if (!ctrlHTMLLoaded _content) then {
	hint "Loading failed!";
};

_unitXP = _unit getVariable ["XP", 0];
_roleXP = _roles select 2 select 1;
_diffXP = _roleXP - _unitXP;

if (_diffXP > 0) then {
	_chooseRoleBtn ctrlSetText (format ["%1 XP REQUIRED", _diffXP]);
	_chooseRoleBtn ctrlEnable false;
} else {
	_chooseRoleBtn ctrlSetText "CHOOSE ROLE";
	_chooseRoleBtn ctrlEnable true;
};