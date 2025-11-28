{pkgs,inputs,...}:
let
 inherit (inputs.niri-scratchpad-flake.packages.${pkgs.stdenv.hostPlatform.system}) niri-scratchpad;
in
{
    imports =
    [(import ./variables.nix)]
    ++[(import ./systemd.nix)];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    niri-scratchpad
    swaybg
    hyprpicker # color picker
    hypridle
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    direnv
    wayland
    xwayland-satellite # xwayland support
  ];
}
