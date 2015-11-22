private ["_display","_unit"];

disableSerialization;

_display = _this select 0;
_unit = player;
_roleList = _display displayCtrl 1500;
_content = _display displayCtrl 2202;

_roles = (missionConfigFile >> "CfgWarsim" >> "roles" >> (toLower (str (side _unit)))) call f_fnc_itemsArrayFromConfig;

{
	/*
	[
		"item1",
		[
			["name","Medic"],
			["filename","file.html"],
			["minToursRequired",0],
			["allowedLoadouts",[1,2,5]]
		]
	]
	*/
	
	_index = _roleList lbAdd (_x select 1 select 0 select 1);
	_roleList lbSetData [_index, (_x select 0)];
} count _roles;

_content htmlLoad "config\roles\startup.html";
if (!ctrlHTMLLoaded _content) then {
	hint "Loading failed!";
};