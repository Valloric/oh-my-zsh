alias v="vim"
alias gv="gvim"
alias n="nvim"
alias gn="gnvim"
alias c="code"
alias cn="code --new-window"
alias cr="code --reuse-window"

alias j="just"
alias y="yarn"

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
#alias h="chg"
alias h="hg"

# Using eza as a fancier ls. "ll" shows hidden files as well.
alias l="eza --icons=auto --group-directories-first -l"
alias ll="eza --icons=auto --group-directories-first -la"

# GLOBAL aliases, which work anywhere on the line. Must be surrounded by
# whitespace and not be in quotes to be expanded.
alias -g L='| less'

# rust cargo aliases
alias ck="cargo check"
alias ct="cargo test"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cf="cargo fmt"
alias cc="cargo clippy --all-targets --all-features -- -D warnings"
alias help="tldr" # requires: cargo install tealdeer

# rustc hacking
alias xc="python3 ./x.py check"
alias xt="python3 ./x.py test tidy"
alias bs1="python3 ./x.py build --stage 1"
alias bsk1="python3 ./x.py build --stage 1 --keep-stage 1"
alias ts1="python3 ./x.py test --stage 1"
alias tsk1="python3 ./x.py test --stage 1 --keep-stage 1"

# Create bat->batcat alias only if batcat exists. On debian, `bat` is installed
# as `batcat` due to a name conflict.
if command -v batcat &> /dev/null; then
  alias bat='batcat'
fi
