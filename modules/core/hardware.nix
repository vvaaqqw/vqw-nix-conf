{pkgs, ...}: {
  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
