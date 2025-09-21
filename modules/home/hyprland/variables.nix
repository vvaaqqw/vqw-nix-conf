{...}: {
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # You can turn on native Wayland support in all chrome and most electron apps by setting an environment variable:
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    #QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORM = "wayland";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Gruvbox-Dark";
    #fcitx
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    QT_IM_MODULES = "wayland;fcitx;ibus";
    GTK_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    INPUT_METHOD = "fcitx";
    IMSETTINGS_MODULE = "fcitx";
  };
}
