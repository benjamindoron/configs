#!/bin/bash

function syntax {
    echo "Usage: $0 [nouveau|nvidia]"
    exit 0
}

if [ -z "${1}" ]; then
    syntax
elif [ "x${1}" == "xnouveau" ]; then
    sudo sed -i 's/rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1/rd.driver.blacklist=nvidia modprobe.blacklist=nvidia/' /etc/default/grub
    sudo sed -i 's/^WaylandEnable=false/#WaylandEnable=false/' /etc/gdm/custom.conf
elif [ "x${1}" == "xnvidia" ]; then
    sudo sed -i 's/rd.driver.blacklist=nvidia modprobe.blacklist=nvidia/rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1/' /etc/default/grub
    sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' /etc/gdm/custom.conf
else
    syntax
fi

grub2-mkconfig -o /etc/grub2-efi.cfg

echo ""
echo "$1 has been set as the graphics driver. Restart to apply changes..."
