{pkgs, ...}: {
  home.packages = with pkgs; [
    openssl
    aria2
    ranger
    wpsoffice-cn
    thunderbird
    easyeffects
    firefox
    # librewolf # opens firefox somehow
    # cinnamon.nemo
    qbittorrent
    # hexchat
    # netflix
    keepassxc
    helvum
    #obsidian because my memories fade away constantly
    (symlinkJoin {
      # wrap obsidian with pandoc for the pandoc plugin dependency
      name = "Obsidian";
      paths = with pkgs; [obsidian pandoc];
    })

    # plasma packages
    plasma5Packages.dolphin
    plasma5Packages.dolphin-plugins
    plasma5Packages.okular
    plasma5Packages.kio
    plasma5Packages.kio-extras
    plasma5Packages.kimageformats
    plasma5Packages.kdegraphics-thumbnailers

    # gnome packages
    pkgs.gnome-tweaks
    pkgs.gnome-calendar
    # komikku #comics
  ];
}
