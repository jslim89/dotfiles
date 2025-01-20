# init fzf
# @see https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# Ctrl+x Ctrl+e to edit command in buffer with $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

