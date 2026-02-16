#!/bin/bash

output=$(mango -p 2>&1 | sed -r '
    s/\x1b\[[0-9;]*[a-zA-Z]//
    s/   ╰─/ ╰─/g             
    s/^[[:space:]]*//         
    s/[[:space:]]*$//         
')

icon="$HOME/.config/mango/wallpaper/mango.png"

if [[ -z "$output" ]]; then
    exit 0
fi

notify-send --urgency=critical --icon="$icon" "Mango Status" "$output"
