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
    ++ [(import ./zathura.nix)] # pdf viewer
    #++ [(import ./discord/discord.nix)]                   # discord with catppuccin theme
    ++ [(import ./fastfetch.nix)] # fetch tool
    ++ [(import ./musicfox)] # fetch tool
    #    ++ [(import ./floorp/floorp.nix)]             # firefox based browser
    ++ [(import ./wine.nix)]  
    ++ [(import ./fzf.nix)] # fuzzy finder
    ++ [(import ./git.nix)] # version control
    ++ [(import ./gnome.nix)] # gnome apps
    ++ [(import ./gtk.nix)] # gtk theme
    ++ [(import ./qt.nix)] # qt theme
    ++ [(import ./kitty.nix)] # terminal
    ++ [(import ./micro.nix)] # nano replacement
    ++ [(import ./nvim)] # neovim editor
    ++ [(import ./helix.nix)] # helix editor
    ++ [(import ./packages.nix)] # other packages
    # ++ [(import ./retroarch.nix)]
    ++ [(import ./rofi.nix)] # launcher
    ++ [(import ./scripts/scripts.nix)] # personal scripts
    #++ [(import ./spicetify.nix)]                 # spotify client
    ++ [(import ./starship.nix)] # shell prompt
    ++ [(import ./swaylock.nix)] # lock screen
    #++ [(import ./vscodium.nix)]                  # vscode forck
    ++ [(import ./commonapps.nix)]
    ++ [(import ./yazi)]
    ++ [(import ./mime.nix)]
    ++ [(import ./fcitx5)] # fcitx5
    ++ [(import ./vscode)] # vscode
    ++ [(import ./direnv.nix)] # direnv
    ++ [(import ./zsh.nix)] # shell
    ++ [(import ./zellij.nix)]
    ++ [(import ./zen-browser.nix)]
    ++ [(import ./librewolf.nix)]
    ++ [(import ./vesktop)]
    ++ lib.optionals (host == "ghostrace") [
      # Hyprland 相关配置
      ./hyprland
      ./waybar
      ./swaync/swaync.nix
      #./hyprpanel.nix# NixOS instructions are pending updates for HyprPanel v2
    ];
}
