# Install security tools
brew install binutils
brew install nmap
brew install feroxbuster
brew install binwalk
brew install exiftool
brew install hashcat
brew install john-jumbo
brew install hydra
brew install sqlmap
brew install sleuthkit
brew install --cask binary-ninja
brew install --cask burp-suite
brew install --cask wireshark
brew install --cask ghidra
uv tool install impacket
uv tool install volatility3
uv tool install pwntools

wget https://raw.githubusercontent.com/Gallopsled/pwntools-binutils/master/macos/binutils-amd64.rb -O /tmp/binutils-amd64.rb
HOMEBREW_DEVELOPER="true" brew install /tmp/binutils-amd64.rb

# Wordlists
sudo mkdir -p /usr/local/share/wordlists && sudo chown -R $(whoami):staff /usr/local/share/wordlists/
git clone https://github.com/danielmiessler/SecLists.git /usr/local/share/wordlists/SecLists

echo "DONE! Enjoy."

