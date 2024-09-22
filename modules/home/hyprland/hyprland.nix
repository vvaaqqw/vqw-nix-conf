{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # swww
    swaybg
    # pyprland
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hdrop
    hyprpicker
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    wayland
    direnv
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    xwayland = {
      enable = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
