#!/usr/bin/env bash
# auto starting apps
killall -q waybar dunst nm-applet
waybar -c ~/.config/waybar/river/config-river -s ~/.config/waybar/river/river_style.css &
dunst -config ~/.config/dunst/dunstrc &
sh ~/.config/system_scripts/pkill_bc &
nm-applet --indicator &
swayidle -w timeout 300 ~/.config/system_scripts/wayland_session_lock &
