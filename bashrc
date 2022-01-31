export EDITOR=~/dev/dotfiles/nvim-wrapper
export REACT_EDITOR=$EDITOR
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:./node_modules/.bin:$HOME/.npm-packages/bin:`/usr/local/bin/yarn global bin`
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

source ~/dev/dotfiles/loadnvm.sh
