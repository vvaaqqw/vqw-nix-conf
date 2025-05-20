{...}: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  services.fail2ban.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {};
}
