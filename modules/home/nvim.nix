{pkgs, ...}: {
  # Install to the user scope.
  home.packages = with pkgs; [
    go
  ];
  programs.neovim = {
    enable = true;
    vimAlias = true;
    # Packages only accessible from neovim
    };
  }
