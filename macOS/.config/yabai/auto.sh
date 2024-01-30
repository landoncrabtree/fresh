#!/bin/bash
# Purpose: Stack split screening. New windows are stacked on top of each other unless there are more than 2 windows in the space--then they are split.

YABAI_WINDOW_ID=$1
YABAI_SPACE_ID=$(yabai -m query --windows --window "$YABAI_WINDOW_ID" | jq -er ".space")


echo "YABAI_WINDOW_ID: $YABAI_WINDOW_ID" >> /tmp/yabai.log
echo "YABAI_SPACE_ID: $YABAI_SPACE_ID" >> /tmp/yabai.log

num_windows=$(yabai -m query --spaces --space "$YABAI_SPACE_ID" | jq -er ".windows | length")
if [ "$num_windows" -le 2 ]; then
    yabai -m space --layout bsp
else
    yabai -m window --insert stack
fi
