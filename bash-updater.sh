#!/bin/bash
sudo pacman -Syyu
yay
notify-send -a 'System Updater' -i /home/alzy/.local/share/icons/Papirus/64x64/apps/software-store.svg 'Update Completed' 'Restart is recommended'
paplay /usr/share/sounds/Oxygen-K3B-Finish-Success.ogg
