alias v="vim"
alias gv="gvim"
alias n="nvim"
alias gn="gnvim"
alias c="code" 
alias cn="code --new-window" 
alias cr="code --reuse-window" 

alias va="vagrant"

# Runs perl-as-sed on all the files ag finds; useful for global search & replace
# e.g. to replace all occurences of "foo" with "bar": acksed 's/foo/bar/g'
alias acksed="ag -g '' | tr '\n' '\0' | xargs -0 -n 1 perl -pi -E "

# We now use this instead of acksed (above)
alias fm='fastmod'

# Searches for all the files whose names match the given regex in this dir and
# all the subdirs
# We use "fd" these days
alias ackf="ack -a -g"

# mercurial aliases
# using chg, the C wrapper around hg for faster startup
alias h="chg"

# rust cargo aliases
alias ck="cargo check"
alias ct="cargo test"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cf="cargo fmt"
alias cc="cargo clippy --all-targets --all-features -- -D warnings"
alias help="tldr" # requires: cargo install tealdeer
