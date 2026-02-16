#!/bin/sh

# Check connectivity
ping -q -c 1 8.8.8.8 >/dev/null 2>&1 || exit 0

LOCATION="${LOCATION:-Loughrea}"

# Fetch data
export TEXT=$(curl -s "wttr.in/$LOCATION?format=%c%t")
export TOOLTIP=$(curl -s "wttr.in/$LOCATION?0QT")

# Python reads the environment variables directly
# No string interpolation issues!
python3 -c "import json, os; print(json.dumps({'text': os.environ.get('TEXT', '').strip(), 'tooltip': os.environ.get('TOOLTIP', '')}))"
