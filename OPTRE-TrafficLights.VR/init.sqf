CAP_TrafficLights = true;
CAP_i = 0;
[] spawn {
	while {CAP_TrafficLights} do {
		CAP_i = CAP_i + 1;

		TrafficControl sideChat format["Traffic Lights Loop Started! At: %1",date];
		Sleep 5;

		_intersection = "A";
		_mainLights = [light_1];
		_sideLights = [light_2];

		if (CAP_i == 1) then {
			{
				hideObjectGlobal  _x;
			} forEach _mainLights + _sideLights;
		};

			_phase = 1;

				_light = "Main";
				_colour = "Green";
				{
					Aphase1Main = createVehicle ["Land_OPTRE_Traffic_light_double_p1", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase1Main setDir (getdir _x);
			        Aphase1Main setPosATL (getPosATL _x);
			        Aphase1Main enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        if (CAP_i > 1) then {
			        	deleteVehicle Aphase4Main;
			    	};
				} forEach _mainLights;

				_light = "Side";
				_colour = "Red";
				{
					Aphase1Side = createVehicle ["Land_OPTRE_Traffic_light_double_p2", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase1Side setDir (getdir _x);
			        Aphase1Side setPosATL (getPosATL _x);
			        Aphase1Side enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        if (CAP_i > 1) then {
			        	deleteVehicle Aphase4Side;
			    	};
				} forEach _sideLights;
				Sleep 15;

			_phase = 2;

				_light = "Main";
				_colour = "Amber";
				{
					Aphase2Main = createVehicle ["Land_OPTRE_Traffic_light_double_flash", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase2Main setDir (getdir _x);
			        Aphase2Main setPosATL (getPosATL _x);
			        Aphase2Main enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase1Main;
				} forEach _mainLights;

				_light = "Side";
				_colour = "Red";
				{
					Aphase2Side = createVehicle ["Land_OPTRE_Traffic_light_double_p2", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase2Side setDir (getdir _x);
			        Aphase2Side setPosATL (getPosATL _x);
			        Aphase2Side enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase1Side;
				} forEach _sideLights;
				Sleep 4;

			_phase = 3;

				_light = "Main";
				_colour = "Red";
				{
					Aphase3Main = createVehicle ["Land_OPTRE_Traffic_light_double_p2", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase3Main setDir (getdir _x);
			        Aphase3Main setPosATL (getPosATL _x);
			        Aphase3Main enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase2Main;
				} forEach _mainLights;

				_light = "Side";
				_colour = "Green";
				{
					Aphase3Side = createVehicle ["Land_OPTRE_Traffic_light_double_p1", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase3Side setDir (getdir _x);
			        Aphase3Side setPosATL (getPosATL _x);
			        Aphase3Side enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase2Side;
				} forEach _sideLights;
				Sleep 15;

			_phase = 4;

				_light = "Main";
				_colour = "Red";
				{
					Aphase4Main = createVehicle ["Land_OPTRE_Traffic_light_double_p2", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase4Main setDir (getdir _x);
			        Aphase4Main setPosATL (getPosATL _x);
			        Aphase4Main enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase3Main;
				} forEach _mainLights;

				_light = "Side";
				_colour = "Amber";
				{
					Aphase4Side = createVehicle ["Land_OPTRE_Traffic_light_double_flash", getPosATL _x, [], 0, "CAN_COLLIDE"];
			        Aphase4Side setDir (getdir _x);
			        Aphase4Side setPosATL (getPosATL _x);
			        Aphase4Side enableSimulationGlobal false;
			        TrafficControl sideChat format["Intersection %1, Phase %2, Light: %3, %4.",_intersection,_phase,_light,_colour];
			        deleteVehicle Aphase3Side;
				} forEach _sideLights;
				Sleep 4;
	};
};