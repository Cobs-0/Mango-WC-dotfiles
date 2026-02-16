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

cat > ~/.config/fuzzel/fuzzel.ini << EOF
[main]
font=JetBrainsMono Nerd Font:size=14
dpi-aware=no
prompt="❯ "
icon-theme=Adwaita
icons-enabled=yes
fields=filename,name,generic
password-character=*
filter-desktop=yes
match-mode=fzf
sort-result=yes
match-counter=yes

# Center the box
anchor=center
lines=10
width=40
tabs=2
horizontal-pad=20
vertical-pad=20
inner-pad=10

image-size-ratio=0.5

# Border
layer=overlay
exit-on-keyboard-focus-loss=yes

[colors]
background=282a36dd
text=f8f8f2ff
match=8be9fdff
selection=44475add
selection-text=f8f8f2ff
border=bd93f9ff
EOF
