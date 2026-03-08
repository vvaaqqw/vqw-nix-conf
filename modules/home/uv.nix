{pkgs, ...}: {
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "automatic";
      python-preference = "managed";
    };
  };
}
