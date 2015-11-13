# Custom bin and homebrew paths
PATH=$HOME/.bin:/usr/local/bin:$PATH

export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
export PYTHONSTARTUP=~/.pythonrc

export NODE_PATH="/usr/local/lib/node_modules"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
