#!/bin/bash

sub_cmd=$1

export GOPATH=$HOME
export PATH=$PATH:$HOME/bin
my_repo=~/src/github.com/jiro4989
dot_dir="$my_repo/dotfiles"

main() { #{{{
  # ヘルプオプションチェック
  case "$sub_cmd" in
    -h | --help | help)
      usage
      ;;
  esac

  # ヘルプの確認のときはデバッグ出力してほしくないので
  # このタイミングでオプションをON
  set -eux

  case "_$sub_cmd" in
    _general) setup_general ;;
    _ghq) setup_ghq ;;
    _shell) setup_shell ;;
    _git_config) setup_git_config ;;
    _docker) setup_docker ;;
    _emacs) setup_emacs ;;
    _go) setup_go ;;
    _gtk_theme) setup_gtk_theme ;;
    _vim) setup_vim ;;
    _nvim) setup_nvim ;;
    _atom) setup_atom ;;
    _mac_ubuntu) 
      # mac_ubuntuは必ずしも入れるわけではないので
      # 全部タスクの方には含めない
      setup_mac_ubuntu
      ;;
    _)
      # サブコマンド指定がない場合は全部のタスクを実行する
      # curl URL | bash でスクリプトを実行するための対応
      sudo apt update -y

      setup_general
      setup_ghq
      setup_shell
      setup_git_config
      setup_docker
      setup_go
      setup_gtk_theme
      setup_vim
      setup_nvim
      setup_atom
      setup_emacs

      sudo apt upgrade -y
      ;;
    *)
      usage
      ;;
  esac
} # }}}

setup_general() { #{{{
  # ユーザフォルダの日本語を英語に変更
  LANG=C xdg-user-dirs-gtk-update

  # キーリピート
  xset r rate 300 62

  # ビープ音を無効化
  sudo echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf

  # フォント 'Ricty Diminished'
  sudo apt-get install -y fonts-ricty-diminished

  # デフォルトターミナルの変更
  update-alternatives --config x-terminal-emulator

  # 日本語入力
  sudo apt-get install -y ibus-mozc
} # }}}

setup_ghq() { # {{{
  # ghqでdotfilesを取得
  sudo apt install -y golang-1.10
  go get github.com/motemen/ghq
  ghq get jiro4989/dotfiles
} # }}}

setup_shell() { # {{{
  echo "source $dot_dir/bash/bashrc" >>~/.bashrc
  echo "source $dot_dir/zsh/zshrc" >>~/.zshrc
} # }}}

setup_git_config() { # {{{
  git config --global user.email "jiroron666@gmail.com"
  git config --global user.name "jiro4989"
  git config --global alias.pr "pull-request"
  git config --global alias.see "browse"
  git config --global ghq.root "~/src"
  git config --global commit.template "$dot_dir/git/commit.template"
} # }}}

setup_docker() { # {{{
  sudo apt install docker.io

  sudo groupadd docker
  sudo gpasswd -a $USER docker

  sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  sudo systemctl enable docker
} # }}}

setup_emacs() { # {{{
  sudo apt-get install -y emacs
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  ln -sf $HOME/dotfiles/.spacemacs $HOME/.emacs.d/
} # }}}

setup_go() { # {{{
  go get -u github.com/cweill/gotests/...
  go get -u github.com/mholt/archiver/cmd/archiver

  # TUI
  go get -u github.com/fatih/color
  go get -u github.com/julienroland/keyboard-termbox
  go get -u github.com/mattn/go-colorable
  go get -u github.com/nsf/termbox-go

  # vim-go
  go get -u github.com/nsf/gocode
  go get -u golang.org/x/tools/cmd/godoc

  # Excel
  go get -u github.com/tealeg/xlsx
  go get -u github.com/loadoff/excl

  go get -u github.com/BurntSushi/toml

  # packages version
  go get -u github.com/golang/dep/cmd/dep

  # github release
  go get -u github.com/tcnksm/ghr

  # clipboard
  go get -u github.com/atotto/clipboard/cmd/gocopy

  # Debugger
  go get -u github.com/derekparker/delve/cmd/dlv

  go get -v github.com/alecthomas/gometalinter
  gometalinter --install --update

  # coverage
  go get -u github.com/axw/gocov/gocov

  # count srccode
  go get -u github.com/hhatto/gocloc/cmd/gocloc

  # クロスコンパイル
  go get -u github.com/mitchellh/gox

  # シェルのフォーマッタ
  go get -u github.com/mvdan/sh/cmd/shfmt

  # インクリメンタルサーチIF
  go get -u github.com/peco/peco/cmd/peco/...

  # docker管理UI
  go get -u github.com/skanehira/docui

  # リポジトリ管理
  go get github.com/motemen/ghq
} # }}}

setup_gtk_theme() { # {{{
  git clone https://github.com/tliron/install-gnome-themes /tmp/install-gnome-themes
  sudo apt install ruby
  /tmp/install-gnome-themes/install-gnome-themes

  # icons
  sudo add-apt-repository ppa:papirus/papirus
  sudo apt update
  sudo apt install papirus-icon-theme

  # app thems
  sudo apt install materia-gtk-theme
} # }}}

setup_vim() { # {{{
  sudo apt install vim
  sudo apt install vim-gnome
  ln -snf "$dot_dir/vim" $HOME/.vim
} # }}}

setup_nvim() { # {{{
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/bin/nvim
  mkdir -p $HOME/.config
  ln -snf "$dot_dir/vim" "$HOME/.config/nvim"
} # }}}

setup_atom() { # {{{
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get install -y atom
} # }}}

setup_mac_ubuntu() { #{{{
  sudo add-apt-repository ppa:noobslab/macbuntu
  sudo apt-get update -y
  sudo apt-get install -y macbuntu-os-icons-lts-v7 macbuntu-os-ithemes-lts-v7
  sudo apt-get install -y slingscold
  sudo apt-get install -y albert
  sudo apt-get install -y plank
  sudo apt-get install -y macbuntu-os-plank-theme-lts-v7
} #}}}

usage() { # {{{
  local script_name
  script_name=$(basename $0)
  cat <<EOS
$script_name is script to setup Ubuntu OS.

description:
    if you execute script with taskname then, script executes one task.
    if you execute script without taskname then, script executes all tasks.

usage:
    $script_name { general | ghq | shell | git_config | docker | emacs | go | gtk_theme | vim | nvim | atom }
    $script_name { -h | --help | help }
    $script_name
EOS
  exit 1
} # }}}

main
