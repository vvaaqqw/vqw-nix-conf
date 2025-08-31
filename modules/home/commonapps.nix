{pkgs, ...}: {
  home.packages = with pkgs; [
    openssl
    aria2
    ranger
    wpsoffice-cn
    thunderbird
    # evolution #gtk e-mail client
    easyeffects
    # brave
    # cinnamon.nemo
    qbittorrent
    # hexchat
    # netflix
    bilibili
    keepassxc
    helvum
    # (symlinkJoin {
    #   # wrap obsidian with pandoc for the pandoc plugin dependency
    #   name = "Obsidian";
    #   paths = with pkgs; [obsidian pandoc];
    # })
    # gnome packages
    pkgs.gnome-tweaks
    pkgs.gnome-calendar
    # komikku #comics
  ];
}
