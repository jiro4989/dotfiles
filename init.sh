#!/bin/bash

set -eux

readonly PKGS=(
  bash-bats
  blueberry
  bluez
  bluez-libs
  bluez-utils
  chromium
  code
  dnsutils
  docker
  docker-compose
  fish
  gcc
  glibc
  go
  ibus
  indent
  krita
  lmms
  lutris
  make
  nodejs
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  npm
  ntp
  pavucontrol
  pulseaudio
  pulseaudio-alsa
  pulseaudio-bluetooth
  python-pip
  quota-tools
  ruby
  sed
  shellcheck
  snapper
  soundfont-fluid
  steam
  supervisor
  systemd
  termite
  terraform
  tmux
  which
  wine
  winetricks
  xf86-input-wacom
  yay
  zip
  zsh
)
for pkg in "${PKGS[@]}"; do
  pacman -S --noconfirm "$pkg"
done

readonly YAY_PKGS=(
  mozc
  ibus-mozc
  unzip-iconv
  chromium-widevine
  bluez-firmware # Bluetooth
)
for pkg in "${YAY_PKGS[@]}"; do
  yay -S --noconfirm "$pkg"
done

# fish
curl -L http://get.oh-my.fish | fish
omf install peco
# ghq + peco
omf install https://github.com/yoshiori/fish-peco_select_ghq_repository
