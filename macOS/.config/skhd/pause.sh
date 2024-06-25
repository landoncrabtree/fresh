#!/bin/bash

# check if yabai -m window conains 'failed to connect to socket'
yabai -m window

if [ $? -ne 0 ]; then
    yabai --start-service
    exit 1
else
    yabai --stop-service
fi
