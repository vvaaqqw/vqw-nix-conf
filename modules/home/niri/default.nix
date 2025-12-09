{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.niri-scratchpad-flake.packages.${pkgs.stdenv.hostPlatform.system}) niri-scratchpad;
in {
  imports =
    [(import ./variables.nix)]
    ++ [(import ./greetd.nix)]
    ++ [(import ./systemd.nix)];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    niri-scratchpad
    alacritty # the default terminal as a fallback
    fuzzel # the default app launcher as a fallback
    swaybg
    hyprpicker # color picker
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
