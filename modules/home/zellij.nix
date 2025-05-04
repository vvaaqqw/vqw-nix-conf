{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      theme = "gruvbox-dark";
      pane_frames = false;
      show_startup_tips = false;
    };
  };
}
