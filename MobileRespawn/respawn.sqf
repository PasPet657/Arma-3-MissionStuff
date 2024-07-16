private _state = 0; //0 = Idle, 1 = Drive
private _veh = dingo_respawn;

while {true} do {
	hint str _state;
	if(speed _veh == 0) then {
		if(_state == 1) then {
			_veh addAction ["Arsenal", "['Open', [true]] call BIS_fnc_arsenal;",nil,0,true,true,"","true",5, false,""];
									//title, sricpt, arguments, priority, showWindow, hideOnUse, condtion, radius, unconscius, selection, memorypoint
			_state = 0;
		};

		//Check for Marker => Create one
		if(getMarkerColor "respawn_west" == "") then {		//isNil doesent work for Marker, idk
				_marker = createMarker ["respawn_west", _veh]; 
				_marker setMarkerType "b_med";
				_marker setMarkerText "Mobiler Respawn";
		};
		//Set marker Pos
		"respawn_west" setmarkerPos getpos _veh;
		}
	else {	deleteMarker "respawn_west";
			removeAllActions _veh;
			_state = 1;
	};
	//sleep 10;
}
