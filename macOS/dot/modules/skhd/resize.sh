#!/bin/bash

# Dynamic window resizing via yabai :)

dir=$1
increaseDecrease=$2

# if dir is horizontal..
if [ $dir == "horizontal" ]; then
    if [ $increaseDecrease == "increase" ]; then
        yabai -m window --resize left:-40:0
        if [ $? -ne 0 ]; then
            yabai -m window --resize right:40:0
        fi
    else
        yabai -m window --resize left:40:0
        if [ $? -ne 0 ]; then
            yabai -m window --resize right:-40:0
        fi
    fi
else
    if [ $increaseDecrease == "increase" ]; then
        yabai -m window --resize top:0:-40
        if [ $? -ne 0 ]; then
            yabai -m window --resize bottom:0:40
        fi
    else
        yabai -m window --resize top:0:40
        if [ $? -ne 0 ]; then
            yabai -m window --resize bottom:0:-40
        fi
    fi
fi
