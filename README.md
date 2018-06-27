# About

A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 
Folked from [kenmin] (https://github.com/kenmin)

## Install

Please **BACKUP** your existing dot files before you clone the repo. The safest way is to create a fresh new user account to try it out.

### Ubuntu

_Make sure you have [Rubygems](https://rubygems.org/) installed._
([Refer the guide](https://gorails.com/setup/ubuntu/16.04))

Paste the command below to your terminal, and hit `<ENTER>`

```sh
$ sudo apt-get install curl
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/ubuntu/bin/build.sh)
```

### Mac OS X

You must have [Homebrew](http://brew.sh/) installed.

Paste the command below to your terminal, and hit `<ENTER>`

```sh
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/osx/bin/build.sh)
```

### Debian

```sh
$ su - # login as root
$ apt-get install git rubygems exuberant-ctags xclip mercurial vim tmux screen ack-grep
$ gem install homesick
$ exit # logout from root
$ `which homesick` clone https://github.com/jslim89/dotfiles.git
$ `which homesick` symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git checkout ubuntu # temporary use ubuntu branch first
$ git submodule update --init --recursive
```

### CentOS

```sh
$ su - # login as root
$ yum install git ack rubygems ctags
$ gem install homesick
$ exit # exit from root user
$ `which homesick` clone https://github.com/jslim89/dotfiles.git
$ `which homesick` symlink dotfiles
$ cd ~/.homesick/repos/dotfiles
$ git checkout ubuntu # temporary use ubuntu branch first
$ git submodule update --init --recursive
```

## Guideline
If you want to add certain program to environment variable, just add to `~/bin`

```sh
$ cd ~/bin
$ ln -s /path/to/your/program
```

## Usage

### Vim's Key Bindings
| Shortcuts | Description                              |
|-----------|------------------------------------------|
| ,         | Leader key                               |
| jj        | Exist from insert mode into normal mode. |
| ,p        | Toggle between Paste and normal mode.    |

### Tmux's Key Bindings
| Shortcuts  | Description                              |
|------------|------------------------------------------|
| `          | Prefix key (backtick)                    |
| ``         | Type backtick in console.                |
| Alt+j      | Switch to left tab.                      |
| Alt+k      | Switch to right tab.                     |
| `\         | Split window vertically.                 |
| `-         | Split window horizontally.               |
| `j         | Move up to top window.                   |
| `k         | Move down to down window.                |
| `h         | Move to left window.                     |
| `l         | Move to right window.                    |
| `/         | Split a new window and man page for cmd. |
| `~         | Split a new window and run htop.         |
| `r         | Reload your .tmux.conf config file.      |
| Shift+PgUp | Show previous page.                      |

To resize tmux pane, hit `\`` followed by `:resize-pane -L <size>`
  
- options `-L` for left, `-R` for right, `-U` for up, `-D` for down

e.g. `:resize-pane -L 15`

Ref [Resizing tmux panes](https://michaelsoolee.com/resize-tmux-panes/)
