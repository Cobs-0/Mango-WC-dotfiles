#!/usr/bin/env bash

# Kill old instances
killall -q swaybg

# Launch foot server
foot --server &

# Wait for colors to be ready (from startup-wal)
sleep 0.5

# Launch Waybar (now that colors are set)
waybar &
dunst &

# Cursor
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=48
