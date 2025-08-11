#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install eza -y
sudo apt install bat -y

# https://github.com/blindpentester/the-essentials
cd /opt  
sudo git clone https://github.com/blindpentester/the-essentials.git  
cd the-essentials  
sudo ./the_essentials.sh

# PimpMyKali
cd /opt
sudo git clone https://github.com/Dewalt-arch/pimpmykali
cd pimpmykali
sudo ./pimpmykali.sh

# OhMyZSH Stuff
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
sed -i '' 's/robbyrussell/powerlevel10k\/powerlevel10k/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions fast-syntax-highlighting)/' ~/.zshrc
echo "[[ -f ~/.aliases ]] && source ~/.aliases" >> ~/.zshrc

# Auto upgrade
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

echo "DONE! Enjoy."
