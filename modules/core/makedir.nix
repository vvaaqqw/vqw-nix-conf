# makedir if it doesn't exist
{ ... }:
{
  systemd.tmpfiles.rules = [
        "d /home/spectre/Pictures/wallpapers 0770 spectre users -"
        "d /home/spectre/Pictures/wallpapers/others 0770 spectre users -"
        "d /home/spectre/Pictures/Screenshots 0770 spectre users -"
  ];
}
