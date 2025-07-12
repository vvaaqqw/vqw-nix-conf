{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # swww
    swaybg
    nwg-dock-hyprland
    # pyprland
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hdrop
    hyprpicker # color picker
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    wayland
    direnv
  ];

  #nwg-dock-hyprland
  home.file.".config/nwg-dock-hyprland/style.css".source = ./nwg-dock-hyprland/style-dark.css;
  # home.file.".config/nwg-dock-pinned".text = ''
  #nwg-dock-hyprland

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      # inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
    ];
    xwayland = {
      enable = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
