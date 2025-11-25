{pkgs, ...}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      # for flypy chinese input method
      (fcitx5-rime.override {
        rimeDataPkgs = [
          rime-ice #nvfpkgs rime-ice
          fcitx5-pinyin-moegirl
          fcitx5-pinyin-zhwiki
        ];
      })
      rime-data
      librime
      # needed enable rime using configtool after installed
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-lua
      kdePackages.fcitx5-qt
    ];
  };

  home.file.".local/share/fcitx5/themes".source = ./themes;
  home.file.".local/share/fcitx5/rime/default.yaml".source = ./default.yaml;

  # before would make it read-only and prevent rime to build
  # home.file.".local/share/fcitx5/rime".source = ./rime-ice;

  xdg.configFile = {
    "fcitx5/profile" = {
      source = ./profile;
      # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile,
      # so we need to force replace it in every rebuild to avoid file conflict.
      force = true;
    };
    "fcitx5/conf/classicui.conf".source = ./classicui.conf;
  };
}
