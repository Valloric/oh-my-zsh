# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias sl=ls # often screw this up
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias afind='ack-grep -il'

alias gvim="gvim -u $HOME/.vimrc -N -U NONE"
alias vim="vim -u $HOME/.vimrc -N -U NONE -X"
alias g="git"

alias acksed="ack -f --print0 | xargs -0 -n 1 sed -i -e"
