# directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# file listing
alias ls='gls --color --group-directories-first -p';
alias ll='gls -lh --color';
alias lsa='gls -ah';
alias lla='gls -alh';
alias lf='gls -l | grep "^d"';
alias lfa='gls -la | grep "^d"';
alias lfo='gls -la | grep "^-"';
