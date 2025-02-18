private _state = 0; //0 = Idle, 1 = Drive
private _veh = dingo_respawn; //Vehicle Name
private _respawnMarker = ["respawn_west", "b_med", "Mobiler Respawn"]; //[Marker, MarkerType, MarkerText(Name)]

while {true} do {
	if(speed _veh == 0) then {
		if(_state == 1) then {
			_veh addAction ["Arsenal", "['Open', [true]] call BIS_fnc_arsenal;",nil,0,true,true,"","true",5, false,""];
			_state = 0;     //title, sricpt, arguments, priority, showWindow, hideOnUse, condtion, radius, unconscius, selection, memorypoint
		};

		//Check for Marker => Create one
		if(getMarkerColor "respawn_west" == "") then {		//isNil doesent work for Marker, idk
				_marker = createMarker [_respawnMarker # 0, _veh]; 
				_marker setMarkerType _respawnMarker # 1;
				_marker setMarkerText _respawnMarker # 2;
		};

		//Set marker Pos
		toString [_respawnMarker # 0] setmarkerPos getPos _veh;
		}
	else {	
			deleteMarker "respawn_west";
			//deleteMarker toString [_respawnMarker select 0]; -idk, idc
			removeAllActions _veh;
			_state = 1;
		};
	sleep 0.1;
}
