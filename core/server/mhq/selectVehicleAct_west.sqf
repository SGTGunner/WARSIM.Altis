// Add this to init box of object: null = [this] execVM "config\mhq\selectVehicleAct.sqf";
private ["_obj"];
_obj = _this select 0;

_obj addAction ["Spawn QuadBike", "config\mhq\selectVehicle.sqf", "Quadbike"];
_obj addAction ["Spawn Marshall", "config\mhq\selectVehicle.sqf", "AMV-7 Marshall"];
_obj addAction ["Spawn Panther", "config\mhq\selectVehicle.sqf", "IFV-6c Panther"];
_obj addAction ["Spawn Slammer", "config\mhq\selectVehicle.sqf", "M2A1 Slammer"];