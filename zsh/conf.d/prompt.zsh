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

status_code () {
  local color face

  local ok="(*'-')ｲｲｶﾝｼﾞ"
  local ng="(;^q^%)ｱﾋﾞｬｰ "

  color="%(?.${fg[green]}.${fg[blue]})"
  face="%(?!$ok <!$ng <)"

  echo "${color}${face}${reset_color}"
}

# %F{色} 任意のテキスト %fで、%fまで色を変更できる
PROMPT='%F{003}%*%f %F{magenta}%n%f@%F{blue}%M%f %F{200}[%~]%f${vcs_info_msg_0_}
`status_code` %# '

show_zsh_prompt_colors() {
  for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
}
