{...}: {
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 24;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
      #"mpris"
    ];
    modules-center = [
      "clock"
      "idle_inhibitor"
      "tray"
      "privacy"
      "wireplumber"
      "battery"
    ];
    modules-right = [
      "cpu"
      "memory"
      "disk"
      "network"
      "custom/notification"
    ];
    clock = {
      calendar = {
        format = {today = "<span color='#98971A'><b>{}</b></span>";};
      };
      format = "  {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "  {:%m/%d}";
    };
    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "";
        deactivated = "";
      };
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "一";
        "2" = "二";
        "3" = "三";
        "4" = "亖";
        "5" = "武";
        "6" = "琉";
        "7" = "柒";
        "8" = "魃";
        "9" = "玖";
        "10" = "∅";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "10" = [];
      };
    };
    bluetooth = {
      format = "{status}";
      format-connected = "{device_alias}";
      format-connected-battery = "{device_alias}>{device_battery_percentage}%";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = " {usage}%";
      format-alt = " {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      # path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "󰶡{bandwidthDownOctets:>} 󰶣{bandwidthUpOctets:>}";
      format-ethernet = "󰈀 {bandwidthDownOctets:>}󰶡 {bandwidthUpOctets:>}󰶣";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    privacy = {
      icon-spacing = 4;
      icon-size = 18;
      transition-duration = 250;
      modules = [
        {
          type = "screenshare";
          tooltip = true;
          tooltip-icon-size = 24;
        }
        {
          type = "audio-out";
          tooltip = true;
          tooltip-icon-size = 24;
        }
        {
          type = "audio-in";
          tooltip = true;
          tooltip-icon-size = 24;
        }
      ];
    };
    wireplumber = {
      format = "{icon} {volume}%";
      format-muted = "  {volume}%";
      format-icons = ["" "" " "];
      scroll-step = 2;
      on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      # on-click = "kitty --class=floating_waybar -e pulsemixer";
      on-click-right = "pavucontrol";
      ignored-sinks = ["Easy Effects Sink" "Monitor of Easy Effects Sink"];
    };

    battery = {
      format = "{icon} {capacity}%";
      # format-icons = [" " " " " " " " " " ];
      format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "custom/launcher" = {
      format = "";
      on-click = "rofi -show drun";
      on-click-right = "wallpaper-picker";
      tooltip = "false";
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon} ";
      format-icons = {
        notification = "<span foreground='red'><sup></sup></span>  ";
        none = "  ";
        dnd-notification = "<span foreground='red'><sup></sup></span>  ";
        dnd-none = "  ";
        inhibited-notification = "<span foreground='red'><sup></sup></span>  ";
        inhibited-none = "  ";
        dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>  ";
        dnd-inhibited-none = "  ";
      };
      mpris = {
        format = "{player_icon} {dynamic}";
        format-paused = " {status_icon} <i>{dynamic}</i>";
        ellipsis = "...";
        dynamic-separator = ">";
        dynamic-len = 20;
        dynamic-importance-order = ["title" "position" "length" "artist" "album"];
        player-icons = {
          default = "☵㵵";
          mpv = "🌊䪫";
        };
        status-icons = {
          paused = "澂";
        };
        ignored-players = ["firefox" "librewolf" "chromium"];
      };

      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
  };
}
