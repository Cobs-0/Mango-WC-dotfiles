#!/bin/sh

# Source Pywal colors
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    . "$HOME/.cache/wal/colors.sh"
else
    color4="#bd93f9"
    foreground="#f8f8f2"
    background="#282a36"
fi

clear

# Fetch weather into a variable first
# -sL: Silent, Follow redirects
# --max-time 5: Fail fast if no internet
OUTPUT=$(curl -sL --max-time 5 "wttr.in")

# Only run gum if we got output
if [ -n "$OUTPUT" ]; then
    if command -v gum >/dev/null 2>&1; then
        echo "$OUTPUT" | gum style \
            --foreground "$foreground" \
            --border-foreground "$color4" \
            --border double \
            --padding "1 1" \
            --margin "1 1"
    else
        echo "$OUTPUT"
    fi
else
    echo "Could not fetch weather data."
    echo "Check internet connection or wttr.in status."
fi

echo ""
# Wait
if command -v gum >/dev/null 2>&1; then
    gum confirm "Close?" \
        --affirmative "Done" \
        --negative "" \
        --prompt.foreground "$color4" \
        --selected.background "$color4" \
        --selected.foreground "$background" \
        2>/dev/null
else
    read -n 1 -s -r -p "Press any key to close..."
fi
