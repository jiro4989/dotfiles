#!/bin/bash

set -eux

readonly PKGS=(
  systemd
  docker
  docker-compose
  yay
  ibus
  zip
  glibc
  sed
  make
  which
  gcc
  indent
  python-pip
  terraform
  pulseaudio
  pavucontrol
  lmms
  soundfont-fluid
  steam
  wine
  winetricks
  krita
  xf86-input-wacom
  snapper
  dnsutils
  lutris
  blueberry
  chromium
  go
  nodejs
  npm
  noto-fonts-emoji
  noto-fonts-extra
  noto-fonts-cjk
  zsh
  tmux
  shellcheck
  bash-bats
  termite
  code
  ruby
)
for pkg in "${PKGS[@]}"; do
  pacman -S --noconfirm "$pkg"
done

readonly YAY_PKGS=(
  mozc
  ibus-mozc
  unzip-iconv
  chromium-widevine
)
for pkg in "${YAY_PKGS[@]}"; do
  yay -S --noconfirm "$pkg"
done
