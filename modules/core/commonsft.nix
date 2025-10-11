{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pkgs.cachix
    pkgs.nurl
    pkgs.nix-search-tv # search nix packages
    pkgs.nvfetcher # to update rev n hash
    # pkgs.nix-update # update rev n hash, could also do it with nvfetcher
    pkgs.bluez
    pkgs.unar
    pkgs.p7zip-rar
    pkgs.zip
    pkgs.ripdrag #dragndrop
    pkgs.wlprop #xprop for wl
    pkgs.waylyrics #desktop lyrics
    pkgs.netease-cloud-music-gtk # netease cloud music gui
    pkgs.piper # front end for ratbagd
    pkgs.htop
    #pkgs.pywal #hyprpanel uses
    # kde stuff
    pkgs.kdePackages.kate
    pkgs.kdePackages.dolphin
    pkgs.kdePackages.dolphin-plugins
    pkgs.kdePackages.okular
    pkgs.kdePackages.kio
    pkgs.kdePackages.kio-extras
    pkgs.kdePackages.kimageformats
    pkgs.kdePackages.kdegraphics-thumbnailers

    pkgs.gocryptfs
    # pkgs.sirikali # gocrpyptfs gui front
    pkgs.ungoogled-chromium #chromium
    #inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    #inputs.nix-software-center.packages.${system}.nix-software-center
  ];

  environment.localBinInPath = true; #https://nixos.wiki/wiki/Python
}
