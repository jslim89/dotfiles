#!/bin/bash

# installation
`which homesick` clone https://github.com/jslim89/dotfiles.git
`which homesick` symlink dotfiles
cd ~/.homesick/repos/dotfiles
git submodule update --init --recursive
git checkout debian
cd ~

# Git config
echo "Updating Git config..."
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global alias.ll 'log --oneline --decorate --graph --all'
