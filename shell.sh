export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.2.3

alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"

# Clean up old branch
cbranch () {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  git checkout master
  git pull origin master
  git branch -d $branch
}

export EDITOR=vim
