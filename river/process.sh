#!/usr/bin/env bash
# auto starting apps
killall -q polkit-gnome-authentication-agent-1 waybar  dunst # nm-applet
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
waybar -c ~/.config/waybar/river/config-river -s ~/.config/waybar/river/river_style.css &
dunst -config ~/.config/dunst/dunstrc &
sh ~/.config/system_scripts/pkill_bc &
# nm-applet --indicator &
# swayidle -w timeout 1800 ~/.config/system_scripts/wayland_session_lock &
swayidle -w\
    timeout 1800 'sudo vbetool dpms off; sed -i "2c a=0" ~/.config/system_scripts/displaymanager.sh' &
fcitx5 &
