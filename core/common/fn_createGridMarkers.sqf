/*
	Author: Kingsley
	Description: Generate square grid markers around a center and radius.
	Arguments:
		0: ARRAY - position object
		1: SCALAR - radius
	Example: [ (getPos player), 500 ] call f_fnc_createGridMarkers;
*/

private ["_center","_radius"];

_center = _this select 0;
_radius = _this select 1;
