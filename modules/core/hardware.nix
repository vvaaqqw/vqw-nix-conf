{pkgs, ...}: {
  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = false; # turn off Bluetooth on boot
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
