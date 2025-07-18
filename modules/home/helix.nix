{
  config,
  pkgs,
  ...
}: {
  programs.helix = with pkgs; {
    enable = true;
    defaultEditor = false;
    extraPackages = [
      bash-language-server
      biome
      clang-tools
      docker-compose-language-service
      dockerfile-language-server-nodejs
      golangci-lint
      golangci-lint-langserver
      gopls
      gotools
      helix-gpt
      marksman
      nil
      nixpkgs-fmt
      nodePackages.prettier
      nodePackages.typescript-language-server
      pgformatter
      (python3.withPackages (p: (with p; [
        black
        isort
        python-lsp-black
        python-lsp-server
      ])))
      rust-analyzer
      taplo
      taplo-lsp
      terraform-ls
      typescript
      vscode-langservers-extracted
      yaml-language-server
    ];

    settings = {
      theme = "gruvbox_community";

      editor = {
        color-modes = true;
        cursorline = true;
        bufferline = "multiple";

        soft-wrap.enable = true;

        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
          ignore = false;
        };

        indent-guides = {
          character = "┊";
          render = true;
          skip-levels = 1;
        };
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };

        statusline = {
          left = ["mode" "file-name" "spinner" "read-only-indicator" "file-modification-indicator"];
          right = ["diagnostics" "selections" "register" "file-type" "file-line-ending" "position"];
          mode.normal = "";
          mode.insert = "I";
          mode.select = "S";
        };
      };

      # keys = {
      #   normal = {
      #     y = "yank_to_clipboard";
      #     x = "extend_to_line_bounds";
      #     T = "extend_till_char";
      #     F = "extend_next_char";
      #     M = ["select_mode" "match_brackets" "normal_mode"];
      #     left = "goto_previous_buffer";
      #     right = "goto_next_buffer";
      #     c = "change_selection_noyank";
      #     d = "delete_selection_noyank";
      #     C-d = ["page_cursor_half_down" "align_view_center"];
      #     C-u = ["page_cursor_half_up" "align_view_center"];
      #     tab = "move_parent_node_end";
      #     S-tab = "move_parent_node_start";

      #     g = {
      #       j = "goto_last_line";
      #       k = "goto_file_start";
      #       c = "toggle_comments";
      #       e = "goto_last_line";
      #       h = "goto_line_start";
      #       l = "goto_line_end";
      #       y = "goto_type_definition";
      #       n = "goto_next_buffer";
      #     };

      #     space = {
      #       x = ":buffer-close";
      #       A-f = ":toggle auto-format";
      #       e = ":config-open";
      #     };
      #   };

      #   insert = {
      #     C-u = ["extend_to_line_bounds" "delete_selection_noyank" "open_above"];
      #     C-w = ["move_prev_word_start" "delete_selection_noyank"];
      #     C-space = "completion";
      #     S-tab = "move_parent_node_start";
      #   };

      #   select = {
      #     tab = "extend_parent_node_end";
      #     S-tab = "extend_parent_node_start";
      #     y = "yank_to_clipboard";

      #     g = {
      #       j = "goto_last_line";
      #       k = "goto_file_start";
      #     };
      #   };
      # };
    };

    themes = {
      # https://github.com/helix-editor/helix/blob/master/runtime/themes/gruvbox.toml
      gruvbox_community = {
        inherits = "gruvbox";
        "variable" = "blue1";
        "variable.parameter" = "blue1";
        "function.macro" = "red1";
        "operator" = "orange1";
        "comment" = "gray";
        "constant.builtin" = "orange1";
        "ui.background" = {};
      };
    };

    languages = {
      language-server.biome = {
        command = "biome";
        args = ["lsp-proxy"];
      };

      language-server.gpt = {
        command = "helix-gpt";
        args = ["--handler" "copilot"];
      };

      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };

      language-server.yaml-language-server.config.yaml.schemas = {
        kubernetes = "k8s/*.yaml";
      };

      language-server.typescript-language-server.config.tsserver = {
        path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js";
      };

      language = [
        {
          name = "css";
          language-servers = ["vscode-css-language-server" "gpt"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.css"];
          };
          auto-format = true;
        }
        {
          name = "go";
          language-servers = ["gopls" "golangci-lint-lsp" "gpt"];
          formatter = {
            command = "goimports";
          };
          auto-format = true;
        }
        {
          name = "html";
          language-servers = ["vscode-html-language-server" "gpt"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.html"];
          };
          auto-format = true;
        }
        {
          name = "javascript";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome"
            "gpt"
          ];
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = ["format"];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.json"];
          };
          auto-format = true;
        }
        {
          name = "jsonc";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = ["format"];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.jsonc"];
          };
          file-types = ["jsonc" "hujson"];
          auto-format = true;
        }
        {
          name = "jsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.jsx"];
          };
          auto-format = true;
        }
        {
          name = "markdown";
          language-servers = ["marksman" "gpt"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.md"];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
        {
          name = "python";
          language-servers = ["pylsp" "gpt"];
          formatter = {
            command = "sh";
            args = ["-c" "isort --profile black - | black -q -"];
          };
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = ["rust-analyzer" "gpt"];
          auto-format = true;
        }
        {
          name = "scss";
          language-servers = ["vscode-css-language-server" "gpt"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.scss"];
          };
          auto-format = true;
        }
        {
          name = "sql";
          language-servers = ["gpt"];
          formatter = {
            command = "pg_format";
            args = ["-iu1" "--no-space-function" "-"];
          };
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = ["taplo"];
          formatter = {
            command = "taplo";
            args = ["fmt" "-o" "column_width=120" "-"];
          };
          auto-format = true;
        }
        {
          name = "tsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.tsx"];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome"
            "gpt"
          ];
          formatter = {
            command = "biome";
            args = ["format" "--indent-style" "space" "--stdin-file-path" "file.ts"];
          };
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = ["yaml-language-server"];
          formatter = {
            command = "prettier";
            args = ["--stdin-filepath" "file.yaml"];
          };
          auto-format = true;
        }
      ];
    };
  };
}
