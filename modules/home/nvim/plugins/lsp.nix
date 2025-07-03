{lib,...}:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      
      servers = {
        ts_ls = {
          enable = true; # TS
          filetypes = [ "typescript" "typescriptreact" "typescript.tsx" ];
        };
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        emmet_ls = {
          enable = true;
          filetypes = [ "html" "css" "scss" "javascript" "javascriptreact" "typescript" "typescriptreact" "svelte" "vue" ];
        };
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        yamlls.enable = true; # YAML
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
          installRustfmt = true;
        };
      };
    };

    lsp-format = {
      enable = true;
    };

    lsp-status = {
      enable = true;
    };

    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          neorg = "[neorg]";
        };
      };
    };

    lualine = {
      enable = true;
    };

    trouble = {
      enable = true;
      settings = {
        multiline = true;
      };
    };
  };
}

