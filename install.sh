#!/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s $PWD/vimrc ~/.vimrc
ln -s ~/.vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim

ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/git_template ~/.git_template
ln -s $PWD/ctags ~/.ctags
ln -s $PWD/npmrc ~/.npmrc

ln -s $PWD/muxit /usr/local/bin

git config --global init.templatedir '~/.git_template'

brew install tmux
brew install ctags-exuberant
