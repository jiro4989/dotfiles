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

set JAVA_HOME /opt/java/current
set PATH $JAVA_HOME/bin $PATH $HOME/.nimble/bin $HOME/bin
set EDITOR nvim
