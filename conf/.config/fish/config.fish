# Theme
# set fish_theme agnoster
# set fish_theme bira

function ghq_peco_repo
  set selected_repository (ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_repository" ]
    cd $selected_repository
    echo " $selected_repository "
    commandline -f repaint
  end
end

# Shortcut keys
function fish_user_key_bindings
  bind \cp 'stty sane; ghq_peco_repo'
end

alias v=nvim
alias lg=lazygit
alias cf=chof
alias d=docker
alias dc=docker-compose
alias nims='nim --hints:off'
alias clip='xsel --clipboard --input'

for dir in "$JAVA_HOME/bin" "$HOME/.nimble/bin" "$HOME/bin" "$HOME/.cargo/bin"
  if test -d "$dir"
    set PATH "$dir" $PATH
  end
end

# rbenv
if test -d $HOME/.rbenv/bin
  set PATH $HOME/.rbenv/bin $PATH
  if which rbenv >/dev/null
    rbenv init - | source
  end
end

set -x JAVA_HOME /opt/java/current
set -x EDITOR nvim

# direnv
if which direnv >/dev/null
  eval (direnv hook fish)
end

# go
if test -d /usr/local/go/bin >/dev/null
  set PATH $PATH /usr/local/go/bin
end

# Regexp
set -x REGEXP_IP_ADDRES '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
set -x REGEXP_EMAIL '[-_\.a-zA-Z0-9]+@[-_\.a-zA-Z0-9]+'
set -x REGEXP_LOG_LEVEL_DEBUG '[dD][eE][bB][uU][gG]'
set -x REGEXP_LOG_LEVEL_INFO '[iI][nN][fF][oO]'
set -x REGEXP_LOG_LEVEL_WARN '[wW][aA][rR][nN][iI]?[nN]?[gG]?'
set -x REGEXP_LOG_LEVEL_ERROR '[eE][rR][rR][oO]?[rR]?'
set -x REGEXP_LOG_LEVEL_ALL "$REGEXP_LOG_LEVEL_DEBUG|$REGEXP_LOG_LEVEL_INFO|$REGEXP_LOG_LEVEL_WARN|$REGEXP_LOG_LEVEL_ERROR"
set -x REGEXP_URL 'https?://[-\+_\.a-zA-Z0-9#%/]+'
