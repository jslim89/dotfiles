about
-----
A collection of configuration files for the typical console programs bash, vim,
screen, and misc.
Folked from [kenmin] (https://github.com/kenmin)

use it
------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. 

### Ubuntu Installation:

1 sudo apt-get install git **(NOTE: If you have not install git)**
2 sudo apt-get install rubygems exuberant-ctags
3 sudo gem install homesick
4 /var/lib/gems/1.8/bin/homesick clone https://github.com/jslim89/dotfiles.git
5 /var/lib/gems/1.8/bin/homesick symlink dotfiles
6 cd ~/.homesick/repos/dotfiles
7 git submodule update --init --recursive

### CentOS Installation:

**(NOTE: You must login as root)**
1 su -
2 yum install git
3 yum install rubygems ctags
4 gem install homesick

If you want to setup for root user, continue;
else logout from root user

5 /usr/bin/homesick clone https://github.com/jslim89/dotfiles.git
6 /usr/bin/homesick symlink dotfiles
7 cd ~/.homesick/repos/dotfiles
8 git submodule update --init --recursive
