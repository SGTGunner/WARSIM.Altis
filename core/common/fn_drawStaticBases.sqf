/*
	Author: Kingsley
	Description: Spawn the grid markers for the static bases
	Parameter(s): None
	Example: call f_fnc_drawStaticBases;
*/

{
	_pos = getMarkerPos (_x select 0);
	_radius = (missionConfigFile >> "CfgWarsim" >> "common" >> "startingBaseRadius") call BIS_fnc_getCfgData;
	[_pos, _radius, (_x select 1)] call f_fnc_createGridMarkers;
} forEach [
	["mrk_nato", "west"],
	["mrk_csat", "east"],
	["mrk_aaf", "guer"]
];
