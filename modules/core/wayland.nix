{
  inputs,
  pkgs,
  lib,
  host,
  ...
}: {
  programs.niri.enable = true;
  # programs.hyprland.enable = true;
  # programs.hyprland.portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  xdg.portal = {
    enable = true;
    wlr.enable = true; #Whether to enable desktop portal for wlroots-based desktops.
    #xdgOpenUsePortal = true; # I need to provide a portal
    extraPortals = [
      # flatpak needs it
      # yazi needs it
      pkgs.xdg-desktop-portal-gtk
      # niri needs it
      pkgs.xdg-desktop-portal-gnome
      pkgs.kdePackages.xdg-desktop-portal-kde # 部分 KDE 应用需要
    ];
  };

  # environment.systemPackages = with pkgs; [
  #   kdePackages.xwaylandvideobridge
  # ]; #gone 
}
