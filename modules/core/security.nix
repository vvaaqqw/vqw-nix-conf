{...}: {
  security.rtkit.enable = true; #pipewire
  security.sudo-rs.enable = true;
  security.sudo-rs.execWheelOnly = true;
  security.sudo.enable = false;
  # security.sudo.execWheelOnly = true;
  services.fail2ban.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {
    enableGnomeKeyring = true;
  };
  systemd.coredump.enable = false;
  #https://ryanseipp.com/post/hardening-nixos/
  systemd.services.systemd-rfkill = {
    serviceConfig = {
      ProtectSystem = "strict";
      ProtectHome = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      ProtectClock = true;
      ProtectProc = "invisible";
      ProcSubset = "pid";
      PrivateTmp = true;
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      LockPersonality = true;
      RestrictRealtime = true;
      SystemCallArchitectures = "native";
      UMask = "0077";
      IPAddressDeny = "any";
    };
  };

  systemd.services.systemd-journald = {
    serviceConfig = {
      UMask = 0077;
      PrivateNetwork = true;
      ProtectHostname = true;
      ProtectKernelModules = true;
    };
  };
}
