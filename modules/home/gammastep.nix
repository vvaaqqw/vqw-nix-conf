{
	  services.gammastep = {
	    enable = true;
	    provider = "manual";
			latitude = 30.7;
			longitude = 104.1;
			tray = true;
			temperature.day=5500;
			temperature.night=3700;
	    settings = {general.adjustment-method = "wayland";};
	  };
}
