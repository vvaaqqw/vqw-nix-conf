{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.cachix
    pkgs.nurl
    pkgs.nix-search-tv # search nix packages
    # pkgs.nix-update # update rev n hash, could also do it with nvfetcher
    pkgs.bluez
    pkgs.unar
    pkgs.p7zip-rar
    pkgs.ripdrag #dragndrop
    pkgs.wlprop #xprop for wl
    pkgs.thefuck
    pkgs.firejail
    pkgs.kdePackages.kate
    pkgs.waylyrics #desktop lyrics
    pkgs.go-musicfox # netease cloud music tui
    pkgs.netease-cloud-music-gtk # netease cloud music gui
    pkgs.piper # front end for ratbagd
    pkgs.htop
    #pkgs.pywal #hyprpanel uses
    pkgs.kdePackages.filelight
    pkgs.gocryptfs
    # pkgs.sirikali # gocrpyptfs gui front
    pkgs.vesktop#discord
    pkgs.ungoogled-chromium#chromium  
    #inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    #inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}
