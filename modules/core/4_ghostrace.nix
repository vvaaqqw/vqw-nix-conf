{
  config,
  pkgs,
  ...
}: {
  # firmware bug
  boot.kernelParams = ["module_blacklist=ucsi_acpi"];
  # 只有thinkpad能用的命令
  services.thinkfan = {
    enable = true;
  }; # this software targets thinkpad series

  hardware.graphics.extraPackages = with pkgs; [
    # https://wiki.nixos.org/wiki/Intel_Graphics
    # Required for modern Intel GPUs (Xe iGPU and ARC)
    intel-media-driver # VA-API (iHD) userspace
    vpl-gpu-rt # oneVPL (QSV) runtime
    # Optional (compute / tooling):
    intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe
  ];

  services.xserver.videoDrivers = ["modesetting"]; # https://wiki.nixos.org/wiki/Intel_Graphics
}
