 #!/bin/bash

if [ -n "$FOOT_WEATHER_POPUP" ]; then
    tput civis
    
    # sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' removes ONLY trailing blank lines
    printf "%s" "$(gum style \
        --foreground 208 --border-foreground 208 --border double \
        --trim --padding "2 4 1 4" \
        "$(curl -s wttr.in/Longford | sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba')")"
    
    while true; do
        read -n 1 -s key
        [[ "$key" == "q" ]] && break
    done
    
    tput cnorm
fi


