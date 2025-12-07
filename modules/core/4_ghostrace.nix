{
  config,
  pkgs,
  ...
}: {
  boot.kernelParams = [
  # firmware bug: ucsi_acpi USBC000:00: possible UCSI driver bug 2
  "module_blacklist=ucsi_acpi"
  # Avoid touchpad click to tap (clickpad) bug. For more detail see:
  # https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend
  "psmouse.synaptics_intertouch=0"
  ];
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
