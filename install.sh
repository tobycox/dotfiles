#!/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dev/dotfiles/vimrc ~/.vimrc
ln -s ~/dev/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dev/dotfiles/git_template ~/.git_template

git config --global init.templatedir '~/.git_template'
