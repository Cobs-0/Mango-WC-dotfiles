function wall
    rm -f ~/.config/wal/templates/*~ ~/.config/wal/templates/*.swp

    wal -i $argv[1]

    sed -i 's/#//g' ~/.cache/wal/colors-fuzzel.ini

    sed -i 's/#//g' ~/.cache/wal/colors-foot.ini

    pkill fuzzel
end

