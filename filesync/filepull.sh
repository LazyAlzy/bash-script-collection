#!/bin/bash

SOURCE=/home/$USER
DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DEST=$(<$DIRECTORY/ext-drive.txt)

if [ -z "$DEST" ]; then
    echo "Input complete path to backup location"
    read DEST
    echo $DEST > $DIRECTORY/ext-drive.txt
fi

if [ -d $DEST ]; then
    echo -e "\n Pulling Files from Sync Drive\n====================================="
    rsync -Pruv $DEST/* $SOURCE/
    rsync -Pruv $DEST/.bashrc $SOURCE/.bashrc

    notify-send -a 'File Synchroniser' 'Synchronisation Completed'

else
    echo "Folder not found"
    read -p "Would you like to remove the destination path? [Y/n]" -n 1 -r reply
    
    if [ ${reply^} == "Y" ]; then
        echo -e "\nClearing Saved Destination"
        echo "" > $DIRECTORY/ext-drive.txt
        echo "You will be prompted for the destination path upon next run"
    else
        echo ""
    fi
fi
