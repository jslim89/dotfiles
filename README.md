# About

This config is minimal for Windows only.

## Install

### Prerequisite

Install [MSYS2](https://www.msys2.org/). Then update the pacman packages list.

```sh
C:\Users\username> pacman -Syu
# If hang halfway, close it and reopen it, then run
C:\Users\username> pacman -Su
```

Once completed, now install tmux package ([Reference here](https://blog.pjsen.eu/?p=440))

```sh
C:\Users\username> pacman -S tmux
```

If want to use tmux in [Git Bash](https://git-scm.com/download/win), then copy the binary from **/c/msys64/usr/bin/** _(i.e. msys-event-2-1-6.dll, tmux.exe)_ this 2 files over to tmux director

```sh
C:\Users\username> cp -vi /c/msys64/usr/bin/{msys-event-2-1-6.dll,tmux.exe} /c/Users/username/AppData/Local/Programs/Git/usr/bin/
```

Download configs

```sh
C:\Users\username> cd ~
C:\Users\username> curl -O https://raw.githubusercontent.com/jslim89/dotfiles/windows/{.vimrc,.tmux.conf}
```
