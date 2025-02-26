{
  inputs,
  nixpkgs,
  self,
  username,
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
    ++ [(import ./stylix.nix)]
    ++ [(import ./wayland.nix)]
    ++ [(import ./virtualization.nix)]
    ++ [(import ./rust.nix)];
}
