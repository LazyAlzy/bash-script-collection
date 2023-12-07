#!/bin/bash

SOURCE=/home/$USER

DEST=/media/SanDisk

if [ -d $DEST ]; then
    echo -e "\n Now Synchronising Documents/\n=====================================" 
    rsync -ruv $SOURCE/Documents $DEST/

    echo -e "\n Now Synchronising Downloads/\n====================================="
    rsync -ruv $SOURCE/Downloads $DEST/

    echo -e "\n Now Synchronising Passwords/\n====================================="
    rsync -ruv $SOURCE/.keepassxc $DEST/

    echo -e "\n Now Synchronising BashRC/\n====================================="
    rsync -ruv $SOURCE/.bashrc $DEST/

    echo -e "\n Now Reversing Operations\n====================================="
    rsync -ruv $DEST/* $SOURCE/

    notify-send -a 'File Synchroniser' -i /home/alzy/.local/share/icons/Papirus/64x64/apps/synology-cloud-station-drive.svg 'Update Completed' 'Restart is recommended'
    paplay /usr/share/sounds/Oxygen-K3B-Finish-Success.ogg
else
    echo -e "Folder not mounted"
fi