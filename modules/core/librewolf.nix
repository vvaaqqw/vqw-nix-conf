{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";

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

      };
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      # DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      # OverrideFirstRunPage = "";
      # OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "never"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      SecurityDevices = {
        Add = {
          "OpenSC PKCS#11" = "${pkgs.opensc}/lib/opensc-pkcs11.so";
        };
      };
    };
    profiles.default = {
      # userChrome = builtins.readFile ./userChrome.css;
      # userContent = builtins.readFile ./userChrome.css;
      search = {
        force = true;
        engines = {
          # don't need these default ones
          "amazondotcom-us".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "ddg" = {
            urls = [
              {
                template = "https://duckduckgo.com";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [",d"];
          };
          "google" = {
            urls = [
              {
                template = "https://google.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [",g"];
          };
          "Home Manager Options" = {
            urls = [
              {
                template = "https://mipmip.github.io/home-manager-option-search/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["ho"];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["np"];
          };
          "youtube" = {
            urls = [
              {
                template = "https://www.youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["y"];
          };
          "Wikipedia" = {
            urls = [
              {
                template = "https://en.wikipedia.org/wiki/Special:Search";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["wik"];
          };
          "GitHub" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["gh"];
          };
        };
        default = "ddg";
      };
      id = 0;
      settings = {
        # settings = lib.mapAttrs' (n: lib.nameValuePair "pref.${n}") {
        "app.update.auto" = true; # disable auto update
        "dom.security.https_only_mode" = true; # force https
        "extensions.pocket.enabled" = false; # disable pocket
        "browser.quitShortcut.disabled" = true; # disable ctrl+q
        "browser.download.panel.shown" = true; # show download panel
        "signon.rememberSignons" = false; # disable saving passwords
        # UI changes
        "startup.homepage_welcome_url" = ""; # disable welcome page
        "browser.newtabpage.enabled" = false; # disable new tab page
        "full-screen-api.ignore-widgets" = true; # fullscreen within window
        "browser.aboutConfig.showWarning" = false; # disable warning about about:config
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true; # disable picture in picture button

        # Privacy
        # "browser.discovery.enabled" = false; # disable discovery
        # "browser.search.suggest.enabled" = false; # disable search suggestions
        # "browser.contentblocking.category" = "custom"; # set tracking protection to custom
        "dom.private-attribution.submission.enabled" = false; # stop doing dumb stuff mozilla
        "browser.protections_panel.infoMessage.seen" = true; # disable tracking protection info

        # Disable telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.telemetry.unified" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;

        # let me close and open tabs without confirmation
        "browser.tabs.loadBookmarksInTabs" = true; # open bookmarks in new tab
        "browser.tabs.warnOnOpen" = false; # don't warn when opening multiple tabs
        "browser.tabs.warnOnQuit" = false; # don't warn when closing multiple tabs
        "browser.tabs.warnOnClose" = false; # don't warn when closing multiple tabs
        "browser.tabs.warnOnCloseOtherTabs" = false; # don't warn when closing multiple tabs
        "browser.tabs.closeWindowWithLastTab" = false; # don't close window when last tab is closed

        # other
        "media.rdd-vpx.enabled" = true; # enable hardware acceleration
        "devtools.cache.disabled" = true; # disable caching in devtools
        "media.ffmpeg.vaapi.enabled" = true; # enable hardware acceleration
      };
    };
  };
}
