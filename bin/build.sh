#!/bin/bash

# installation
sudo pacman -Sy ruby git xclip mercurial vim tmux screen which
echo "PATH=\$PATH:$(ruby -e 'puts Gem.user_dir')/bin" >> ~/.bashrc
. ~/.bashrc
gem install homesick
homesick clone https://github.com/jslim89/dotfiles.git
cd ~/.homesick/repos/dotfiles
git checkout ubuntu
git submodule update --init --recursive
homesick symlink dotfiles
cd ~

# Create a symlink for .fonts
echo "Symlink .fonts"
if [ -d ~/.fonts ]; then
    ln -s ~/.homesick/repos/dotfiles/home/.fonts/* ~/.fonts/
else
    ln -s ~/.homesick/repos/dotfiles/home/.fonts ~/
fi

# Git config
echo "Updating Git config..."
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global alias.ll 'log --oneline --decorate --graph --all'
