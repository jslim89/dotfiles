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

brew install coreutils zsh-completion tmux git-delta bat homeshick

homeshick clone https://github.com/jslim89/dotfiles.git
cd ~/.homesick/repos/dotfiles
git checkout macOS-zsh
homeshick symlink dotfiles
git submodule update --init --recursive
cd ~

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup auto completion
ln -s ~/.zsh.d/pass.zsh-completion $(brew --prefix)/share/zsh-completions/_pass

# fix "zsh compinit: insecure directories"
chmod -R go-w "$(brew --prefix)/share"

source ~/.zshrc

# Git config
echo "Updating Git config..."
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global diff.tool 'vimdiff'
git config --global alias.ll 'log --oneline --decorate --graph --all'
