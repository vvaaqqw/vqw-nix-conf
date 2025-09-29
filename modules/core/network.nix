{
  config,
  pkgs,
  host,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1"];  #Cloudflare
    nftables.enable = true;
    firewall = {
      enable = true;
      # checkReversePath = "loose";#tunmode
      allowedTCPPorts = [22 53]; # libvirtd's dnsmasq 可能用到53端口
      allowedUDPPorts = [53];
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
  services.dnsmasq ={
    enable=false;# 系统级别的Dnsmasq会和libvirtd的冲突
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
    # clash-verge-rev # clash tauri gui #programs.clash-verge is recommanded
    mihomo
    dbip-country-lite # error: 'clash-geoip' has been removed. Consider using 'dbip-country-lite' instead.
    v2rayn # past lives couldn't ever hold me down
    xray
    sing-box
    sing-geoip
  ];
  programs.clash-verge={
    enable = true;
    # tunMode = true;
    # serviceMode = true;
  };
  # services.resolved.enable = true; #tunmode
}
