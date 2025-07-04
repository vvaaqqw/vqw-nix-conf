{
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      librewolf = {
        executable = "${pkgs.librewolf}/bin/librewolf";
        profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
        extraArgs = [
          # Required for U2F USB stick
          "--ignore=private-dev"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
        ];
      };

      vesktop = {
        executable = "${lib.getBin pkgs.vesktop}/bin/vesktop";
        profile = "${pkgs.firejail}/etc/firejail/discord.profile";
      };

      vscode = {
        executable = "${lib.getBin pkgs.vscode-fhs}/bin/code";
        profile = "${pkgs.firejail}/etc/firejail/code.profile";
      };
      zen = {
        executable = "${lib.getBin inputs.zen-browser}/bin/zen";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
      };
      # slack = {
      #   executable = "${lib.getBin pkgs.slack}/bin/slack";
      #   profile = "${pkgs.firejail}/etc/firejail/slack.profile";
      # };
      # telegram-desktop = {
      #   executable = "${lib.getBin pkgs.tdesktop}/bin/telegram-desktop";
      #   profile = "${pkgs.firejail}/etc/firejail/telegram-desktop.profile";
      # };
      # signal-desktop = {
      #   executable = "${pkgs.signal-desktop}/bin/signal-desktop";
      # profile = "${pkgs.firejail}/etc/firejail/signal-desktop.profile";
      # extraArgs = [
      #   "--env=LC_ALL=C"
      # ];
      # };
    };
  };
}
