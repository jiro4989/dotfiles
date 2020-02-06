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
  gcc
  glibc
  go
  ibus
  indent
  ntp
  krita
  lmms
  lutris
  make
  nodejs
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  npm
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
  systemd
  termite
  terraform
  tmux
  which
  wine
  winetricks
  xf86-input-wacom
  yay
  supervisor
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
