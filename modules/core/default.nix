{
  inputs,
  nixpkgs,
  self,
  username,
  lib,
  host,
  ...
}: {
  imports =
    [(import ./bootloader.nix)]
    ++ [(import ./hardware.nix)]
    ++ [(import ./makedir.nix)]
    ++ [(import ./tlp.nix)]
    ++ [(import ./commonsft.nix)]
    ++ [(import ./xserver.nix)]
    ++ [(import ./network.nix)]
    ++ [(import ./proxychains.nix)]
    ++ [(import ./nh.nix)]
    ++ [(import ./pipewire.nix)]
    ++ [(import ./program.nix)]
    ++ [(import ./security.nix)]
    ++ [(import ./services.nix)]
    ++ [(import ./font.nix)]
    ++ [(import ./system.nix)]
    ++ [(import ./user.nix)]
    ++ [(import ./wayland.nix)]
    ++ [(import ./steam.nix)]
    ++ [(import ./librewolf.nix)]
    ++ [(import ./virtualization.nix)]
    ++ lib.optionals (host == "ghostrace") [
      ./rust.nix
      ];
}
