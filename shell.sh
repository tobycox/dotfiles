export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.2.3

alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"

export EDITOR=vim
