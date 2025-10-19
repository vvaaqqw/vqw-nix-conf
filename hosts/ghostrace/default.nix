{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.systemPackages = with pkgs; [
    cmake
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  services = {
    # thermald.enable = true; # might need it if thinkfan is disabled
    cpupower-gui.enable = true;
    power-profiles-daemon.enable = false;# conflicts with tlp

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #     charger = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #   };
    # };
  };

  powerManagement.cpuFreqGovernor = "performance";#By default, the kernel configures the performance governor, although this may be overwritten in your hardware-configuration.nix file.

  # hibernation needs this to work
  boot.resumeDevice = "/dev/nvme0n1p3"; #swapon -s to list the option

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [pkgs.cpupower-gui];
  };
}
