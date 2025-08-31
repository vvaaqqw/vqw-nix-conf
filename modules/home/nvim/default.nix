{...}: {
  imports =
    [(import ./cmp.nix)]
    ++ [(import ./plugins/telescope.nix)]
    ++ [(import ./plugins/lsp.nix)]
    ++ [(import ./plugins/git.nix)]
    ++ [(import ./plugins/whichkeys.nix)]
    ++ [(import ./plugins/commonplg.nix)]
    ++ [(import ./plugins/lazygit.nix)]
    ++ [(import ./plugins/treesitter.nix)];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    # extraConfigLua = "";
    opts = {
      # number = true;
      relativenumber = true;
      mouse = "a"; # mouse control
      mousemodel = "extend";
      swapfile = false;
      undofile = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      autoindent = true;
      completeopt = ["menu" "menuone" "noselect"];
      termguicolors = true;
      incsearch = true;
      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      spell = false; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping
    };

    clipboard.providers.wl-copy.enable = true;
    clipboard.register = "unnamedplus"; # system clclipboard

    colorschemes.gruvbox-material-nvim = {
      enable = true;
    };

    # TODO
    highlight.Todo = {
      fg = "Blue";
      bg = "Yellow";
    };
    match.TODO = "TODO";

    dependencies = {
      chafa.enable = true;
      imagemagick.enable = true;
    };
  };
}
