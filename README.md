About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 

Install
-------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. By default it should
works in OS X 10.8 and above

### OS X Installation:

Install homebrew & git before install anything else.  

Then paste the command below to your terminal and hit `<ENTER>`

```sh
$ bash <(curl -s https://raw.githubusercontent.com/jslim89/dotfiles/macOS/bin/build.sh)
```

## Terminal profile
Update the terminal to light yellow background, import from [terminal/js-profile.terminal](https://raw.githubusercontent.com/jslim89/dotfiles/macOS/terminal/js-profile.terminal)

## Guideline
If you want to add certain program to environment variable, just add to `~/bin`
```sh
$ cd ~/bin
$ ln -s /path/to/your/program
```

_References:_
* _[Where to find the .bashrc file on Mac OS X Snow Leopard and Lion?](http://superuser.com/questions/147043/where-to-find-the-bashrc-file-on-mac-os-x-snow-leopard-and-lion#answer-147699)_
* _[Install and Use GNU Command Line Tools on Mac OS X](http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/)_
* _[Execute bash script from URL](http://stackoverflow.com/questions/5735666/execute-bash-script-from-url/5735767#5735767)_
