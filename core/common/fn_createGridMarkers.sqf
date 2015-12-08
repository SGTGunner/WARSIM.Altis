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
_gridSize = 50;

for "_i" from 1 to (_radius / _gridSize) do {
	_top = [_center select 0, (_center select 1) + _gridSize * _i];
	_bottom = [_center select 0, (_center select 1) - _gridSize * _i];
	_left = [(_center select 0) - _gridSize * _i, _center select 1];
	_right = [(_center select 0) + _gridSize * _i, _center select 1];

	{
		_px = floor ((_x select 0) / 100);
		_py = floor ((_x select 1) / 100);
		_name = format ["grid_%1_%2", _px, _py];

		createMarker[_name, [(_px * 100) + 50, (_py * 100) + 50, 0]];
		_name setMarkerShape "RECTANGLE";
		_name setMarkerSize [50,50];
		_name setMarkerColor "ColorBlue"; // Need correct colour
		_name setMarkerAlpha 1;
	} forEach [_top, _bottom, _left, _right];
};
