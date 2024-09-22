{
	  services.gammastep = {
	    enable = true;
	    provider = "geoclue2";
			tray = true;
			temperature.day=5500;
			temperature.night=3700;
	    settings = {general.adjustment-method = "wayland";};
	  };
}
