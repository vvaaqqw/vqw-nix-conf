{pkgs, ...}: {
  programs.librewolf = {
    enable = true;
    policies = {
      BlockAboutConfig = true;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableFirefoxAccounts = true;
      # DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      PictureInPicture = {
      Enabled = false;
      Locked = true;  # 可选：锁定，防止用户通过 about:config 或设置手动启用
      };

      SecurityDevices = {
        Add = {
          "OpenSC PKCS#11" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
        };
      };

      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked"; # Blocks all addons except the ones specified below
        };
        # "addon@simplelogin" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/simplelogin/latest.xpi";
        #   installation_mode = "force_installed";
        # };

        # "keepassxc-browser@keepassxc.org" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
        #   installation_mode = "force_installed";
        # };

        # use about:debugging#/runtime/this-firefox to find the correct id
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        "CanvasBlocker@kkapsner.de" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
          installation_mode = "force_installed";
        };

        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
        };

        "{7fc8ef53-24ec-4205-87a4-1e745953bb0d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/css-exfil-protection/latest.xpi";
          installation_mode = "force_installed";
        };

        "{96ef5869-e3ba-4d21-b86e-21b163096400}" = {
          install_url = "http://addons.mozilla.org/firefox/downloads/latest/font-fingerprint-defender/latest.xpi";
          installation_mode = "force_installed";
        };

        "{c607c8df-14a7-4f28-894f-29e8722976af}" = {
          install_url = "http://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
          installation_mode = "force_installed";
        };

        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
        };
        "foxyproxy@eric.h.jung" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/foxyproxy-standard/latest.xpi";
          installation_mode = "force_installed";
        };
        "idcac-pub@guus.ninja" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
