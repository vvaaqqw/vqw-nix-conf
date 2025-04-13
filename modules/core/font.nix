{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      material-symbols
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      sarasa-gothic #更纱黑体
      source-code-pro
      hack-font
      jetbrains-mono
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      # used in some of my latex file
      ##################################
      dejavu_fonts
      liberation_ttf
      source-han-serif
      wqy_zenhei
      noto-fonts-cjk-sans
      ##################################
    ];
  };
}
