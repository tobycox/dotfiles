source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.3.1

alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"

# Clean up old branch
cbranch () {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  git diff-index --quiet HEAD . >/dev/null 2>&1; ec=$?
  if test "$ec" = 0; then
    git checkout master
    git pull origin master
    git branch -d $branch
  else 
    echo "ERROR: Stash your changes first"
  fi
}

export EDITOR=vim
