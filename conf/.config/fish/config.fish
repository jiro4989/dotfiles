# Theme
# set fish_theme agnoster
# set fish_theme bira

function __ghq_peco_repo
  set selected_repository (ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_repository" ]
    cd $selected_repository
    echo " $selected_repository "
    commandline -f repaint
  end
end

# change directory with peco
function __cd_with_peco
  set dir (find $argv[1] -type d -name '.git' -prune -o -type d -print | peco)
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

function create_workdir
  if [ -d work ]
    rm -rf work
  end
  mkdir work; and cd work
end

function __helpall
  set cmd $argv[1]
  if not which $cmd >/dev/null
    echo "$cmd is not found" >&2
    return 1
  end

  if not eval $cmd --help
    if not eval $cmd -help
      if not man $cmd
        eval $cmd -h
      end
    end
  end
end

# Shortcut keys
function fish_user_key_bindings
  bind \cp 'stty sane; __ghq_peco_repo'
end

# alias
alias c=__cd_with_peco
alias d=docker
alias g=git
alias h=__helpall
alias n=nim
alias t='cd /tmp'
alias u=__cd_to_parent_dir
alias v=nvim

alias dc=docker-compose
alias gp='git pull'
alias lg=lazygit
alias wa=watch
alias wo=create_workdir

alias nr='nim c -r'
alias nn=nimble
alias nnb='nimble build -Y'
alias nnt='nimble test -Y'
alias nims='nim --hints:off'

alias clip='xsel --clipboard --input'

set -x JAVA_HOME /opt/java/current
set -x EDITOR nvim

for dir in /usr/local/go/bin "$HOME/bin" "$HOME/.nimble/bin" "$HOME/go/bin" "$JAVA_HOME/bin" "$HOME/.cargo/bin"
  if test -d "$dir"
    set PATH $PATH "$dir"
  end
end

# rbenv
if test -d $HOME/.rbenv/bin
  set PATH $HOME/.rbenv/bin $PATH
  if which rbenv >/dev/null
    rbenv init - | source
  end
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
