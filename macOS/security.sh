# Install security tools
brew bundle --file Brewfile.security

uv tool install impacket
uv tool install volatility3
uv tool install pwntools
uv tool install ROPgadget
uv tool install RSACtfTool

# Wordlists
sudo mkdir -p /usr/local/share/wordlists && sudo chown -R $(whoami):staff /usr/local/share/wordlists/
git clone https://github.com/danielmiessler/SecLists.git /usr/local/share/wordlists/SecLists

echo "DONE! Enjoy."
