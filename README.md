About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 
Folked from [kenmin] (https://github.com/kenmin)

Install
-------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. By default it should
works in OS X 10.8 and above

### OS X Installation:

Install homebrew before install anything else.  

```sh
$ brew install ctags-exuberant
$ brew install coreutils
$ sudo gem install homesick
$ `which homesick` clone https://github.com/jslim89/dotfiles.git
$ `which homesick` symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git submodule update --init --recursive

# Originally MAC doesn't look for `~/.bashrc`, rather it recognize `~/.profile`. So there are 2 way to do that:
# Rename to .profile
$ mv ~/.bashrc ~/.profile
```

## Terminal profile
Update the terminal to light yellow background, import from [terminal/js-profile.terminal](https://raw.githubusercontent.com/jslim89/dotfiles/osx/terminal/js-profile.terminal)

## Guideline
If you want to add certain program to environment variable, just add to `~/bin`
```sh
$ cd ~/bin
$ ln -s /path/to/your/program
```

_References:_
* _[Where to find the .bashrc file on Mac OS X Snow Leopard and Lion?](http://superuser.com/questions/147043/where-to-find-the-bashrc-file-on-mac-os-x-snow-leopard-and-lion#answer-147699)_
* _[Install and Use GNU Command Line Tools on Mac OS X](http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/);
