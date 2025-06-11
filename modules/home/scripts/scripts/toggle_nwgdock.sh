#!/usr/bin/env bash

SERVICE=".nwg-dock-hyprl"

if pgrep -x "$SERVICE" >/dev/null
then
  pkill -9 nwg-dock-hyprl
else
  runbg nwg-dock-hyprland -r -i 32 -w 5 -mb 10 -ml 10 -mr 10 -nolauncher
fi
