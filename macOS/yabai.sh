#!/bin/bash

echo "Disable SIP first and then come back."
sleep 10
sudo nvram boot-args=-arm64e_preview_abi

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install hammerspoon --cask
brew install jq

chmod -R +x ~/.config/yabai/*
chmod -R +x ~/.config/skhd/*.sh

echo "$(whoami) ALL=(root) NOPASSWD:$(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

# Setup yabai launch agent
# sudo wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/macOS/launchagents/pw.landon.yabai.plist -O ~/Library/LaunchAgents/pw.landon.yabai.plist
# sudo chown $(whoami):staff ~/Library/LaunchAgents/pw.landon.yabai.plist
# launchctl load ~/Library/LaunchAgents/pw.landon.yabai.plist

skhd --start-service
yabai --start-service

git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline
cd ~/.hammerspoon
echo 'stackline = require "stackline"' >> init.lua
echo 'stackline:init()' >> init.lua
sed -i "s|/usr/local/bin/yabai|$(which yabai)|g" ~/.hammerspoon/stackline/conf.lua

# Setup skhd launch agent
# sudo wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/macOS/launchagents/pw.landon.skhd.plist -O ~/Library/LaunchAgents/pw.landon.skhd.plist
# sudo chown $(whoami):staff ~/Library/LaunchAgents/pw.landon.skhd.plist
# launchctl load ~/Library/LaunchAgents/pw.landon.skhd.plist
