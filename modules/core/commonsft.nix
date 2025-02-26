{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.cachix
    pkgs.bluez
    pkgs.ripdrag #dragndrop
    pkgs.wlprop #xprop for wl
    pkgs.thefuck
    pkgs.firejail
    pkgs.kdePackages.kate
    pkgs.waylyrics #desktop lyrics
    pkgs.go-musicfox # netease cloud music tui
    pkgs.htop
    pkgs.pywal #hyprpanel uses
    pkgs.kdePackages.filelight
    pkgs.gocryptfs
    pkgs.sirikali # gocrpyptfs gui front
    pkgs.cachix
    pkgs.ungoogled-chromium#chromium  
    inputs.zen-browser.packages."${system}".specific
    #inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    #inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}
