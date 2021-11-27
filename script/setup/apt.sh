#!/bin/bash

set -eux

add-apt-repository -yqq ppa:lazygit-team/release
add-apt-repository -yqq ppa:cwchien/gradle
add-apt-repository -yqq ppa:git-core/ppa
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update -yqq
apt-get install -yqq \
  build-essential \
  ca-certificates \
  ctags \
  ctop \
  curl \
  fish \
  git \
  gradle \
  htop \
  lazygit \
  npm \
  python3 \
  python3-pip \
  shellcheck \
  terraform-ls \
  tmux \
  unzip \
  vim \
  wget \
  xsel \
  xvfb \
  ;

chsh -s "$(command -v tmux)" "$USER"
