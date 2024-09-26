{
  inputs,
  lib,
  username,
  host,
  ...
}: {
  imports =
    #   [(import ./aseprite/aseprite.nix)]         # pixel art editor
    [(import ./audacious.nix)] # music player
    ++ [(import ./gh.nix)] # github cli command
    ++ [(import ./bat.nix)] # better cat command
    ++ [(import ./btop.nix)] # resouces monitor
    ++ [(import ./gammastep.nix)] # resouces monitor
    ++ [(import ./cava.nix)] # audio visualizer
    #++ [(import ./discord/discord.nix)]                   # discord with catppuccin theme
    ++ [(import ./fastfetch.nix)] # fetch tool
    #    ++ [(import ./floorp/floorp.nix)]             # firefox based browser
    ++ [(import ./fzf.nix)] # fuzzy finder
    ++ [(import ./gaming.nix)] # packages related to gaming
    ++ [(import ./git.nix)] # version control
    ++ [(import ./gnome.nix)] # gnome apps
    ++ [(import ./gtk.nix)] # gtk theme
    ++ [(import ./hyprland)] # window manager
    ++ [(import ./kitty.nix)] # terminal
    ++ [(import ./micro.nix)] # nano replacement
    ++ [(import ./nvim.nix)] # neovim editor
    ++ [(import ./helix.nix)] # helix editor
    ++ [(import ./packages.nix)] # other packages
    ++ [(import ./retroarch.nix)]
    ++ [(import ./rofi.nix)] # launcher
    ++ [(import ./scripts/scripts.nix)] # personal scripts
    #++ [(import ./spicetify.nix)]                 # spotify client
    ++ [(import ./starship.nix)] # shell prompt
    ++ [(import ./swaylock.nix)] # lock screen
    #++ [(import ./vscodium.nix)]                  # vscode forck
    ++ [(import ./commonapps.nix)] # vscode forck
    # ++ [(import ./waybar)] # status bar
    # ++ [(import ./swaync/swaync.nix)] # notification deamon
    # ++[(import ./ags)]
    ++[(import ./hyprpanel.nix)] # all-in-one
    ++ [(import ./yazi)]
    ++ [(import ./mime.nix)]
    ++ [(import ./fcitx5)] # fcitx5
    ++ [(import ./vscode)] # vscode
    ++ [(import ./zsh.nix)]; # shell
}
