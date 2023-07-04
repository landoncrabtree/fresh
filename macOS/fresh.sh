# Install Rosetta2
sudo softwareupdate --install-rosetta

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install some basic development utils
brew install python3
brew install node
brew install git
brew install wget
brew install cmake
brew install nvm

# Install npm dependencies (otherwise npm i won't work)
brew install cairo
brew install pango

# Install OhMyZsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install fonts for Powerlevel10k (MesloLGS)
wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Install Powerlevel10k Theme
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

echo "Open new terminal and configure pl10k. Once done, press ENTER."
read $wait

# Enable plugins
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc

# Install some security-tools
brew install binutils
brew install nmap
brew install --cask burp-suite
brew install --cask wireshark
brew install feroxbuster
brew install rustscan
brew install binwalk

# Install regularly used applications
brew install --cask rectangle
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask appcleaner
brew install --cask bitwarden
brew install --cask authy
brew install --cask private-internet-access
brew install --cask docker
brew install --cask jetbrains-toolbox
#brew install --cask intellij-idea
#brew install --cask pycharm
#brew install --cask clion
brew install --cask discord
brew install --cask macupdater
brew install --cask the-unarchiver
brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask oracle-jdk
brew install --cask vlc
brew install --cask hiddenbar
brew install --cask mac2imgur
brew install --cask notion-enhanced
brew install --cask readdle-spark
brew install --cask steam
brew install --cask google-drive
brew install --cask onedrive
brew install --cask gyazo
brew install --cask flux
brew install --cask keyboard-maestro

# Setup 'code' command for VSCode
cat << EOF >> ~/.zprofile
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Install other development languages
brew install go
brew install rust
brew install powershell

# Enable brew autoupdate
sudo mkdir -p ~/Library/LaunchAgents
sudo touch ~/Library/LaunchAgents/com.github.domt4.homebrew-autoupdate.plist
brew tap homebrew/autoupdate
sudo chown $(whoami):staff ~/Library/LaunchAgents/com.github.domt4.homebrew-autoupdate.plist
brew autoupdate --start --upgrade --greedy --cleanup

echo "DONE! Enjoy."
