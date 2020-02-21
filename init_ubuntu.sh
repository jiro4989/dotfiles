#!/bin/bash

readonly char_bold=$'\x1b[1m'
readonly char_underscore=$'\x1b[4m'
readonly char_reset=$'\x1b[m'

bold() {
  echo -e "$char_bold$*$char_reset"
}

underscore() {
  echo -e "$char_underscore$*$char_reset"
}

echo -e "✨ updating packages ..."
apt update -yqq

readonly PKGS=(
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
readonly log_file=init_ubuntu.log
: > "$log_file"

for pkg in "${PKGS[@]}"; do
  apt-get install -yqq "$pkg" >> "$log_file"
  ret=$?

  p="$(bold "$(underscore "$pkg")")"
  if [[ $ret -eq 0 ]]; then
    echo -e "✅ $p was installed"
  else
    echo -e "❌ $p was not installed"
  fi
done

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf > nim.sh
bash nim.sh -y
choosenim update stable
