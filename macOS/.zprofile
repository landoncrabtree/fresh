eval "$(/opt/homebrew/bin/brew shellenv)"
export GEMSDIR=$(gem environment gemdir)/bin
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$GEMSDIR:$PATH"
export PATH="$PATH:/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.gem/bin"
export PATH="$PATH:$HOME/go/bin"
export CFLAGS="-I/opt/homebrew/include -L/opt/homebrew/lib"
export COPY_CLIPBOARD=TRUE
