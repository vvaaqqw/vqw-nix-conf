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
    # wlr.enable = true; #Whether to enable desktop portal for wlroots-based desktops.
    #xdgOpenUsePortal = true; # I need to provide a portal
    extraPortals = [
      # flatpak needs it
      # yazi needs it
      pkgs.xdg-desktop-portal-gtk
      # niri needs it
      pkgs.xdg-desktop-portal-gnome
      pkgs.kdePackages.xdg-desktop-portal-kde # 部分 KDE 应用需要
    ];
      # 关键：指定 Niri 的 portal 加载顺序（避免 1.17+ 版本的警告）
    config = {
      common = {
        default = [ "gnome" "gtk" ];  # 先 gnome（Niri 专用），后 gtk
      };
      # Niri 特定配置（如果有多个环境）
      niri = {
        default = [ "gnome" "gtk" ];
      };
    };
    # 可选：如果有 Flatpak/Snap，额外加 configPackages
    configPackages = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk ];
  };

  # environment.systemPackages = with pkgs; [
  #   kdePackages.xwaylandvideobridge
  # ]; #gone 
}
