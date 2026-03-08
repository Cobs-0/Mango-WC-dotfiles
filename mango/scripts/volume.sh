#!/bin/sh

step=5
notification_timeout=1000

ICON_PATH="/run/current-system/sw/share/icons/Adwaita/symbolic/status/"

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

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    . "$HOME/.cache/wal/colors.sh"
    bar_color="$color4" 
else
    bar_color="#ffffff"
fi

# Point directly to the SVG files
if [ "$mute" = "true" ] || [ "$vol" -eq 0 ]; then
    icon="$ICON_PATH/audio-volume-muted-symbolic.svg"
elif [ "$vol" -lt 33 ]; then
    icon="$ICON_PATH/audio-volume-low-symbolic.svg"
elif [ "$vol" -lt 67 ]; then
    icon="$ICON_PATH/audio-volume-medium-symbolic.svg"
else
    icon="$ICON_PATH/audio-volume-high-symbolic.svg"
fi

if [ ! -f "$icon" ]; then
    # Fallback to standard names just in case the path is wrong
    icon=$(basename "$icon" -symbolic.svg)
fi

if [ "$mute" = "true" ]; then
    dunstify -a "Volume" -r 9993 -u low -i "$icon" -t "$notification_timeout" "Volume Muted"
else
    dunstify -a "Volume" -r 9993 -u low -i "$icon" -h string:hlcolor:"$bar_color" -h int:value:"$vol" -t "$notification_timeout" "Volume: ${vol}%"
fi
