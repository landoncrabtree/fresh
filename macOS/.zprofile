eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
GEMSDIR=$(gem environment gemdir)/bin
export PATH=$GEMSDIR:$PATH
export PATH="$PATH:/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$HOME/.gem/bin:$PATH
