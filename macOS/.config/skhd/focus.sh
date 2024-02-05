#!/bin/bash

space=$1


current_spaces=$(yabai -m query --spaces | jq length)

if [ $current_spaces -lt $space ]; then
    new_space=$(($current_spaces + 1))
    yabai -m space --create && yabai -m space --focus $new_space
else
    yabai -m space --focus $space
fi
