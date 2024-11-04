GEMSDIR=$(gem environment gemdir)/bin

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$(brew --prefix python@3.12)/libexec/bin:$PATH" 
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$GEMSDIR:$PATH"
export PATH="$PATH:/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$HOME/.gem/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export CFLAGS="-I/opt/homebrew/include -L/opt/homebrew/lib"
export COPY_CLIPBOARD=TRUE
