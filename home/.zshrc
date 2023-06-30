# use emacs key-binding
bindkey -e

# for tmux: export 256color
# @see https://wiki.archlinux.org/index.php/Tmux#Setting_the_correct_term
# [ -n "$TMUX" ] && export TERM=screen-256color

# Start tmux on every shell login. Add this before aliases declaration
# http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
# if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#     tmux attach || tmux new; exit
# fi

# Load all the aliases or functions when you starts zsh. 
# To see all aliases, type alias. 
# To see all functions, type declare -f. 
#
# To add a new alias/functions, 
# 1. create a new filename in ~/.zsh.d/name_of_the_category.zsh 
# 2. add your own aliases or functions and save the file
# 3. reload zsh by typing source .zshrc

if [ -d ~/.zsh.d ]; then
  for f in ~/.zsh.d/*.zsh; do
    if [ -r $f ]; then
      source $f
    fi
  done
  unset f
fi

export PATH=~/bin:$PATH:~/.zsh.d/utils
export HISTCONTROL=ignoreboth
export HISTSIZE=100000000000

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NEWLINE=$'\n'
PROMPT="[%F{blue}%n@%m%f][%F{green}%~%f]%F{yellow}$(parse_git_branch)%f${NEWLINE}"

if [ $(id -u) -eq 0 ]; then
    PS1="${PROMPT}# "
else
    PS1="${PROMPT}$ "
fi

export EDITOR=vim

# auto completion https://apple.stackexchange.com/questions/55875/git-auto-complete-for-branches-at-the-command-line/392382#392382
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# init fzf
# @see https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LC_ALL=en_US.UTF-8

