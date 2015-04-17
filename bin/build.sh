#!/bin/bash

# installation
sudo apt-get install git rubygems exuberant-ctags xclip mercurial vim tmux screen ack-grep
sudo gem install homesick
`which homesick` clone https://github.com/jslim89/dotfiles.git
`which homesick` symlink dotfiles
cd ~/.homesick/repos/dotfiles
git checkout ubuntu
git submodule update --init --recursive
cd ~

# Git config
echo "Updating Git config..."
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global alias.ll 'log --oneline --decorate --graph --all'
