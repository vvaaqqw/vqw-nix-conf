{
  config,
  pkgs,
  user,
  ...
}: {
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    package = pkgs.vscode-fhs; #need fhs for codelldb
    profiles.default.enableExtensionUpdateCheck = true;
    profiles.default.enableUpdateCheck = true;
    profiles.default.extensions = with pkgs.vscode-extensions;
      [
        # vscodevim.vim
        # jasew.vscode-helix-emulation #
        arrterian.nix-env-selector
        bbenoist.nix
        supermaven.supermaven #AI
        alefragnani.bookmarks
        # tintinweb.vscode-inline-bookmarks #
        waderyan.gitblame
        grapecity.gc-excelviewer
        usernamehw.errorlens
        catppuccin.catppuccin-vsc
        jdinhlife.gruvbox
        # jonathanharty.gruvbox-material-icon-theme
        #pmndrs.pmndrs #
        christian-kohler.path-intellisense
        dbaeumer.vscode-eslint
        eamodio.gitlens
        esbenp.prettier-vscode
        formulahendry.code-runner
        # golang.go
        ibm.output-colorizer
        kamadorueda.alejandra
        ms-azuretools.vscode-docker
        ms-python.python
        ms-python.vscode-pylance
        #KevinRose.vsc-python-indent
        njpwerner.autodocstring
        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        #ms-vscode.remote-explorer
        # ms-vscode.cpptools
        naumovs.color-highlight
        svelte.svelte-vscode
        oderwat.indent-rainbow
        pkief.material-icon-theme
        rust-lang.rust-analyzer
        fill-labs.dependi
        vadimcn.vscode-lldb #need fhs 
        tamasfe.even-better-toml
        shardulm94.trailing-spaces
        sumneko.lua
        timonwong.shellcheck
        usernamehw.errorlens
        xaver.clang-format
        yzhang.markdown-all-in-one
        bierner.markdown-emoji
        #yzane.markdown-pdf
        james-yu.latex-workshop
        #adpyke.vscode-sql-formatter
        redhat.vscode-yaml
        ms-azuretools.vscode-docker
        irongeek.vscode-env
        github.vscode-pull-request-github
        github.codespaces
        alefragnani.project-manager
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # {
        #   name = "copilot-nightly";
        #   publisher = "github";
        #   version = "1.67.7949";
        #   sha256 = "sha256-ZtUqQeWjXmTz49DUeYkuqSTdVHRC8OfgWv8fuhlHDVc=";
        # }
        # # {
        #   name = "volar";
        #   publisher = "vue";
        #   version = "1.0.12";
        #   sha256 = "sha256-D9E3KRUOlNVXH4oMv1W0+/mbqO8Se7+6E2F5P/KvCro=";
        # }
        # {
        #   name = "vscode-typescript-vue-plugin";
        #   publisher = "vue";
        #   version = "1.0.12";
        #   sha256 = "sha256-WiL+gc9+U861ubLlY/acR+ZcrFT7TdIDR0K1XNNidX8=";
        # }
        {
          name = "decay";
          publisher = "decaycs";
          version = "1.0.6";
          sha256 = "sha256-Jtxj6LmHgF7UNaXtXxHkq881BbuPtIJGxR7kdhKr0Uo=";
        }
        {
          name = "pmndrs";
          publisher = "pmndrs";
          version = "0.3.7";
          sha256 = "sha256-QgQH+BrKPxo7lv128V4l3WCiO3rBM41voqHMGNGrwWo=";
        }
        # {
        #   name = "vscode-helix-emulation";
        #   publisher = "jasew";
        #   version = "0.6.2";
        #   sha256 = "sha256-V/7Tu1Ze/CYRmtxwU2+cQLOxLwH7YRYYeHSUGbGTb5I=";
        # }
        # {
        #   name = "vscode-typescript-next";
        #   publisher = "ms-vscode";
        #   version = "5.0.202301100";
        #   sha256 = "sha256-8d/L9F06ZaS9dTOXV6Q40ivI499nfZLQURcLdHXoTSM=";
        # }
        # {
        #   name = "vscode-chromium-vector-icons";
        #   publisher = "adolfdaniel";
        #   version = "1.0.2";
        #   sha256 = "sha256-Meo53e/3jUP6YDEXOA/40xghI77jj4iAQus3/S8RPZI=";
        # }
      ];

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
        key = "ctrl+alt+z";
        command = "bookmarks.toggle";
        when= "editorTextFocus";
      }
      # {
      #   key= "alt+h";
      #   command= "workbench.action.focusLeftGroup";
      # }
      # {
      #   key= "alt+j";
      #   command= "workbench.action.focusBelowGroup";
      # }
      # {
      #   "key"= "alt+k";
      #   "command"= "workbench.action.focusAboveGroup";
      # }
      # {
      #   "key"= "alt+l";
      #   "command"= "workbench.action.focusRightGroup";
      # }
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
      "security.workspace.trust.enabled" = false;
      "explorer.confirmDelete" = false;
      "breadcrumbs.enabled" = false;
      "dev.containers.dockerPath"= "/etc/profiles/per-user/${user}/bin/podman-host"; #https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md
      # "vim.camelCaseMotion.enable" = true;
      # "vim.debug.silent" = true;
      # "vim.easymotion" = true;
      # "vim.enableNeovim" = true;
      # "vim.handleKeys" = {
      #   "<C-a>" = false;
      #   "<C-c>" = false;
      #   "<C-d>" = false;
      #   "<C-f>" = false;
      #   "<C-j>" = false;
      #   "<C-k>" = false;
      #   "<C-p>" = false;
      # };
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
      # "vim.normalModeKeyBindingsNonRecursive" = [
      #   {
      #     "before" = ["K"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.showHover";
      #         "args" = {
      #           "key" = "editor.action.showHover";
      #           "kind" = "editor";
      #         };
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["K" "K"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.showHover";
      #         "args" = {
      #           "key" = "editor.action.showHover";
      #           "kind" = "editor";
      #         };
      #       }
      #       "cursorDown"
      #     ];
      #   }
      #   {
      #     "before" = ["g" "d"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.goToDeclaration";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "D"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.goToDefinition";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "r"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.findReferences";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "I"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.goToImplementation";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "s"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.triggerSuggest";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "l"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.showDiagnostics";
      #         "args" = {};
      #       }
      #     ];
      #   }
      #   {
      #     "before" = ["g" "l" "g" "l"];
      #     "commands" = [
      #       {
      #         "command" = "editor.action.showDiagnostics";
      #         "args" = {};
      #       }
      #       "cursorDown"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<leader>"
      #       "m"
      #     ];
      #     "commands" = [
      #       "bookmarks.toggle"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<leader>"
      #       "b"
      #     ];
      #     "commands" = [
      #       "bookmarks.list"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<C-n>"
      #     ];
      #     "commands" = [
      #       "=nohl"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<C-x>"
      #     ];
      #     "commands" = [
      #       "=wq"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<leader>"
      #       "o"
      #     ];
      #     "after" = [
      #       "o"
      #       "<Esc>"
      #       "k"
      #     ];
      #     "silent" = true;
      #   }
      #   {
      #     "before" = [
      #       "<leader>"
      #       "O"
      #     ];
      #     "after" = [
      #       "O"
      #       "<Esc>"
      #       "j"
      #     ];
      #     "silent" = true;
      #   }
      #   {
      #     "before" = [
      #       "J"
      #     ];
      #     "after" = [
      #       "5"
      #       "j"
      #     ];
      #     "silent" = true;
      #   }
      #   {
      #     "before" = [
      #       "H"
      #     ];
      #     "after" = [
      #       "5"
      #       "h"
      #     ];
      #     "silent" = true;
      #   }
      #   {
      #     "before" = [
      #       "L"
      #     ];
      #     "after" = [
      #       "5"
      #       "l"
      #     ];
      #     "silent" = true;
      #   }
      #   {
      #     "before" = [
      #       ">"
      #     ];
      #     "commands" = [
      #       "editor.action.indentLines"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<"
      #     ];
      #     "commands" = [
      #       "editor.action.outdentLines"
      #     ];
      #   }
      # ];
      # "vim.visualModeKeyBindings" = [
      #   {
      #     "before" = [
      #       ">"
      #     ];
      #     "commands" = [
      #       "editor.action.indentLines"
      #     ];
      #   }
      #   {
      #     "before" = [
      #       "<"
      #     ];
      #     "commands" = [
      #       "editor.action.outdentLines"
      #     ];
      #   }
      # ];
      # "vim.visualModeKeyBindingsNonRecursive" = [
      #   {
      #     "before" = [
      #       "p"
      #     ];
      #     "after" = [
      #       "p"
      #       "g"
      #       "v"
      #       "y"
      #     ];
      #   }
      # ];
      # "vim.statusBarColorControl" = true;
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
      # "vim.autoSwitchInputMethod.enable" = true;
      # "vim.autoSwitchInputMethod.defaultIM" = "1";
      # "vim.autoSwitchInputMethod.obtainIMCmd" = "/usr/bin/fcitx5-remote";
      # "vim.autoSwitchInputMethod.switchIMCmd" = "/usr/bin/fcitx5-remote -t {im}";

      # "vim.highlightedyank.enable" = true;
      # "vim.leader" = "<space>";
      # "vim.incsearch" = true;
      # "vim.useSystemClipboard" = true;
      # "vim.useCtrlKeys" = true;
      # "vim.hlsearch" = true;
    };
  };
}
