# Aliases
alias ll="ls -lAh"
alias g="git"
alias rs="rails s"
alias rc="rails c"
alias rcd="RAILS_ENV=development rails c"
alias raked="RAILS_ENV=development rake"
alias u="history -n" # reload bash history from ~/.bash_history
alias be="bundle exec"

# Completion for git `g` alias.
complete -o default -o nospace -F _git g

# Prompt
export PS1="\[\033[032m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\W\[\033[036m\]\$(__git_ps1 '(%s)')\[\033[00m\]\$ "
#export PS1="\u@\h:\W$(__git_ps1 "(%s)") $ "

# Git autocompletion
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

# Globally synchronize bash history after every command (http://briancarper.net/blog/248/)
shopt -s histappend
PROMPT_COMMAND="history -a"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
