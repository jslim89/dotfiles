#!/bin/bash

# installation
sudo apt-get install git exuberant-ctags xclip mercurial vim tmux screen ack-grep ruby
sudo gem install homesick
`which homesick` clone https://github.com/jslim89/dotfiles.git
cd ~/.homesick/repos/dotfiles
git checkout ubuntu
git submodule update --init --recursive
`which homesick` symlink dotfiles
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
