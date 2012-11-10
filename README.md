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
$ /var/lib/gems/1.8/bin/homesick clone git://github.com/jslim89/dotfiles.git
$ /var/lib/gems/1.8/bin/homesick symlink dotfiles
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
$ /usr/bin/homesick clone git://github.com/jslim89/dotfiles.git
$ /usr/bin/homesick symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git submodule update --init --recursive
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
