#!/bin/bash

# https://github.com/blindpentester/the-essentials
cd /opt  
sudo git clone https://github.com/blindpentester/the-essentials.git  
cd the-essentials  
sudo ./the_essentials.sh

# Add aliases
echo "[[ -f ~/.aliases ]] && source ~/.aliases" >> ~/.zshrc
wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/Kali/.aliases -O ->> ~/.aliases


echo "DONE! Enjoy."
