source ~/.bashrc

# ANSI colors
export LESS=' -R '

# Brew path
PATH=/usr/local/bin:$PATH

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Add Qt binaries to PATH
# PATH=$PATH:$HOME/usr/local/qt/Desktop/Qt/4.8.1/gcc/bin/

export EDITOR=vim

export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
export PYTHONSTARTUP=~/.pythonrc

function bundle_local() {
  export BUNDLE_GEMFILE='.Gemfile.local'; echo ".Gemfile.local is being used..."
}

function bundle_normal() {
  unset BUNDLE_GEMFILE; echo "Gemfile is being used..."
}
