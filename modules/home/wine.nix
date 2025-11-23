{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ## Utils
    winetricks
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-ge

    ## Cli games
    #vitetris
    #nethack

    ## Celeste
    #celeste-classic
    #celeste-classic-pm

    ## Doom
    # gzdoom
    #crispy-doom

    ## Emulation
    #sameboy
    #snes9x
    # cemu
    # dolphin-emu
  ];
}
