
///////

	westHQ addAction ["Close Air Support: Transport Helicopter",{
		[(_this # 2),400,"westTransport"] call CAP_fnc_SupportBuy;
	}];

	westHQ addAction ["Close Air Support: Artillery",{
		[(_this # 2),600,"westArtillery"] call CAP_fnc_SupportBuy;
	}];

	westHQ addAction ["Close Air Support: Plane Bombing",{
		[(_this # 2),1000,"westCAS_Bombing"] call CAP_fnc_SupportBuy;
	}];

	westHQ addAction ["Close Air Support: Helicopter Gun Run",{
		[(_this # 2),800,"westCAS_Heli"] call CAP_fnc_SupportBuy;
	}];

///////

	eastHQ addAction ["Close Air Support: Transport Helicopter",{
		[(_this # 2),400,"eastTransport"] call CAP_fnc_SupportBuy;
	}];

	eastHQ addAction ["Close Air Support: Artillery",{
		[(_this # 2),600,"eastArtillery"] call CAP_fnc_SupportBuy;
	}];

	eastHQ addAction ["Close Air Support: Plane Bombing",{
		[(_this # 2),1000,"eastCAS_Bombing"] call CAP_fnc_SupportBuy;
	}];

	eastHQ addAction ["Close Air Support: Helicopter Gun Run",{
		[(_this # 2),800,"eastCAS_Heli"] call CAP_fnc_SupportBuy;
	}];

///////