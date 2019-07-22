#!/bin/zsh

# To have the regex-replace function available.
# NOTE: Function mutates the provided var!
# See: https://www.refining-linux.org/archives/52-ZSH-Gem-18-Regexp-search-and-replace-on-parameters.html
autoload -U regexp-replace

# To enable PCRE syntax
setopt re_match_pcre

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?%{$reset_color%}"

GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$reset_color%}%{$fg[green]%}"
GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%} "

function in_hg() {
  if [[ $PWD/ = /google/src/cloud/* ]]; then
    echo 1
    return
  fi

  # Very slow, we really don't want to execute this
  if chg id > /dev/null 2>&1; then
    echo 1
  fi
}

function hg_get_commit_name() {
  if [[ $(in_hg) ]]; then
    echo $(chg cls -T '{name}' .)
  fi
}

function in_git() {
  if [[ $PWD/ = /google/src/cloud/* ]]; then
    return
  fi

  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo 1
  fi
}

function hg_prompt() {
  echo "$GIT_PROMPT_PREFIX$(hg_get_commit_name)$GIT_PROMPT_SUFFIX"
}

function git_prompt() {
  local gstatus=$(git_prompt_status)
  if [[ "x$gstatus" != "x" ]]; then
    echo "$GIT_PROMPT_PREFIX$(git_prompt_info) $gstatus$GIT_PROMPT_SUFFIX"
  else
    echo "$GIT_PROMPT_PREFIX$(git_prompt_info)$GIT_PROMPT_SUFFIX"
  fi
}

function vcs_prompt() {
  if [[ $(in_hg) ]]; then
    echo "$(hg_prompt)"
  elif [[ $(in_git) ]]; then
    echo "$(git_prompt)"
  fi
}

function path_prompt() {
  local truncate_home="${PWD/#$HOME/~}"
  local truncate_goog="${truncate_home/\/google\/src\/cloud\/strahinja\//c:}"

  # Insert color codes around the client name if it exists
  # Must use a positive look-behind to avoid $MATCH having the "c:" prefix
  regexp-replace truncate_goog '(?<=^c:)[^/]+' '%{$fg[cyan]%}$MATCH%{$fg[yellow]%}'

  echo "$truncate_goog"
}


PROMPT=$'%{$fg[yellow]%}$(path_prompt)%{$reset_color%} $(vcs_prompt)%{$fg[magenta]%}%n@%m %{$reset_color%}%{$fg[cyan]%}%D{[%H:%M:%S]} %{$reset_color%}\
%{$fg[red]%}$ %{$reset_color%}'

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
