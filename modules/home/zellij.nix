{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
        theme = "gruvbox-dark";
        show_startup_tips = false;
        };
  };
}
