#!/bin/sh
vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
if [[ "$(amixer get Master | tail -2 | grep -c '\[on\]')" = "2" ]]; then
	echo "󰋎 $vol%"
else
	echo "󰟎 $vol%"
fi
