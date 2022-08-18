#!/bin/bash
a=1
if [[ $a -eq 1 ]]; then
    killall -SIGUSR1 waybar
    sed -i '2c a=0' ~/.config/system_scripts/hideWayBar.sh
else
    killall -SIGUSR2 waybar
    sed -i '2c a=1' ~/.config/system_scripts/hideWayBar.sh
fi
