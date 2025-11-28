{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    enableBashIntegration = false;
    settings = {
      theme = "gruvbox-dark";
      pane_frames = false;
      show_startup_tips = false;
    };
  };
}
