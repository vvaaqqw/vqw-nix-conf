{
  config,
  pkgs,
  ...
}: {
  boot.kernelParams = [
  # firmware bug: ucsi_acpi USBC000:00: possible UCSI driver bug 2
  "module_blacklist=ucsi_acpi"
  ];
  
  # 休眠后小红点和trackpad的左右键会挂，唤醒后自动重置
  powerManagement.resumeCommands = ''
    sleep 1
    modprobe -r psmouse || true
    modprobe psmouse || true
  '';

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
