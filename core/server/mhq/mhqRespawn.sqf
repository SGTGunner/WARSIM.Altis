private ["_marker", "_veh"];
_veh = _this select 0; 
while {true} do { 
    if (alive _veh) then { 
        _marker = createMarker ["respawn_west", position _veh]; 
        "respawn_west" setMarkerPos position _veh;
        hint format ["%1",  getPosATL _veh];
    }; 
    if (!alive _veh) exitWith { 
        "respawn_west" setMarkerPos getMarkerPos "respawn_base"; 
    }; 
    sleep 0.5; 
};