{
  pkgs,
  config,
  ...
}: let
  monolisa = pkgs.callPackage ../../pkgs/monolisa/monolisa.nix {};
  monolisa-nerd = pkgs.callPackage ../../pkgs/monolisa/monolisa-nerd.nix {inherit monolisa;};
in {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    twemoji-color-font
    noto-fonts-emoji
    # monolisa
    # monolisa-nerd
  ];
  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = ["dark"];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      # name = "Bibata-Modern-Ice";
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      # package = pkgs.breeze-hacked-cursor-theme;
      size = 19;
    };
  };

  home.pointerCursor = {
    # name = "Bibata-Modern-Ice";
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    # package = pkgs.breeze-hacked-cursor-theme;
    size = 24;
  };
}
