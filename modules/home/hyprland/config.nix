{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    settings = {
      # TODO: easyfocus
      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "nm-applet &"
        #"blueman-applet &" #works only on x11
        # start fcitx
        "fcitx5 -dr"
        #udiskie
        "udiskie -s"
        "wl-clip-persist --clipboard both"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprctl setcursor Bibata-Original-Classic 19 &"
        "poweralertd &"
        "waybar &"
        "swaync &"
        #"${pkgs.hyprpanel}/bin/hyprpanel"
        "wl-paste --watch cliphist store &"
        "hyprlock"
        # workaround for brightness being reset on root rollback (impermanence)
        "brightness set 66%"
        "flatpak run com.jianguoyun.Nutstore" #nutstore

        ## App auto start
        "[workspace 10 silent] easyeffects"
        #"[workspace 9 silent] sirikali" #mount gocryptfs
        "[workspace 6 silent] sleep 6 && vesktop" #discord
        #"[workspace 4 silent] thunderbird" #email
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
        workspace_swipe_distance = 700;
        workspace_swipe_fingers = 4;
        workspace_swipe_cancel_ratio = 0.2;
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 0;
      };

      input = {
        kb_layout = "us";
        # self explanatory, I hope?
        follow_mouse = 1;
        # do not imitate natural scroll
        touchpad.natural_scroll = "no";
        touchpad.disable_while_typing = true;
        touchpad.clickfinger_behavior = true;
        # ez numlock enable
        numlock_by_default = true;
        scroll_method = "2fg";
        kb_options = "grp:alt_caps_toggle";
        float_switch_override_focus = 0;
        mouse_refocus = 0;
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 1;
        "col.active_border" = "rgb(98971a) rgb(cc241d) 45deg";
        #"col.active_border" = "rgb(00ffff)";
        "col.inactive_border" = "0x00000000";
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = false;
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
          sharp = false;
          ignore_window = true;
          offset = "0 2";
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, Return, exec, kitty"
        "$mainMod ALT, Return, exec, kitty --title float_kitty"
        "$mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        # "$mainMod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'"
        #"$mainMod SHIFT, B, exec, toggle_waybar"
        "$mainMod, Z, movetoworkspacesilent,10" # move to 10 as a way to minimize
        "$mainMod, X, killactive,"
        "$mainMod, C, fullscreen, 1"
        #"$mainMod SHIFT, C, fullscreen, 1"
        "$mainMod ALT, C, fullscreen, 1"
        "$mainMod SHIFT,M,exec,hyprctl keyword $kw $(($(hyprctl getoption $kw -j | jaq -r '.int') ^ 1))" # toggle no_gaps_when_only
        "Alt,Tab, cyclenext"
        "Alt, Tab, bringactivetotop" # bring it to the top
        "Alt SHIFT,Tab, cyclenext,prev"
        "Alt SHIFT,Tab, bringactivetotop" # bring it to the top
        # workspace controls
        "$mainMod SHIFT,right,movetoworkspace,+1" # move focused window to the next ws
        "$mainMod SHIFT,left,movetoworkspace,-1" # move focused window to the previous ws
        "$mainMod,mouse_down,workspace,e+1" # move to the next ws
        "$mainMod,mouse_up,workspace,e-1" # move to the previous ws

        # focus controls
        "$mainMod, left, workspace,e-1"
        "$mainMod, right,workspace,e+1"
        "$mainMod, up, movefocus, u" # move focus to the window above
        "$mainMod, down, movefocus, d" # move focus to the window below
        "$mainMod, H, movefocus, l" # move focus to the window on the left
        "$mainMod, L, movefocus, r" # move focus to the window on the right
        "$mainMod, K, movefocus, u" # move focus to the window above
        "$mainMod, J, movefocus, d" # move focus to the window below

        "$mainMod SHIFT, H, movewindoworgroup, l" # move window left
        "$mainMod SHIFT, L, movewindoworgroup, r" # move window right
        "$mainMod SHIFT, K, movewindoworgroup, u" # move window above
        "$mainMod SHIFT, J, movewindoworgroup, d" # move window below

        "$mainMod ALT, H, changegroupactive, b" # focus with group 
        "$mainMod ALT, L, changegroupactive, f" #  focus with group 

        "$mainMod ALT, 1, changegroupactive, 1" #
        "$mainMod ALT, 2, changegroupactive, 2" #
        "$mainMod ALT, 3, changegroupactive, 3" #
        "$mainMod ALT, 4, changegroupactive, 4" #
        "$mainMod ALT, 5, changegroupactive, 5" #
        "$mainMod ALT, 6, changegroupactive, 6" #
        "$mainMod ALT, 7, changegroupactive, 7" #
        "$mainMod ALT, 8, changegroupactive, 8" #
        "$mainMod ALT, 9, changegroupactive, 9" #
        "$mainMod ALT, 0, changegroupactive, 0" #

        "$mainMod, E, exec, kitty -e yazi"
        "$mainMod SHIFT, E, exec, dolphin"
        #dropdown term
        "$mainMod, T, exec, hdrop -c kitty_kt -f -p r -h 60 -w 49 'kitty --class kitty_kt'"
        #dropdown yazi
        "$mainMod, R, exec, hdrop -c kitty_yz -f -p r -h 60 -w 49 'kitty --class kitty_yz -e yazi'"
        #dropdown music
        "$mainMod, M, exec, hdrop -c kitty_mfx -f -p r -h 60 -w 49 'kitty --class kitty_mfx -e musicfox'"
        #dropdown pass
        "$mainMod, P, exec, hdrop -f -i -p r -h 70 -w 50 keepassxc"
        # "$mainMod, P, exec, keepassxc"
        #dropdown browser
        "$mainMod, N, exec, hdrop -f -i -p l -h 90 -w 51 firefox"

        "$mainMod,G,exec, zen" # zen-browser

        "$mainMod, Space, togglefloating,"
        #"$mainMod, Space, centerwindow,"
        "$mainMod, Space, resizeactive, exact 950 600"
        "$mainMod, W, exec, killall rofi || run-as-service $(rofi -combi-modi window,ssh -show combi -show-icons)" # show windows
        #"$mainMod,W,exec, pypr expose" #expose show windows
        "$mainMod,D,exec, killall rofi || run-as-service $(rofi -combi-modi drun,ssh -show combi -show-icons)" # application launcher

        #"$mainMod SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'"
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        # "$mainMod ALT, Escape, exec, hyprlock"
        "$mainMod ALT, Escape, exec, swaylock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod, U, togglesplit,"
        "$mainMod,I,togglegroup," # group focused window
        "$mainMod,O,changegroupactive," # switch within the active group
        "$mainMod SHIFT, O, exec, toggle_oppacity"
        "$mainMod SHIFT, P ,exec, hyprpicker -a"
        "$mainMod , V, pseudo," # 切换伪 tiling 模式，伪 tiling 模式的窗口保持它们浮动时的大小
        "$mainMod SHIFT, W,exec, wallpaper-picker"
        #"$mainMod ALT, W, exec, vm-start"
        # "$mainMod, N, exec, swaync-client -t -sw"

        # screenshot
        "$mainMod, Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --cursor --freeze copy area"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod CTRL, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mainMod CTRL, 2, movetoworkspacesilent, 2"
        "$mainMod CTRL, 3, movetoworkspacesilent, 3"
        "$mainMod CTRL, 4, movetoworkspacesilent, 4"
        "$mainMod CTRL, 5, movetoworkspacesilent, 5"
        "$mainMod CTRL, 6, movetoworkspacesilent, 6"
        "$mainMod CTRL, 7, movetoworkspacesilent, 7"
        "$mainMod CTRL, 8, movetoworkspacesilent, 8"
        "$mainMod CTRL, 9, movetoworkspacesilent, 9"
        "$mainMod CTRL, 0, movetoworkspacesilent, 10"
        # "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, h"
        "$mainMod SHIFT, right, movewindow, l"
        "$mainMod SHIFT, up, movewindow, k"
        "$mainMod SHIFT, down, movewindow, j"
        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 1"
        ",XF86AudioLowerVolume,exec, pamixer -d 1"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "$mainMod, Q, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # binds that will be repeated, a.k.a can be held to toggle multiple times
      binde = [
        # volume controls
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

        # brightness controls
        '',XF86MonBrightnessUp,exec,ags --run-js "brightness.screen += 0.05"''
        '',XF86MonBrightnessDown,exec, ags --run-js "brightness.screen -= 0.05"''
      ];

      # binds that are locked, a.k.a will activate even while an input inhibitor is active
      bindl = [
        # media controls
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioPrev,exec,playerctl previous"
        ",XF86AudioNext,exec,playerctl next"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      # windowrule
      windowrule = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "opacity 1.0 override 1.0 override, class:(floorp)"
        "opacity 1.0 override 1.0 override, class:(evince)"
        # only allow shadows for floating windows
        "noshadow, floating:0"

        "float,class:udiskie"
        "fullscreen,class:wlogout"
        "fullscreen,title:wlogout"

        # telegram media viewer
        "float, title:^(Media viewer)$"
        # dialog
        "float, title:^(Open File)(.*)$"
        "float, title:^(Select a File)(.*)$"
        "float, title:^(Open Folder)(.*)"
        "float, title:^(Save As)(.*)$"

        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit focus, class:^(kitty)$"
        "idleinhibit focus,class:foot"

        "idleinhibit fullscreen, class:^(firefox)$"
        "idleinhibit fullscreen, class:^(zen)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        # pavucontrol
        "float,class:pavucontrol"
        "float,title:^(Volume Control)$"
        "size 800 600,title:^(Volume Control)$"
        # "move 75 44%,title:^(Volume Control)$"
        "float, class:^(imv)$"

        "workspace 10, class:^(easyeffects)$"
        "workspace 4, class:^(Aseprite)$"
        "workspace 4, class:^(Gimp-2.10)$"
        "workspace 5, class:^(Audacious)$"
        "workspace 5, class:^(Spotify)$"
        "workspace 4, class:^(discord)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(zenity)$"
        "center,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "size 850 500,title:^(File Upload)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

          # 浮动窗口规则
         "float,class:^(qView)$"
         "center,class:^(qView)$"
         "float,class:^(imv)$"
         "center,class:^(imv)$"
         "float,class:^(mpv)$"
         "center,class:^(mpv)$"
         "tile,class:^(Aseprite)$"
         "float,title:^(float_kitty)$"
         "center,title:^(float_kitty)$"
         "size 950 600,title:^(float_kitty)$"
         "float,class:^(audacious)$"
         "pin,class:^(rofi)$"
         "tile,class:^(neovide)$"
         "idleinhibit focus,class:^(mpv)$"
         "float,class:^(udiskie)$"
         # 窗口定位规
         "float,title:^(Transmission)$"
         "float,title:^(Volume Control)$"
         "size 700 450,title:^(Volume Control)$"
         "move 40 55%,title:^(Volume Control)$"
         "float,title:^(Firefox — Sharing Indicator)$"
         "move 0 0,title:^(Firefox — Sharing Indicator)$"
         "float,title:^(Zen — Sharing Indicator)$"
         "move 0 0,title:^(Zen — Sharing Indicator)$"
         # Waylyrics歌词悬浮
         "float,title:^(Waylyrics)$"
         "pin,title:^(Waylyrics)$"
         "noborder,title:^(Waylyrics)$"
         "noshadow,title:^(Waylyrics)$"
         "noblur,title:^(Waylyrics)$"
         "size 100% 10%,title:^(Waylyrics)$"
         "move 0 90%,title:^(Waylyrics)$"
         "nofocus,title:^(Waylyrics)$"
         "animation slide,title:^(Waylyrics)$"
         # 其他增强规
         "opacity 1.0 override 1.0 override,class:^(Aseprite)$"
         "opacity 1.0 override 1.0 override,class:^(Unity)$"
         "opacity 1.0 override 1.0 override,class:^(floorp)$"
         "opacity 1.0 override 1.0 override,class:^(evince)$"
         "noshadow,floating:0"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto
      bind = SUPER, TAB, hyprexpo:expo, toggle 
      $scratchpadsize = size 80% 85%

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
