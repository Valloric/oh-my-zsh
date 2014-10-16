# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias sl=ls # often screw this up
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias afind='ack-grep -il'

alias gvim="gvim -u $HOME/.vimrc -N -U NONE"
alias vim="vim -u $HOME/.vimrc -N -U NONE -X"
alias g="git"
alias v="vagrant"

# Runs perl-as-sed on all the files ag finds; useful for global search & replace
# e.g. to replace all occurences of "foo" with "bar": acksed 's/foo/bar/g'
alias acksed="ag -g '' | tr '\n' '\0' | xargs -0 -n 1 perl -pi -E "

# Searches for all the files whose names match the given regex in this dir and
# all the subdirs
alias ackf="ack -a -g"
