{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    ollama
    pywal
    sassc
    python3Packages.material-color-utilities
    python3Packages.pywayland
  ];

  programs.ags = {
    enable = true;
    # configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir not working? somehow
    configDir = ./ags;

    extraPackages = with pkgs; [
      gtksourceview
      gtksourceview4
      ollama
      python3Packages.material-color-utilities
      python3Packages.pywayland
      pywal
      sassc
      webkitgtk
      webp-pixbuf-loader
      ydotool
    ];
  };
  # home.file =
  #   lib.mkMerge [
  #     {
  #       ".config/ags/config.js".source = ./ags/config.js;
  #       ".config/ags/imports.js".source = ./ags/imports.js;
  #       ".config/ags/style.css".source = ./ags/style.css;
  #       ".config/ags/assets".source = ./ags/assets;
  #       ".config/ags/data".source = ./ags/data;
  #       ".config/ags/lib".source = ./ags/lib;
  #       ".config/ags/scripts".source = ./ags/scripts;
  #     }
  #    {
  #       ".config/ags/scss".source = ./ags/scss;
  #       ".config/ags/services".source = ./ags/services;
  #       ".config/ags/widgets".source = ./ags/widgets;
  #     }
  #     ];
}
