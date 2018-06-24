alias v="vagrant"

# Runs perl-as-sed on all the files ag finds; useful for global search & replace
# e.g. to replace all occurences of "foo" with "bar": acksed 's/foo/bar/g'
alias acksed="ag -g '' | tr '\n' '\0' | xargs -0 -n 1 perl -pi -E "

# Searches for all the files whose names match the given regex in this dir and
# all the subdirs
alias ackf="ack -a -g"

# rust cargo aliases
alias ck="cargo check"
alias ct="cargo test"
alias cb="cargo build"
alias cf="cargo fmt"
