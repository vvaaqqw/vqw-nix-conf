{ pkgs, ... }:
let
  gruvboxKvantum = pkgs.gruvbox-kvantum.override { variant = "Gruvbox-Dark-Green"; };
in
{
  home.packages = with pkgs; [
  kdePackages.qtwayland
  kdePackages.qtstyleplugin-kvantum
  kdePackages.gruvbox-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Gruvbox-Dark-Green
    '';

    "Kvantum/Gruvbox-Dark-Green".source = "${gruvboxKvantum}/share/Kvantum/Gruvbox-Dark-Green";
  };
}
