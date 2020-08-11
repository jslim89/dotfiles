# About

A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 
[Based on Kian Meng](https://github.com/kianmeng)

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
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/macOS/bin/build.sh)
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

### Debian-based server

For server use, keep the minimal settings

```sh
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/server-deb/bin/build.sh)
```

### RPM-based server

For server use, keep the minimal settings

```sh
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/server-rpm/bin/build.sh)
```

### Windows

[Read the instruction here](https://github.com/jslim89/dotfiles/tree/windows)

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
| ,!        | Prettify the source code js/css related. |
| C-j       | Move up to top window.                   |
| C-k       | Move down to down window.                |
| C-h       | Move to left window.                     |
| C-l       | Move to right window.                    |

### Tmux's Key Bindings


| Shortcuts  | Description                                           |
|------------|-------------------------------------------------------|
| `          | Prefix key (backtick)                                 |
| ``         | Type backtick in console.                             |
| Alt+j      | Switch to left tab.                                   |
| Alt+k      | Switch to right tab.                                  |
| C-j        | Move up to top window.                                |
| C-k        | Move down to down window.                             |
| C-h        | Move to left window.                                  |
| C-l        | Move to right window.                                 |
| `\         | Split window vertically.                              |
| `-         | Split window horizontally.                            |
| `c         | New window.                                           |
| `b         | break current split into new window.                  |
| `j         | Join other window to current window.                  |
| `s         | Swap pane                                             |
| `n         | New session                                           |
| `K         | Kill current session                                  |
| `[         | Enter scroll mode (use `v` to highlight, `y` to yank) |
| `C-j       | Search sessions                                       |
| `/         | Split a new window and man page for cmd.              |
| `~         | Split a new window and run htop.                      |
| `r         | Reload your .tmux.conf config file.                   |
| S-Left     | Resize window left (2 steps)                          |
| S-Right    | Resize window right (2 steps)                         |
| S-Down     | Resize window down (1 steps)                          |
| S-Up       | Resize window up (1 steps)                            |
| C-Left     | Resize window left (10 steps)                         |
| C-Right    | Resize window right (10 steps)                        |
| C-Down     | Resize window down (5 steps)                          |
| C-Up       | Resize window up (5 steps)                            |

Reference: https://thoughtbot.com/upcase/tmux
