{...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    dbus.implementation = "broker";
    printing.enable = true; # Enable CUPS to print documents.
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
        {
          appId = "com.tencent.wemeet";
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
    # xremap = {
    #   withWlroots = true;
    #   userName = "spectre";
    #   yamlConfig = ''
    #     modmap:
    #       - name: CapsLock to RightCtrl/Esc
    #         remap:
    #           CapsLock:
    #             held: Ctrl_R
    #             alone: Esc
    #             alone_timeout: 500
    #   '';
    # };
    kanata = {
      enable = true;
      keyboards = {
        "l3shy".config = ''
          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt
          )
          (defalias
            ;; tap for caps lock, hold for left control
            cap (tap-hold 150 150 esc lctl)
          )
          (deflayer randomname
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            @cap a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt
          )
        '';
      };
    };
    ############################
  };
  services.logind.settings.Login = {
    # don’t shutdown when power button is short-pressed
    HandlePowerKey = "ignore";
  };
}
