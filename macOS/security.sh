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

brew install landoncrabtree/tap/binutils-x86_64

# Wordlists
sudo mkdir -p /usr/local/share/wordlists && sudo chown -R $(whoami):staff /usr/local/share/wordlists/
git clone https://github.com/danielmiessler/SecLists.git /usr/local/share/wordlists/SecLists

echo "DONE! Enjoy."

