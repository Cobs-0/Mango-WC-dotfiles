#!/bin/sh

# 1. Kill any existing instances to prevent duplicates
killall -q swaybg
killall -q waybar

# 2. Set Wallpaper (using the image Pywal selected in start-mango)
# Pywal saves the current wallpaper path in ~/.cache/wal/wal
if [ -f ~/.cache/wal/wal ]; then
    CURRENT_WALLPAPER=$(cat ~/.cache/wal/wal)
    swaybg -i "$CURRENT_WALLPAPER" -m fill &
else
    # Fallback if something went wrong
    swaybg -c "#333333" &
fi

# 3. Start Waybar (Silent to avoid "Full" echo)
# Give it a moment to initialize
sleep 0.5
waybar >/dev/null 2>&1 &

# 4. Optional: Set Cursor Theme (to fix that error you saw earlier)
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24

