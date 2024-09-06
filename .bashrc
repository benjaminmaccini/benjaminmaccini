# Python
source "$HOME/.rye/env"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/badmin/gobin

alias go-vote=/home/badmin/gobin/go-vote

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
