{
  config,
  pkgs,
  host,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
      allowedUDPPorts = [];
      #allowedTCPPorts = [22 80 443 59010 59011 7890];
      #allowedUDPPorts = [59010 59011 7890];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };

  # mihomo formerly known as clash-meta
  services.mihomo = {
    enable = false;
    tunMode = true; #Whether to enable necessary permission for Mihomo’s systemd service for TUN mode to function properly.Keep in mind, that you still need to enable TUN mode manually in Mihomo’s configuration .

    #configFile = "/path/to/config.yaml";

    #...
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    clash-nyanpasu # clash tauri gui
    clash-verge-rev # clash tauri gui
    mihomo
    dbip-country-lite # error: 'clash-geoip' has been removed. Consider using 'dbip-country-lite' instead.
  ];
}
