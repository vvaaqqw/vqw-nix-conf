{pkgs, ...}: {
  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = false; # turn off Bluetooth on boot
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      # https://wiki.nixos.org/wiki/Intel_Graphics
      # Required for modern Intel GPUs (Xe iGPU and ARC)
      intel-media-driver     # VA-API (iHD) userspace
      vpl-gpu-rt             # oneVPL (QSV) runtime
      # Optional (compute / tooling):
      intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
      ];
    };
  };
  #hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}
