#!/usr/bin/env zsh
#
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# %F{色} 任意のテキスト %fで、%fまで色を変更できる
PROMPT='%F{yellow}%*%f %F{magenta}%n%f@%F{blue}%M%f %{${fg[blue]}%}[%~]%{${reset_color}%}${vcs_info_msg_0_}
%# '
