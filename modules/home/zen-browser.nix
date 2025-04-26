{
  pkgs,
  inputs,
  ...
}:{
  # home.nix
  imports = [
    # inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa]; #https://github.com/0xc000022070/zen-browser-flake
    policies = {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };
}
