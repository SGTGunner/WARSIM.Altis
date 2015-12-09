/*
	Author: Kingsley
	Description: Returns which side has control of given radius and position
	Parameter(s):
		0: ARRAY - position to start from
		1: SCALAR - radius to search for units
		2: BOOLEAN - Include air units (defaults to false)
	Returns: ARRAY in the format [side, count]
	Example: _winningSide = [ (getPos player), 50 ] call f_fnc_heldBy;
*/

private ["_pos","_radius","_air","_ret","_westCount","_eastCount","_guerCount","_typeList","_winner"];

_pos = param [0, (position player)];
_radius = param [1, 50];
_air = param [2, false];

_ret = objNull;
_westCount = 0;
_eastCount = 0;
_guerCount = 0;
_typeList = if (_air) then {["Man", "Car", "Motorcycle", "Tank", "Air"]} else {["Man", "Car", "Motorcycle", "Tank"]};

{
	if (alive _x) then {
		switch (side _x) do {
			case (west): { _westCount = _westCount + 1; };
			case (east): { _eastCount = _eastCount + 1; };
			case (resistance): { _guerCount = _guerCount + 1; };
		};
	};
} count (_pos nearEntities [_typeList, _radius]);

_winner = [_westCount, _eastCount, _guerCount] call BIS_fnc_greatestNum;

switch (_winner) do {
	case (_westCount): { _ret = WEST; };
	case (_eastCount): { _ret = EAST; };
	case (_guerCount): { _ret = RESISTANCE; };
};

[_ret, _winner]
