#!/bin/zsh

# Purpose: Bypass macOS trackpad animation when switching spaces

/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((`/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"` - 1)))

/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((1 + `/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"`)))