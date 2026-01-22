# Install Rosetta2
sudo softwareupdate --install-rosetta

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install daily drivers
brew install python3 uv
brew install node
brew install git
brew install wget
brew install cmake
brew install landoncrabtree/tap/brewpy

# Install npm dependencies (otherwise npm i won't work)
brew install cairo
brew install pango

# Install OhMyZsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
#git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

brew install --cask font-meslo-lg-nerd-font

# Install Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
sed -i '' 's/robbyrussell/powerlevel10k\/powerlevel10k/' ~/.zshrc

# Enable plugins
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions fast-syntax-highlighting)/' ~/.zshrc

# Add aliases
echo "[[ -f ~/.aliases ]] && source ~/.aliases" >> ~/.zshrc

# Install monitoring tools
brew install --cask filemonitor
brew install --cask processmonitor
brew install --cask taskexplorer

# Install regularly used applications
brew install --cask shottr
brew install --cask rectangle
brew install --cask firefox
#brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask appcleaner
brew install --cask bitwarden
brew install --cask authy
brew install --cask private-internet-access
brew install --cask docker
brew install --cask discord
brew install --cask macupdater
brew install --cask obsidian
brew install --cask the-unarchiver
brew install --cask betterdisplay
#brew install --cask microsoft-outlook
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask temurin
brew install --cask iina
brew install --cask dropshelf
#brew install --cask mac2imgur
brew install --cask notion
brew install --cask readdle-spark
brew install --cask google-drive
brew install --cask flux
brew install --cask keyboard-maestro
brew install --cask zoom
brew install --cask iterm2
brew install --cask onyx
brew install --cask omnidisksweeper
brew install --cask raycast
brew install --cask aldente
brew install --cask bartender

brew install mysql-client
brew install artginzburg/tap/sudo-touchid && sudo brew services start sudo-touchid
brew install fzf
# brew install displayplacer # https://www.reddit.com/r/mac/comments/11evhk0/how_to_stop_my_extended_displays_from_swapping/

# dot files (https://github.com/pablopunk/dot)
brew install pablopunk/brew/dot
cd dot
dot

# Install other development languages
brew install go
brew install rust
brew install powershell
brew install ruby

# Enable brew autoupdate
sudo mkdir -p ~/Library/LaunchAgents
sudo chown -R $(whoami):staff ~/Library/LaunchAgents
brew tap domt4/autoupdate
brew autoupdate start 43200 --upgrade --cleanup --immediate --leaves-only --sudo

# macOS Tweaks
defaults write com.apple.TextEdit RichText -int 0 # Open TextEdit in plaintext mode by default
defaults write com.apple.screencapture location '/Users/landoncrabtree/Pictures' # Save screenshots to ~/Pictures
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder # Search current folder rather than system-wide

# personal battery tweaks
# sudo pmset -a powernap 0 # disable power nap
# sudo pmset -a womp 0 # disable wake for network
# sudo pmset -a networkoversleep 0 # disable network priority

# server-type battery tweaks
# sudo pmset -a powernap 1 # enable powernap
# sudo pmset -a womp 1 # enable wake for network
# sudo pmset -a SleepDisabled 1 # disable sleep entirely
# sudo pmset -a networkoversleep 1 # prioritize network over sleep

# Define arrays for each file type category
archive_types=(.zip .7z .rar .tar .gz .bz2 .xz .tar.gz .tar.bz2 .tar.xz)
web_types=(.html .htm .shtml .shtm)
video_types=(.mp4 .mkv .mov .avi .flv .mpeg .webm .wmv .m3u8 .m4v .mpg)
code_types=(.js .py .rs .go .java .c .cpp .h .hpp .php .css .scss .sass .md .txt .log .sh .zsh .bash .json .yaml .yml .xml)

# Set default file opener for archive types
for ext in "${archive_types[@]}"; do
    duti -s $(osascript -e 'id of app "The Unarchiver"') "$ext" all
done

# Set default file opener for web types
for ext in "${web_types[@]}"; do
    duti -s $(osascript -e 'id of app "Firefox"') "$ext" all
done

# Set default file opener for video types
for ext in "${video_types[@]}"; do
    duti -s $(osascript -e 'id of app "IINA"') "$ext" all
done

# Set default file opener for code types
for ext in "${code_types[@]}"; do
    duti -s $(osascript -e 'id of app "Cursor"') "$ext" all
done

# Fix Docker
# https://forums.docker.com/t/no-docker-compose-v2-on-macos-13-0-1/131419/9
sudo mkdir -p /usr/local/lib/docker
sudo ln -s /Applications/Docker.app/Contents/Resources/cli-plugins /usr/local/lib/docker/cli-plugins

# fix alt <char> https://apple.stackexchange.com/questions/388552/macos-how-to-turn-off-option-key-printing-special-characters-in-vs-code-intell
wget https://gist.githubusercontent.com/greneholt/e7d5373f96cc0f815717c7666790324d/raw/af9e3094669858c1ddb3c0c8e28b43f56a120f92/QWERTY%2520no%2520option.keylayout -O ~/Library/Keyboard\ Layouts/QWERTY\ no\ option.keylayout
echo "keyboard layout downloaded, change via settings"

echo "DONE! Enjoy."

