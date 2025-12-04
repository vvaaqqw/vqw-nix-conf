{
  pkgs,
  inputs,
  ...
}: {
  # home.nix
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # inputs.zen-browser.homeModules.twilight
    # IMPORTANT: this package relies on the twilight release artifacts from the
    # official zen repo and no new release is created, the artifacts are replaced
    # inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa]; #https://github.com/0xc000022070/zen-browser-flake
    policies = {
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab" or "never"
      DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      DisableMasterPasswordCreation = true;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableFeedbackCommands = true;
      DisablePocket = true; # save webs for later reading
      PictureInPicture = {
        Enabled = false;
        Locked = true; # 可选：锁定，防止用户通过 about:config 或设置手动启用
      };
      # find more options here: https://mozilla.github.io/policy-templates/
    };
  };
}
