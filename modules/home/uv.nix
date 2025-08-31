{pkgs, ...}: {
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      python-preference = "only-system";
    };
  };

  environment.localBinInPath = true; #https://nixos.wiki/wiki/Python
}
