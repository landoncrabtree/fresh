# Install Rosetta2
sudo softwareupdate --install-rosetta

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install all packages
brew bundle

# Install OhMyZsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
#git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
sed -i '' 's/robbyrussell/powerlevel10k\/powerlevel10k/' ~/.zshrc

# Enable plugins
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions fast-syntax-highlighting)/' ~/.zshrc

# Add aliases
echo "[[ -f ~/.aliases ]] && source ~/.aliases" >> ~/.zshrc

# dot files (https://github.com/pablopunk/dot)
cd dot
dot

# Enable sudo-touchid
sudo brew services start sudo-touchid

# Enable brew autoupdate
sudo mkdir -p ~/Library/LaunchAgents
sudo chown -R $(whoami):staff ~/Library/LaunchAgents
brew autoupdate start 43200 --upgrade --cleanup --immediate --leaves-only --sudo

# macOS Tweaks
defaults write com.apple.TextEdit RichText -int 0 # Open TextEdit in plaintext mode by default
defaults write com.apple.screencapture location '/Users/landoncrabtree/Pictures' # Save screenshots to ~/Pictures
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder # Search current folder rather than system-wide

# Macbook battery tweaks
# - Sleeps immediately after wake event
# - Disables periodic wakes for iCloud syncs
# - Disables wake on network (do not wake when you receive a Wake-on-LAN packet)
# - Disables network connectivity during sleep (apps will not receive push notifications)
# sudo pmset disableassertion InternalPreventSleep
# sudo pmset -a powernap 0
# sudo pmset -a womp 0
# sudo pmset -a networkoversleep 0

# Server battery tweaks (e.g. Mac Mini)
# sudo pmset -a powernap 1
# sudo pmset -a womp 1
# sudo pmset -a SleepDisabled 1
# sudo pmset -a networkoversleep 1

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
