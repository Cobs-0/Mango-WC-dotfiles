#!/bin/bash

text=$(curl -sL --max-time 30 "wttr.in/Longford?format=%c%t" 2>/dev/null | tr -d '\n')

if [ -n "$text" ]; then
    tooltip=$(curl -sL --max-time 30 "wttr.in/Longford?0QT" 2>/dev/null)
    
    # Create nice header with actual newline at the end
    header="<span color='#458588' weight='bold' size='x-large'> Longford Weather</span>

"
    formatted="$header<tt><span color='#ffa500'>$tooltip</span></tt>"
    
    # Escape for JSON: backslashes first, then newlines, then quotes
    formatted=$(echo "$formatted" | sed 's/\\/\\\\/g' | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')
    
    printf '{"text":"%s", "tooltip":"%s"}\n' "$text" "$formatted"
else
    printf '{"text":"🌡️", "tooltip":"Loading..."}\n'
fi


