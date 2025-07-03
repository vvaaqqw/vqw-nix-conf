{lib,...}:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      keymaps = [
      {
    key = "gd";
    lspBufAction = "definition";
  }
  {
    key = "gD";
    lspBufAction = "references";
  }
  {
    key = "gt";
    lspBufAction = "type_definition";
  }
  {
    key = "gi";
    lspBufAction = "implementation";
  }
  {
    key = "K";
    lspBufAction = "hover";
  }
  {
    action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
    key = "<leader>k";
  }
  {
    action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
    key = "<leader>j";
  }
  {
    action = "<CMD>LspStop<Enter>";
    key = "<leader>lx";
  }
  {
    action = "<CMD>LspStart<Enter>";
    key = "<leader>ls";
  }
  {
    action = "<CMD>LspRestart<Enter>";
    key = "<leader>lr";
  }
  {
    action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
    key = "gd";
  }
  {
    action = "<CMD>Lspsaga hover_doc<Enter>";
    key = "K";
  }
      ];
      
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

