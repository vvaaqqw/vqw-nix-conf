{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.bluez
    pkgs.ripdrag #dragndrop
    pkgs.wlprop #xprop for wl
    #pkgs.fuzzel #ags uses
    pkgs.thefuck
    pkgs.firejail
    pkgs.kate
    pkgs.osdlyrics
    pkgs.htop
    pkgs.kdePackages.filelight
    #pkgs.ydotool #ags uses
    #pkgs.gvfs #ags uses
    #inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    #inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}
