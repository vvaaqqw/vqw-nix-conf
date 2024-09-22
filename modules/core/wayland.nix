{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  programs.hyprland.portalPackage=inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      # pkgs.xdg-desktop-portal-gtk #waybar failed to start when using this
    ];
  };

  environment.systemPackages = with pkgs; [
    xwaylandvideobridge
  ];
}
