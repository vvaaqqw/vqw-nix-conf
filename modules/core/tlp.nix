{...}: {
  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 0; # 1 代表保持默认模式

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; #when unconfigured:balanced_power
      # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";#when unconfigured:balanced_performance

      #CPU_MIN_PERF_ON_AC = 0;
      #CPU_MAX_PERF_ON_AC = 100;
      #CPU_MIN_PERF_ON_BAT = 0;
      #CPU_MAX_PERF_ON_BAT = 20;

      RUNTIME_PM_ON_AC = "auto"; #archwiki said it's useful somehow
      CPU_BOOST_ON_AC=0; # turbo boost might be harmful according to the internet
      CPU_BOOST_ON_BAT=0;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 75; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 85; # 50 and above it stops charging
      # 开机默认关闭蓝牙
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
      # Do not suspend USB devices
      USB_AUTOSUSPEND=0;
    };
  };

  services.thinkfan = {
    enable = true;
  }; # this software targets thinkpad series

  # services.power-profiles-daemon = {
  #   enable = true;
  # }; #this conflicts with tlp. used in swaync, manage power profiles with cli tool that come with it: powerprofilesctl
  # TODO: maybe change the swaync config someday.
}
