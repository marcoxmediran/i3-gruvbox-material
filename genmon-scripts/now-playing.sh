#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "󰏤 $(playerctl metadata title) - $(playerctl metadata artist | sed 's/ - Topic//')"
elif [ "$player_status" = "Paused" ]; then
    echo "󰐊 $(playerctl metadata title) - $(playerctl metadata artist | sed 's/ - Topic//')"
else
    echo "󰎇"
fi

