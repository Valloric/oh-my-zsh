#!/bin/zsh

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

function git_prompt() {
    local info=$(git_prompt_info)
    if [[ "x$info" != "x" ]]; then
      local gstatus=$(git_prompt_status)
      if [[ "x$gstatus" != "x" ]]; then
        echo "$GIT_PROMPT_PREFIX$(git_prompt_info) $(git_prompt_status)$GIT_PROMPT_SUFFIX"
      else
        echo "$GIT_PROMPT_PREFIX$(git_prompt_info)$GIT_PROMPT_SUFFIX"
      fi
    fi
}

PROMPT=$'%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt)%{$fg[magenta]%}%n@%m %{$reset_color%}%{$fg[cyan]%}%D{[%H:%M:%S]} %{$reset_color%}\
%{$fg[red]%}$ %{$reset_color%}'

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
