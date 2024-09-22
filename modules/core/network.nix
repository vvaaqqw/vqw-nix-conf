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
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 443 59010 59011 7890];
      allowedUDPPorts = [59010 59011 7890];
      # allowedUDPPortRanges = [
      # { from = 4000; to = 4007; }
      # { from = 8000; to = 8010; }
      # ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    clash-verge
    clash-meta
  ];
}
