#!/bin/bash

# installation
if ! type brew >/dev/null; then
    echo "Please install home brew before execute this script..."
    exit -1
fi

if ! type git >/dev/null; then
    echo "Please install git before execute this script..."
    exit -1
fi

brew install ctags-exuberant coreutils
sudo gem install homesick
`which homesick` clone https://github.com/jslim89/dotfiles.git
`which homesick` symlink dotfiles
cd ~/.homesick/repos/dotfiles
git submodule update --init --recursive
cd ~

# Originally MAC doesn't look for `~/.bashrc`, rather it recognize `~/.profile`. So there are 2 way to do that:
mv ~/.bashrc ~/.profile
source ~/.profile

# Git config
echo "Updating Git config..."
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global alias.ll 'log --oneline --decorate --graph --all'
