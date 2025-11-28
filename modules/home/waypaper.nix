{ pkgs, ... }:
{
  home.packages = with pkgs; [ waypaper ];
  # depends on swaybg/awww
  # xdg.configFile."waypaper/config.ini".text = ''
  #   [Settings]
  #   language = en
  #   folder = ~/Pictures/wallpapers/others
  #   monitors = All
  #   wallpaper = ~/Pictures/wallpapers/others/nixos.png
  #   backend = swaybg
  #   fill = fill
  #   sort = name
  #   color = #ffffff
  #   subfolders = False
  #   show_hidden = False
  #   show_gifs_only = False
  #   post_command = 
  #   number_of_columns = 3
  #   use_xdg_state = False
  # '';
}
