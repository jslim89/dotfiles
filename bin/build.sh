#!/bin/bash

# installation
sudo apt install -y htop git tmux vim exuberant-ctags

git clone https://github.com/jslim89/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
git checkout server-deb

BASEDIR=~/.dotfiles/home

for f in $BASEDIR/.*; do
    if [ -r $f ] && [[ $f != *home/. ]] && [[ $f != *home/.. ]]; then
        ln -s $f ~/`basename $f`
    fi
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Git config
echo "Updating Git config..."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ${BASEDIR}/.bash.d/git-completion.sh
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global diff.tool 'vimdiff'
git config --global alias.ll 'log --oneline --decorate --graph --all'

# Set bash to emacs key-binding
# ref: https://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/
set -o emacs
