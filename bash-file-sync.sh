#!/bin/bash

SOURCE=/home/$USER

DEST=#/path/to/drive

if [ -d $DEST ]; then
    echo -e "\n Now Synchronising Documents/\n=====================================" 
    rsync -Pruv $SOURCE/Documents $DEST/

    echo -e "\n Now Synchronising Downloads/\n====================================="
    rsync -Pruv $SOURCE/Downloads $DEST/

    echo -e "\n Now Synchronising Passwords/\n====================================="
    rsync -Pruv $SOURCE/.keepassxc $DEST/

    echo -e "\n Now Synchronising BashRC/\n====================================="
    rsync -Pruv $SOURCE/.bashrc $DEST/.bashrc

    echo -e "\n Now Reversing Operations\n====================================="
    rsync -Pruv $DEST/* $SOURCE/
    rsync -Pruv $DEST/.bashrc $SOURCE/.bashrc

    notify-send -a 'File Synchroniser' -i /home/alzy/.local/share/icons/Papirus/64x64/apps/synology-cloud-station-drive.svg 'Synchronisation Completed'
    paplay /usr/share/sounds/Oxygen-K3B-Finish-Success.ogg
else
    echo -e "Folder not found"
fi
