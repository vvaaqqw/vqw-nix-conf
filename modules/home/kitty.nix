{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    themeFile = "GruvboxMaterialDarkHard";

    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.85";
      window_padding_width = 10;
      scrollback_lines = 20000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      active_tab_foreground = "#FBF1C7";
      active_tab_background = "#7C6F64";
      inactive_tab_foreground = "#FBF1C7";
      inactive_tab_background = "#3C3836";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
      "alt+6" = "goto_tab 6";
      "alt+7" = "goto_tab 7";
      "alt+8" = "goto_tab 8";
      "alt+9" = "goto_tab 9";

      "ctrl+shift+up" = "increase_font_size";
      "ctrl+shift+down" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";

      "shift+page_up" = "scroll_page_up";
      "shift+page_down" = "scroll_page_down";
      "shift+up" = "scroll_line_up";
      "shift+down" = "scroll_line_down";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
