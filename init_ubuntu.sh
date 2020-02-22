#!/bin/bash

readonly char_bold=$'\x1b[1m'
readonly char_underscore=$'\x1b[4m'
readonly char_reset=$'\x1b[m'

readonly log_file=init_ubuntu.log
: > "$log_file"

bold() {
  echo -e "$char_bold$*$char_reset"
}

underscore() {
  echo -e "$char_underscore$*$char_reset"
}

install_pkgs() {
  local task=$1
  shift
  local pkgs=("$@")

  for pkg in "${pkgs[@]}"; do
    "func_$task" "$pkg" >> "$log_file"
    ret=$?

    p="$(bold "$(underscore "$pkg")")"
    if [[ $ret -eq 0 ]]; then
      echo -e "$task: ✅ $p"
    else
      echo -e "$task: ❌ $p"
    fi
  done
}

func_apt() {
  apt-get install -yqq "$1"
}

func_go() {
  go get -u "$1"
}

func_ghq() {
  ghq get -p "$1"
}

func_pip() {
  pip install "$1"
}

setup_font() {
  local version=v1.3.0
  curl -sSf https://github.com/yuru7/HackGen/releases/download/$version/HackGen_$version.zip > /tmp/font.zip
  (
    cd /tmp
    unzip font.zip
    local font_dir=/usr/share/fonts/truetype/hack-gen
    install -d -o root -g root -m 0755 $font_dir
    cp -p /tmp/HackGen*.ttf $font_dir
    sudo git clone https://github.com/googlefonts/noto-emoji /usr/local/src/noto-emoji
    fc-cache -f -v
  )
}

echo -e "✨ updating packages ..."
apt-get update -yqq

readonly APT_PKGS=(
  chromium-browser
  code
  dnsutils
  docker
  docker-compose
  fish
  go
  indent
  krita
  lmms
  nodejs
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  npm
  python3
  python3-pip
  ruby
  shellcheck
  steam
  supervisor
  systemd
  termite
  terraform
  tmux
  wine
  winetricks
  xf86-input-wacom
  zsh
)

readonly GO_PKGS=(
  "github.com/motemen/ghq"
  "golang.org/x/tools/cmd/godoc"
  "golang.org/x/tools/cmd/gopls"
  "golang.org/x/tools/cmd/gorename"
  "github.com/atotto/clipboard/cmd/gocopy"
  "github.com/derekparker/delve/cmd/dlv"
  "github.com/hhatto/gocloc/cmd/gocloc"
  "github.com/mvdan/sh/cmd/shfmt"
  "github.com/peco/peco/cmd/peco/..."
  "github.com/ChimeraCoder/gojson/gojson"
  "github.com/mattn/twty"
  "github.com/greymd/ojichat"
  "github.com/jiro4989/textimg"
  "github.com/xztaityozx/owari"
  "github.com/jiro4989/align"
  "github.com/jiro4989/monit"
  "github.com/mholt/archiver/cmd/arc"
)

# GHQ
readonly GHQ_PKGS=(
  "jiro4989/dotfiles"
  "jiro4989/sandbox"
  "jiro4989/text-proofreading"
  "jiro4989/scripts"
  "jiro4989/clitools"
  "unkontributors/super_unko"
  "theoremoon/ShellgeiBot"
  "theoremoon/ShellgeiBot-Image"
)

# pip
readonly PIP_PKGS=(
  "python-language-server"
  "pynvim"
)

LANG=C xdg-user-dirs-gtk-update
git config --global user.email jiroron666@gmail.com
git config --global user.name jiro4989
git config --global ghq.root ~/src
git config --global alias.preq pull-request
git config --global alias.see browse

install_pkgs apt "${APT_PKGS[@]}"
install_pkgs go "${GO_PKGS[@]}"
install_pkgs ghq "${GHQ_PKGS[@]}"
install_pkgs pip "${PIP_PKGS[@]}"
setup_font

# Vim
curl -sSf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/install_dein.sh
bash /tmp/install_dein.sh ~/.cache/dein

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf > nim.sh
bash nim.sh -y
choosenim update stable
