#!/bin/bash

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "source ~/dev/dotfiles/shell.sh" >> ~/.zshrc

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Python for neovim
brew install python3
pip3 install --upgrade neovim

# Neovim
brew install neovim/neovim/neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim


# Other config files
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/git_template ~/.git_template
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/ctags ~/.ctags
ln -s $PWD/npmrc ~/.npmrc
ln -s $PWD/zshenv ~/.zshenv

ln -s $PWD/muxit /usr/local/bin

git config --global init.templatedir '~/.git_template'

brew install tmux
brew install ctags-exuberant

# Nice git log
git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Ruby
brew install chruby
brew install ruby-build
mkdir ~/.rubies
ruby-build 2.3.1 ~/.rubies/2.3.1

gem install bundler
gem install rubocop

# Brewing up some other brewskis
brew install postgresql
brew install node
brew install yarn
brew install the_silver_searcher

# Screenshots directory
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
