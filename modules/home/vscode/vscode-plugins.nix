{...}:
{
  programs.vscode = {
    profiles.default.extensions = with pkgs.vscode-extensions;
      [
        vscodevim.vim
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
  };
}
