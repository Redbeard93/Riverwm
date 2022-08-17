#!/bin/bash
a=1
if [[ $a -eq 1 ]]; then
    sudo vbetool dpms off
    sed -i '2c a=0' ~/.config/system_scripts/displaymanager.sh
else
    sudo vbetool dpms on
    sed -i '2c a=1' ~/.config/system_scripts/displaymanager.sh
fi
