### Aliases ###

# Multiple GitHub accounts support
export GIT_SSH="$HOME/.bin/git-ssh"

# General
alias ls="ls -G"
alias ll="ls -lAh"
alias g="git"
alias u="history -n" # reload bash history from ~/.bash_history

# Ruby & Rails
alias rs="rails s"
alias rc="rails c"
alias be="bundle exec"
alias bi="bundle install"
alias devenv="RAILS_ENV=development "
alias rcdev="RAILS_ENV=development rails c"
alias rakedev="RAILS_ENV=development rake"

# Completion for git `g` alias.
complete -o default -o nospace -F _git g

# Prompt
export GIT_PS1_SHOWDIRTYSTATE=true # can be disabled per project with git config --add bash.showDirtyState false
export GIT_PS1_SHOWUNTRACKEDFILES=true # can be disabled per project with git config --add bash.showUntrackedFiles false
export PS1="\[\033[032m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\W\[\033[036m\]\$(__git_ps1 '[%s]')\[\033[00m\]\$ "

# Git autocompletion
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
source `brew --prefix git`/etc/bash_completion.d/git-prompt.sh

# Globally synchronize bash history after every command (http://briancarper.net/blog/248/)
shopt -s histappend
PROMPT_COMMAND="history -a"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
