function install_go
  set go_version $argv[1]
  if [ ! -n "$go_version" ]
    echo "第一引数 (バージョン)は必須です"
    return 1
  end

  set cmd go$go_version
  go get golang.org/dl/$cmd
  $cmd download
  $cmd version
  ln -sfn $HOME/go/bin/$cmd $HOME/go/bin/go
  go version
end

function tagpush
  git tag $argv[1]
  git push origin $argv[1]
end

function __ghq_list_cd
  set selected_repository (ghq list -p | fzf)
  if [ -n "$selected_repository" ]
    cd $selected_repository
    echo " $selected_repository "
    commandline -f repaint
  end
end

# change directory with peco
function __recur_cd
  set dir (find $argv[1] -type d -name '.git' -prune -o -type d -print | fzf)
  if [ -n "$dir" ]
    cd "$dir"
    echo "$dir"
    commandline -f repaint
  end
end

function __cd_to_parent_dir
  if [ -n "$argv[1]" ]
    for i in (seq $argv[1])
      cd ../
    end
  else
    cd ../
  end
end

function __create_workdir
  if [ -d work ]
    rm -rf work
  end
  mkdir work; and cd work
end

# Shortcut keys
function fish_user_key_bindings
  bind \cp 'stty sane; __ghq_list_cd'
end

# alias
alias c=__recur_cd
alias d=docker
alias g=git
alias l=ls
alias n=nim
alias p='ps aux'
alias t='cd /tmp'
alias u=__cd_to_parent_dir
alias v=nvim

alias cg='cd .github/workflows'
alias dc=docker-compose
alias fi='nvim ~/.config/fish/config.fish'
alias gp='git pull'
alias lg=lazygit
alias pg='ps aux | grep'
alias pt='pstree -a'
alias wa=watch
alias wo=__create_workdir

alias nr='nim c -r'
alias nn=nimble
alias nnb='nimble build -Y'
alias nnt='nimble test -Y'
alias nims='nim --hints:off'

alias clip='xsel --clipboard --input'

set -x JAVA_HOME /opt/java/current
set -x EDITOR nvim

set PATH /snap/bin $PATH
for dir in "$HOME/go/bin" /usr/local/go/bin "$HOME/bin" "$HOME/.nimble/bin" "$HOME/.anyenv/bin" "$JAVA_HOME/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" "$HOME/relma/bin" "$HOME/.vim/plugged/vim-iced/bin"
  if test -d "$dir"
    set PATH $PATH "$dir"
  end
end

# anyenv
if which anyenv
  eval (anyenv init - | source)
end

# direnv
if which direnv >/dev/null
  eval (direnv hook fish)
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
