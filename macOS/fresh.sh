# Install Rosetta2
sudo softwareupdate --install-rosetta

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install daily drivers
brew install python3
brew install node
brew install git
brew install wget
brew install cmake
brew install pyenv

# Add environment variables for pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# Install npm dependencies (otherwise npm i won't work)
brew install cairo
brew install pango

# misc
brew install mysql-client

# Install OhMyZsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
#git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install fonts for Powerlevel10k (MesloLGS)
# wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# wget -P ~/Library/Fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

brew install --cask font-meslo-lg-nerd-font

# Install Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
sed -i '' 's/robbyrussell/powerlevel10k\/powerlevel10k/' ~/.zshrc

echo "Open new terminal and configure pl10k. Once done, press ENTER."
read $wait

# Enable plugins
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions fast-syntax-highlighting)/' ~/.zshrc

# Add aliases
echo "[[ -f ~/.aliases ]] && source ~/.aliases" >> ~/.zshrc

# Install some security-tools
brew install binutils
brew install nmap
brew install --cask burp-suite
brew install --cask wireshark
brew install feroxbuster
brew install binwalk
brew install --cask ghidra
brew install exiftool
brew install hashcat
brew install john-jumbo
brew install hydra
brew install sqlmap
brew install nikto
# brew install wpscan
# brew install volatility
brew install --cask metasploit
brew install --cask binary-ninja

# Install monitoring tools
brew install --cask filemonitor
brew install --cask processmonitor
brew install --cask taskexplorer

sudo mkdir -p /usr/local/share/wordlists && sudo chown -R $(whoami):staff /usr/local/share/wordlists/
git clone https://github.com/danielmiessler/SecLists.git /usr/local/share/wordlists/SecLists

# Install regularly used applications
brew install --cask shottr
brew install --cask rectangle
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask appcleaner
brew install --cask bitwarden
brew install --cask authy
brew install --cask private-internet-access
brew install --cask docker
#brew install --cask intellij-idea
#brew install --cask pycharm
#brew install --cask clion
brew install --cask discord
brew install --cask macupdater
brew install --cask obsidian
brew install --cask the-unarchiver
#brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask zulu
brew install --cask iina
brew install --cask dropshelf
# brew install --cask mac2imgur
brew install --cask notion
brew install --cask readdle-spark
brew install --cask google-drive
brew install --cask onedrive
brew install --cask gyazo
brew install --cask flux
brew install --cask keyboard-maestro
brew install --cask zoom
brew install --cask iterm2
brew install --cask onyx
brew install --cask omnidisksweeper
brew install --cask raycast
brew install fzf

# .aliases
brew install bat eza colordiff
cp .aliases >> ~/.aliases

# .zprofile
cp .zprofile >> ~/.zprofile

# .config
cp -r .config ~/.config

# Install other development languages
brew install go
brew install rust
brew install powershell
brew install ruby

# Enable brew autoupdate
sudo mkdir -p ~/Library/LaunchAgents
sudo chown -R $(whoami):staff ~/Library/LaunchAgents
brew tap homebrew/autoupdate
brew install pinentry-mac
brew autoupdate start 43200 --upgrade --cleanup --immediate --sudo
launchctl load ~/Library/LaunchAgents/com.github.domt4.homebrew-autoupdate.plist

# macOS Tweaks

defaults write com.apple.TextEdit RichText -int 0 # Open TextEdit in plaintext mode by default
defaults write com.apple.screencapture location '/Users/landoncrabtree/Pictures' # Save screenshots to ~/Pictures
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder # Search current folder rather than system-wide

# Define arrays for each file type category
archive_types=(.zip .7z .rar .tar .gz .bz2 .xz .tar.gz .tar.bz2 .tar.xz)
web_types=(.html .htm .shtml .shtm)
code_types=(.js .py .rs .go .java .c .cpp .h .hpp .php .css .scss .sass .md .txt .log .sh .zsh .bash .json .yaml .yml .xml)

# Set default file opener for archive types
for ext in "${archive_types[@]}"; do
    duti -s $(osascript -e 'id of app "The Unarchiver"') "$ext" all
done

# Set default file opener for web types
for ext in "${web_types[@]}"; do
    duti -s $(osascript -e 'id of app "Firefox"') "$ext" all
done

# Set default file opener for code types
for ext in "${code_types[@]}"; do
    duti -s $(osascript -e 'id of app "Cursor"') "$ext" all
done

# Fix Docker
# https://forums.docker.com/t/no-docker-compose-v2-on-macos-13-0-1/131419/9

sudo mkdir -p /usr/local/lib/docker
sudo ln -s /Applications/Docker.app/Contents/Resources/cli-plugins /usr/local/lib/docker/cli-plugins
brew pyenv-sync

echo "DONE! Enjoy."
