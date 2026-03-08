#!/bin/sh

step=5
notification_timeout=1000

case "$1" in
    up)
        brightnessctl set "+${step}%" -q
        ;;
    down)
        brightnessctl set "${step}%-" -q
        ;;
esac

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( 100 * current / max ))

dunstify -a "Brightness" -r 9994 -u low -i "/run/current-system/sw/share/icons/Adwaita/symbolic/status/display-brightness-symbolic.svg" -h int:value:"$percent" -t "$notification_timeout" "Brightness: ${percent}%"

