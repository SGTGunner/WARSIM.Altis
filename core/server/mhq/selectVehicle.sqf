// Add this to init box of object: null = [this] execVM "config\mhq\selectVehicleAct.sqf";
private ["_unit", "_vehType", "_veh"];
_unit = _this select 1;
_vehType = _this select 3;

sleep 0.001;
waitUntil {!isNull _unit};
waitUntil {alive _unit};


switch (_vehType) do {

    case "Quadbike": {
        _veh = "B_Quadbike_01_F" createVehicle (getMarkerPos "vspawn");
        cutText ["", "BLACK", 0.3];
        sleep 1;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        cutText ["", "BLACK IN", 5];
    };

    case "AMV-7 Marshall": {
        _veh = "B_APC_Wheeled_01_cannon_F" createVehicle (getMarkerPos "vspawn");
		[[[_veh],"config/mhq/mhqRespawn.sqf"], "BIS_fnc_execVM", false, true] spawn BIS_fnc_MP;
        cutText ["", "BLACK", 0.3];
        sleep 1;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        cutText ["", "BLACK IN", 5];
    };

    case "IFV-6c Panther": {
        _veh = "B_APC_Tracked_01_rcws_F" createVehicle (getMarkerPos "vspawn");
        cutText ["", "BLACK", 0.3];
        sleep 1;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        cutText ["", "BLACK IN", 5];
    };

    case "M2A1 Slammer": {
        _veh = "B_MBT_01_cannon_F" createVehicle (getMarkerPos "vspawn");
        cutText ["", "BLACK", 0.3];
        sleep 1;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        cutText ["", "BLACK IN", 5];
    };
};