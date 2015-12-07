if (isServer || isDedicated) then {
	// Server Execution
	call compile preProcessFile (format ["\%1\init.sqf", ((missionConfigFile >> "CfgWarsim" >> "common" >> "server" >> "addon") call BIS_fnc_getCfgData)]);
	call f_fnc_validateDatabase;
};

// Client Execution
waitUntil {!isNull player};
waitUntil {time > 0};

player setVariable ["profileName", profileName, true];
player call f_fnc_validatePlayer;
player addAction ["Roles", {call f_fnc_showRoles}];
