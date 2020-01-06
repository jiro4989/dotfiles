#!/usr/bin/env zsh

readonly __ZSH_PROMPT_CMD="$HOME/.nimble/bin/zshprompt"

autoload -Uz add-zsh-hook
_nicy_prompt() {
  if type "$__ZSH_PROMPT_CMD" >& /dev/null; then
    PROMPT=$("$__ZSH_PROMPT_CMD")
  fi
}
add-zsh-hook precmd _nicy_prompt
