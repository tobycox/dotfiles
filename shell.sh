export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export NPM_PACKAGES="${HOME}/.node-modules"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.1.3

alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"

export EDITOR=vim
