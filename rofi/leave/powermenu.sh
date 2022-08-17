#!/usr/bin/env bash

# Options
shutdown=""
reboot=""
lock=""
suspend=""
hibernate="﫭"
logout=""

# Variable passed to rofi
choice=$(printf "$shutdown\n$reboot\n$logout\n$suspend\n$hibernate" | rofi -dmenu -theme $HOME/.config/rofi/leave/logmenu.rasi)
if [[ $choice == "$hibernate" ]];then
    systemctl hibernate
    #bash ~/.config/system_scripts/wayland_session_lock
elif [[ $choice == "$logout" ]];then
    pkill -KILL -u "$USER"
elif [[ $choice == "$suspend" ]];then
    systemctl suspend
elif [[ $choice == "$reboot" ]];then
    systemctl reboot
elif [[ $choice == "$shutdown" ]];then
    systemctl poweroff
fi
