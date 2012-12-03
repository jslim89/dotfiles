About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 
Folked from [kenmin] (https://github.com/kenmin)

Install
-------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. By default it should
works in Ubuntu 12.04 Precise Pangolin.

### Ubuntu Installation:
```sh
$ sudo apt-get install git rubygems exuberant-ctags xclip mercurial vim tmux screen ack-grep
$ sudo gem install homesick
$ `which homesick` clone git://github.com/jslim89/dotfiles.git
$ `which homesick` symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git submodule update --init --recursive
```

### CentOS Installation:

#### (NOTE: You must login as root)
```sh
$ su -
$ yum install git ack rubygems ctags
$ gem install homesick
   # IF you want to setup for root user, continue;
   # ELSE logout from root user
$ `which homesick` clone git://github.com/jslim89/dotfiles.git
$ `which homesick` symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git submodule update --init --recursive
```

### Mac
Install homebrew before install anything else.  
_(NOTE: doesn't guarantee for all utilities mention in **Ubuntu**)_

Change the content of `~/.homesick/repos/dotfiles/home/.bash.d/filedir.sh`
```sh
# Original
alias ls='ls --color --group-directories-first -p';
alias ll='ls -lh --color';

# Change to
alias ls='ls -G';
alias ll='ls -lhG';
```

Originally MAC doesn't look for `~/.bashrc`, rather it recognize `~/.profile`. So there are 2 way to do that:

Rename it
```sh
$ mv ~/.bashrc ~/.profile
```
Add the content below to `~/.profile`
```sh
$ echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> ~/.profile
```

_Reference:_
* _[Where to find the .bashrc file on Mac OS X Snow Leopard and Lion?](http://superuser.com/questions/147043/where-to-find-the-bashrc-file-on-mac-os-x-snow-leopard-and-lion#answer-147699)_

## Guideline
If you want to add certain program to environment variable, just add to `~/bin`
```sh
$ cd ~/bin
$ ln -s /path/to/your/program
```

## Fonts
The vim-powerline needs Ubuntu Mono font
```sh
$ mkdir ~/.fonts 
$ cd ~/.fonts/ && git clone https://github.com/scotu/ubuntu-mono-powerline.git 
$ cd ~
```

**NOTE:** By default is disabled, edit the ~/.vimrc to uncomment this section
```viml
set guifont=Ubuntu\ Mono\ 12
```
