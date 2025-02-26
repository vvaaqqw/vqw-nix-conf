{
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # 也可以设置字体和壁纸。。。
    targets.fcitx5.enable = false;
    targets.chromium.enable = false;
  };
}
