#!/usr/bin/env bash
# auto starting apps
killall -q polkit-gnome-authentication-agent-1 waybar dunst
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
waybar -c ~/.config/waybar/river/config-river -s ~/.config/waybar/river/river_style.css &
dunst -config ~/.config/dunst/dunstrc &
sh ~/.config/system_scripts/pkill_bc &
swayidle -w timeout 900 ~/.config/system_scripts/wayland_session_lock &
fcitx5 &
