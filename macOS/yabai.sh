#!/bin/bash

echo "Disable SIP first and then come back."
sleep 10
sudo nvram boot-args=-arm64e_preview_abi

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
chmod +x ~/.config/yabai/yabairc

# Setup yabai launch agent
# sudo wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/macOS/launchagents/pw.landon.yabai.plist -O ~/Library/LaunchAgents/pw.landon.yabai.plist
# sudo chown $(whoami):staff ~/Library/LaunchAgents/pw.landon.yabai.plist
# launchctl load ~/Library/LaunchAgents/pw.landon.yabai.plist

skhd --start-service
yabai --start-service

# Setup skhd launch agent
# sudo wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/macOS/launchagents/pw.landon.skhd.plist -O ~/Library/LaunchAgents/pw.landon.skhd.plist
# sudo chown $(whoami):staff ~/Library/LaunchAgents/pw.landon.skhd.plist
# launchctl load ~/Library/LaunchAgents/pw.landon.skhd.plist
