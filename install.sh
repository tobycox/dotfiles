#!/bin/bash

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "source ~/dev/dotfiles/shell.sh" >> ~/.zshrc

# NVM alternative
curl -fsSL https://fnm.vercel.app/install | bash

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# Python for neovim
brew install python3
pip3 install --upgrade neovim
pip3 install pynvim

# Neovim
brew install ripgrep
brew install neovim/neovim/neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $PWD/nvim ~/.config/nvim

mkdir -p ~/.config/rubocop
ln -s $PWD/rubocop_config.yml ~/.config/rubocop/config.yml

# Other config files
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/git_template ~/.git_template
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/ctags ~/.ctags
ln -s $PWD/npmrc ~/.npmrc
ln -s $PWD/zshenv ~/.zshenv
ln -s $PWD/bash_profile ~/.bash_profile

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
brew install fzf
brew install efm-langserver
brew install neovim-remote

# Screenshots directory
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

# Ghostty
brew install --cask ghostty
mkdir ~/.config/ghostty
ln -s ~/dev/dotfiles/ghostty.config ~/.config/ghostty/config

brew install sesh
