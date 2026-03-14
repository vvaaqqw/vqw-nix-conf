{pkgs, ...}: {
  home.packages = with pkgs; [
    go-musicfox
  ];
  xdg.configFile."go-musicfox/config.toml".source = ./config.toml;
}
