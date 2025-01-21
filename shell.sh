source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"
alias gpush="git push origin "
alias gpull="git pull origin "

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

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export ANDROID_HOME="~/Library/Android/sdk"

export NVM_DIR="$HOME/.nvm"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias imdone="osascript -e 'display notification with title \"Done\"'"

# Homebrew M1
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# Python
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
# export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/dev
# source /opt/homebrew/bin/virtualenvwrapper.sh
