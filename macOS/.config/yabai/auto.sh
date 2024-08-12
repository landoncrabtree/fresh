#!/bin/bash
# Purpose: Stack split screening. New windows are stacked on top of each other unless there are more than 2 windows in the space--then they are split.


YABAI_SPACE_ID=$(yabai -m query --windows --window "$YABAI_WINDOW_ID" | jq -er ".space")

NUM_WINDOWS=0
SPACE_WINDOWS=$(yabai -m query --spaces --space "$YABAI_SPACE_ID" | jq -er '.windows[]')

for window_id in $SPACE_WINDOWS; do
    # Check if 'is-visible' is true
    if [ $(yabai -m query --windows --window "$window_id" | jq -er '.["is-visible"]') = "true" ]; then
        echo "window_id is visible: $window_id" >> /tmp/yabai.log
        NUM_WINDOWS=$((NUM_WINDOWS + 1))
    fi
    
done

echo "NUM_WINDOWS: $NUM_WINDOWS" >> /tmp/yabai.log


if [ "$NUM_WINDOWS" -le 1 ]; then
    echo "Switching to bsp layout" >> /tmp/yabai.log
    yabai -m space --layout bsp
else
    echo "Switching to stack layout" >> /tmp/yabai.log
    yabai -m window --insert stack
fi
