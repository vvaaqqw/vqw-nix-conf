{
  username,
  ...
}:
{
  programs.vscode = {
        profiles.default.keybindings = [
      {
        command = "selectNextSuggestion";
        key = "tab";
        when = "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
      }
      {
        command = "selectPrevSuggestion";
        key = "shift+tab";
        when = "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible";
      }
      {
        command = "-rust-analyzer.onEnter";
        key = "enter";
        when = "editorTextFocus && !suggestWidgetVisible && editorLangId == 'rust'";
      }
      # ctrl+e:toggle explorer
      {
        key = "ctrl+e";
        command= "workbench.view.explorer";
        when= "!explorerViewletVisible";
      }
      {
        key= "ctrl+e";
        command= "workbench.action.closeSidebar";
        when= "explorerViewletVisible";
      }
      # focus
      {
        key = "ctrl+]";
        command = "workbench.action.terminal.focusNext";
        when = "terminalFocus";
      }
      {
        key = "ctrl+[";
        command = "workbench.action.terminal.focusPrevious";
        when = "terminalFocus";
      }
      {
        key = "ctrl+alt+m";
        command = "bookmarks.toggle";
        when = "editorTextFocus";
      }
      {
        key = "alt+h";
        command = "workbench.action.focusLeftGroup";
        when= "editorTextFocus && vim.active && vim.mode != 'Insert'";
      }
      {
        key = "alt+j";
        command = "workbench.action.focusBelowGroup";
        when= "editorTextFocus && vim.active && vim.mode != 'Insert'";
      }
      {
        key = "alt+k";
        command = "workbench.action.focusAboveGroup";
        when= "editorTextFocus && vim.active && vim.mode != 'Insert'";
      }
      {
        key = "alt+l";
        command = "workbench.action.focusRightGroup";
        when= "editorTextFocus && vim.active && vim.mode != 'Insert'";
      }
    ];

    profiles.default.userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      # "workbench.colorTheme" = "poimandres";
      # "workbench.colorTheme" = "Catppuccin Macchiato";
      # "catppuccin.accentColor" = "mauve";
      "editor.fontFamily" = "JetBrainsMono Nerd Font, Material Design Icons, 'monospace', monospace";
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "workbench.fontAliasing" = "antialiased";
      "files.trimTrailingWhitespace" = true;
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font Mono";
      "window.titleBarStyle" = "custom";
      "terminal.integrated.automationShell.linux" = "nix-shell";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.cursorBlinking" = true;
      "editor.cursorSmoothCaretAnimation" = "on";
      "terminal.integrated.enableVisualBell" = false;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
      "editor.minimap.enabled" = true;
      "editor.minimap.renderCharacters" = true;
      "editor.overviewRulerBorder" = false;
      "editor.renderLineHighlight" = "all";
      "editor.inlineSuggest.enabled" = true;
      "editor.smoothScrolling" = true;
      "editor.suggestSelection" = "first";
      "editor.guides.indentation" = true;
      "editor.guides.bracketPairs" = true;
      "editor.bracketPairColorization.enabled" = true;
      "window.nativeTabs" = true;
      "window.restoreWindows" = "all";
      "window.menuBarVisibility" = "toggle";
      "workbench.panel.defaultLocation" = "right";
      "workbench.editor.tabCloseButton" = "left";
      "workbench.startupEditor" = "none";
      "workbench.list.smoothScrolling" = true;
      "workbench.editor.tabActionLocation" = "left";
      "security.workspace.trust.enabled" = false;
      "explorer.confirmDelete" = false;
      "breadcrumbs.enabled" = false;
      "dev.containers.dockerPath" = "/etc/profiles/per-user/${username}/bin/podman-host"; #https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md

      "vim.camelCaseMotion.enable" = true;
      "vim.debug.silent" = true;
      "vim.easymotion" = true;
      # "vim.enableNeovim" = false;
      "vim.handleKeys" = {
        "<C-a>" = false;
        "<C-c>" = false;
        "<C-d>" = false;
        "<C-f>" = false;
        "<C-j>" = false;
        "<C-k>" = false;
        "<C-p>" = false;
      };
      # "vim.insertModeKeyBindings" = [
      #   {
      #     "before" = ["k" "j"];
      #     "after" = ["<Esc>"];
      #   }
      #   {
      #     "before" = ["j" "k"];
      #     "after" = ["<Esc>"];
      #   }
      # ];
      "vim.normalModeKeyBindings" = [
        {
          "before" = [":"];
          "commands" = [
            "workbench.action.showCommands"
          ];
          "silent" = true;
        }
      ];

      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          "before" = ["K"];
          "commands" = [
            {
              "command" = "editor.action.showHover";
              "args" = {
                "key" = "editor.action.showHover";
                "kind" = "editor";
              };
            }
          ];
        }
        {
          "before" = ["K" "K"];
          "commands" = [
            {
              "command" = "editor.action.showHover";
              "args" = {
                "key" = "editor.action.showHover";
                "kind" = "editor";
              };
            }
            "cursorDown"
          ];
        }
        {
          "before" = ["g" "d"];
          "commands" = [
            {
              "command" = "editor.action.goToDeclaration";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "D"];
          "commands" = [
            {
              "command" = "editor.action.goToDefinition";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "r"];
          "commands" = [
            {
              "command" = "editor.action.findReferences";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "I"];
          "commands" = [
            {
              "command" = "editor.action.goToImplementation";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "s"];
          "commands" = [
            {
              "command" = "editor.action.triggerSuggest";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "l"];
          "commands" = [
            {
              "command" = "editor.action.showDiagnostics";
              "args" = {};
            }
          ];
        }
        {
          "before" = ["g" "l" "g" "l"];
          "commands" = [
            {
              "command" = "editor.action.showDiagnostics";
              "args" = {};
            }
            "cursorDown"
          ];
        }
        {
          "before" = [
            "<leader>"
            "m"
          ];
          "commands" = [
            "bookmarks.toggle"
          ];
        }
        {
          "before" = [
            "<leader>"
            "b"
          ];
          "commands" = [
            "bookmarks.list"
          ];
        }
        {
          "before" = [
            "<C-n>"
          ];
          "commands" = [
            "=nohl"
          ];
        }
        {
          "before" = [
            "<C-x>"
          ];
          "commands" = [
            "=wq"
          ];
        }
        {
          "before" = [
            "<leader>"
            "o"
          ];
          "after" = [
            "o"
            "<Esc>"
            "k"
          ];
          "silent" = true;
        }
        {
          "before" = [
            "<leader>"
            "O"
          ];
          "after" = [
            "O"
            "<Esc>"
            "j"
          ];
          "silent" = true;
        }
        {
          "before" = [
            "J"
          ];
          "after" = [
            "5"
            "j"
          ];
          "silent" = true;
        }
        {
          "before" = [
            "H"
          ];
          "after" = [
            "5"
            "h"
          ];
          "silent" = true;
        }
        {
          "before" = [
            "L"
          ];
          "after" = [
            "5"
            "l"
          ];
          "silent" = true;
        }
        {
          "before" = [
            ">"
          ];
          "commands" = [
            "editor.action.indentLines"
          ];
        }
        {
          "before" = [
            "<"
          ];
          "commands" = [
            "editor.action.outdentLines"
          ];
        }
      ];
      "vim.visualModeKeyBindings" = [
        {
          "before" = [
            ">"
          ];
          "commands" = [
            "editor.action.indentLines"
          ];
        }
        {
          "before" = [
            "<"
          ];
          "commands" = [
            "editor.action.outdentLines"
          ];
        }
      ];
      "vim.visualModeKeyBindingsNonRecursive" = [
        {
          "before" = [
            "p"
          ];
          "after" = [
            "p"
            "g"
            "v"
            "y"
          ];
        }
      ];
      "vim.statusBarColorControl" = false;
      # "vim.statusBarColors.normal" = ["#8FBCBB" "#434C5E"];
      # "vim.statusBarColors.insert" = "#00FFFF";
      # "vim.statusBarColors.visual" = "#B48EAD";
      # "vim.statusBarColors.visualline" = "#B48EAD";
      # "vim.statusBarColors.visualblock" = "#A3BE8C";
      # "vim.statusBarColors.replace" = "#D08770";
      # "vim.statusBarColors.commandlineinprogress" = "#007ACC";
      # "vim.statusBarColors.searchinprogressmode" = "#007ACC";
      # "vim.statusBarColors.easymotionmode" = "#007ACC";
      # "vim.statusBarColors.easymotioninputmode" = "#007ACC";
      # "vim.statusBarColors.surroundinputmode" = "#007ACC";
      "vim.autoSwitchInputMethod.enable" = true;
      "vim.autoSwitchInputMethod.defaultIM" = "1";
      # "vim.autoSwitchInputMethod.obtainIMCmd" = "/usr/bin/fcitx5-remote";
      # "vim.autoSwitchInputMethod.switchIMCmd" = "/usr/bin/fcitx5-remote -t {im}";
      "vim.autoSwitchInputMethod.obtainIMCmd" = "/etc/profiles/per-user/${username}/bin/fcitx5-remote";
      "vim.autoSwitchInputMethod.switchIMCmd" = "/etc/profiles/per-user/${username}/bin/fcitx5-remote -t {im}";

      "vim.highlightedyank.enable" = true;
      "vim.leader" = "<space>";
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;
    };
  };
}
