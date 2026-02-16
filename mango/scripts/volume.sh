#!/bin/sh

# Usage: volume.sh [up|down|mute]

step=5
notification_timeout=1000

case "$1" in
    up)
        pamixer -i "$step"
        ;;
    down)
        pamixer -d "$step"
        ;;
    mute)
        pamixer -t
        ;;
esac

# Get current status
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
    dunstify -a "Volume" -r 9993 -u low -t "$notification_timeout" "Volume Muted"
else
    dunstify -a "Volume" -r 9993 -u low -h int:value:"$vol" -t "$notification_timeout" "Volume: ${vol}%"
fi

