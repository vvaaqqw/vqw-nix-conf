{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # 确保只启动一个 hyprlock 实例
        before_sleep_cmd = "loginctl lock-session"; # 挂起前锁定会话
        after_sleep_cmd = "hyprctl dispatch dpms on"; # 唤醒后打开显示器
        ignore_dbus_inhibit = false; # 尊重 DBus 抑制（例如视频播放时不锁屏）
      };

      listener = [
        {
          timeout = 300; # 5 分钟后触发
          on-timeout = "brightnessctl -s set 15"; # 调整亮度到15
          on-resume = "brightnessctl -r"; # 恢复亮度
        }
        {
          timeout = 900; # 15 分钟后触发
          on-timeout = "hyprlock"; # 运行 hyprlock 锁屏
        }
        {
          timeout = 1200; # 20 分钟后触发
          on-timeout = "hyprctl dispatch dpms off"; # 关闭显示器
          on-resume = "hyprctl dispatch dpms on"; # 恢复时打开显示器
        }
        # {
        #   timeout = 1800; # 30 分钟后触发
        #   on-timeout = "systemctl suspend"; # 挂起系统
        # }
      ];
    };
  };
}
