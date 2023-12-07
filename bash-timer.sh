#!/bin/bash
case $1 in
    '')
        echo 'No Time Specified'
        ;;
    [0-9]*[smhdy])
        termdown -f colossal $1
        notify-send -a 'Timer' -i /home/alzy/.local/share/icons/Papirus/64x64/apps/preferences-system-time.svg 'Countdown finished'
        paplay /usr/share/sounds/Oxygen-K3B-Insert-Medium.ogg
        ;;
    *)
        echo 'Invalid Input'
esac

