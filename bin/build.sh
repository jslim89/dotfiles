#!/bin/bash

# installation

## install node/yarn
sudo apt-get install nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

sudo apt-get install git exuberant-ctags xclip mercurial vim tmux screen ack-grep ruby bash-completion yarn
sudo gem install homesick
`which homesick` clone https://github.com/jslim89/dotfiles.git
cd ~/.homesick/repos/dotfiles
git checkout ubuntu
git submodule update --init --recursive
`which homesick` symlink dotfiles
cd ~

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create a symlink for .fonts
echo "Symlink .fonts"
if [ -d ~/.fonts ]; then
    ln -s ~/.homesick/repos/dotfiles/home/.fonts/* ~/.fonts/
else
    ln -s ~/.homesick/repos/dotfiles/home/.fonts ~/
fi

# Git config
echo "Updating Git config..."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o home/.bash.d/git-completion.sh
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global diff.tool 'vimdiff'
git config --global alias.ll 'log --oneline --decorate --graph --all'

# Set bash to emacs key-binding
# ref: https://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/
set -o emacs
