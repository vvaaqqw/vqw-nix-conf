{
  lib,
  pkgs,
  config,
  ...
}:let
	yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
		hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
	};
in
 {
  home.file.".config/yazi/plugins/smart-paste.yazi/main.lua".source = ./plugins/smart-paste-init.lua;
  home.file.".config/yazi/plugins/arrow.yazi/main.lua".source = ./plugins/arrow-init.lua;
  # config
  home.file = {
    ".config/yazi/yazi.toml".source = ./yazi.toml;
    ".config/yazi/keymap.toml".source = ./keymap.toml;
    ".config/yazi/theme.toml".source = ./theme.toml;
  }; 

  home.packages = lib.attrValues {
    inherit
      (pkgs)
      exiftool
      mediainfo
      ;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    #enableNushellIntegration = true;
    # https://yazi-rs.github.io/docs/configuration/keymap
    # https://yazi-rs.github.io/docs/quick-start/#keybindings
    # https://github.com/sxyazi/yazi/blob/latest/yazi-config/preset/keymap.toml
    plugins = {
			# chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
			max-preview = "${yazi-plugins}/max-preview.yazi";
			smart-enter = "${yazi-plugins}/smart-enter.yazi";
      smart-filter =  "${yazi-plugins}/smart-filter.yazi";
      hide-preview =  "${yazi-plugins}/hide-preview.yazi";
      jump-to-char =  "${yazi-plugins}/jump-to-char.yazi";
      git = "${yazi-plugins}/git.yazi";
 			compress = pkgs.fetchFromGitHub {
			  owner = "KKV9";
			  repo = "compress.yazi";
			  rev = "60b24af23d1050f1700953a367dd4a2990ee51aa";
			  hash = "sha256-Yf5R3H8t6cJBMan8FSpK3BDSG5UnGlypKSMOi0ZFqzE=";
			};
			 bookmarks = pkgs.fetchFromGitHub {
				owner = "dedukun";
				repo = "bookmarks.yazi";
				rev = "95b2c586f4a40da8b6a079ec9256058ad0292e47";
				sha256 = "sha256-cNgcTa8s+tTqAvF10fmd+o5PBludiidRua/dXArquZI=";
			};
		};

		initLua = ''
    local catppuccin_palette = {
  	rosewater = "#f4dbd6",
  	flamingo = "#f0c6c6",
  	pink = "#f5bde6",
  	mauve = "#c6a0f6",
  	red = "#ed8796",
  	maroon = "#ee99a0",
  	peach = "#f5a97f",
  	yellow = "#eed49f",
  	green = "#a6da95",
  	teal = "#8bd5ca",
  	sky = "#91d7e3",
  	sapphire = "#7dc4e4",
  	blue = "#8aadf4",
  	lavender = "#b7bdf8",
  	text = "#cad3f5",
  	subtext1 = "#b8c0e0",
  	subtext0 = "#a5adcb",
  	overlay2 = "#939ab7",
  	overlay1 = "#8087a2",
  	overlay0 = "#6e738d",
  	surface2 = "#5b6078",
  	surface1 = "#494d64",
  	surface0 = "#363a4f",
  	base = "#24273a",
  	mantle = "#1e2030",
  	crust = "#181926",
  }

  -- Plugins
  require("full-border"):setup({
  	type = ui.Border.PLAIN,
  })


  require("git"):setup()
      '';
        # https://yazi-rs.github.io/docs/configuration/theme
        # https://github.com/sxyazi/yazi/blob/latest/yazi-config/preset/yazi.toml
        # https://yazi-rs.github.io/docs/configuration/yazi
        # https://github.com/sxyazi/yazi/blob/latest/yazi-config/preset/yazi.toml
  };
}
