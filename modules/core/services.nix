{...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    #usb
    gvfs.enable = true;
    udisks2.enable = true;
    fstrim.enable = true;
    ##############################################
    flatpak = {
      enable = true;
      packages = [
        "com.github.tchx84.Flatseal" # to support wayland
        {
          appId = "com.baidu.NetDisk";
          origin = "flathub";
        }
        "com.jianguoyun.Nutstore"
      ];
      update.auto = {
        enable = true;
        onCalendar = "monthly";
      };

      overrides = {
        global = {
          # Force Wayland by default
          Context.sockets = ["wayland" "!x11" "!fallback-x11"];

          Environment = {
            # Fix un-themed cursor in some Wayland apps
            XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

            # Force correct theme for some GTK apps
            #GTK_THEME = "Adwaita:dark";
          };
        };
      };
    };
    #####################################################
    ratbagd.enable = true; # ratbagd for logitech mouse
    blueman.enable = true;
    xremap = {
      withWlroots = true;
      userName = "spectre";
      yamlConfig = ''
        modmap:
          - name: CapsLock to RightCtrl/Esc
            remap:
              CapsLock:
                held: Ctrl_R
                alone: Esc
                alone_timeout: 500
      '';
    };
    ############################
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
