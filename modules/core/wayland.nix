{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true; #https://search.nixos.org/options?channel=unstable&show=programs.hyprland.withUWSM&
  programs.hyprland.portalPackage=inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
    # flatpak needs it
    # yazi needs it
      pkgs.xdg-desktop-portal-gtk #waybar failed to start when using this
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.xwaylandvideobridge
  ];
}
