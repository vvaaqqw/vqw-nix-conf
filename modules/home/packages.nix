{
  inputs,
  pkgs,
  ...
}: let
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
in {
  home.packages = with pkgs; [
    _2048
    udiskie
    ## CLI utility
    cryptsetup
    bitwise # cli tool for bit / hex manipulation
    caligula # User-friendly, lightweight TUI for disk imaging
    cliphist # clipboard manager
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    ffmpeg
    file # Show file information
    gifsicle # gif utility
    gtrash # rm replacement, put deleted files in system trash
    hexdump
    imv # image viewer
    killall
    lazygit
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    nitch # systhem fetch util
    openssl
    onefetch # fetch utility for git repo
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    poweralertd
    qview # minimal image viewer
    ripgrep # grep replacement
    tdf # cli pdf viewer
    tldr
    # toipe # typing test in the terminal
    # ttyper # cli typing test
    unzip
    valgrind # c memory analyzer
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    yt-dlp-light
    xdg-utils
    xxd

    ## CLI
    # cbonsai # terminal screensaver
    tty-clock # cli clock

    ## GUI Apps
    audacity
    bleachbit # cache cleaner
    gimp
    libreoffice
    pavucontrol # pulseaudio volume controle (GUI)
    #prismlauncher                     # minecraft launcher
    qalculate-gtk # calculator
    #soundwireserver                   # pass audio to android phone
    vlc
    winetricks
    wineWowPackages.wayland
    zenity

    # C / C++
    gcc
    gnumake

    # Python
    python3

    inputs.alejandra.defaultPackage.${system}
  ];
}
