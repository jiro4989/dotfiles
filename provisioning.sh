#!/bin/bash

set -eu

add-apt-repository -y ppa:lazygit-team/release
add-apt-repository -y ppa:cwchien/gradle

apt-get update -yqq
apt-get install -y \
  build-essential \
  ca-certificates \
  ctags \
  ctop \
  curl \
  docker.io \
  fish \
  git \
  gradle \
  htop \
  lazygit \
  npm \
  peco \
  python3 \
  python3-pip \
  tmux \
  unzip \
  vim \
  wget \
  xsel \
  xvfb \
  ;

add-apt-repository -y ppa:git-core/ppa
apt-get install -y git

# docker-compoes
curl -sL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose
install -o root -g root -m 0755 /tmp/docker-compose /usr/local/bin/docker-compose

cat << EOS > /tmp/init_vagrant_user.sh

set -eu

export PATH=\$PATH:/usr/local/go/bin

# Vim
curl -sSf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/install_dein.sh
bash /tmp/install_dein.sh ~/.cache/dein
pip3 install --user pynvim

# Git
git config --global user.email jiroron666@gmail.com
git config --global user.name jiro4989
git config --global ghq.root ~/src
git config --global alias.preq pull-request
git config --global alias.see browse

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf > /tmp/init.sh
sh /tmp/init.sh -y >/dev/null 2>&1

export PATH=\$PATH:\$HOME/.nimble/bin
nimble install -Y inim bump subnet nimjson

# dotfiles
git clone https://github.com/jiro4989/dotfiles
pushd dotfiles
./setup.sh

# fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c "fisher install edc/bass"
fish -c "fisher install oh-my-fish/theme-clearance"
fish -c "fisher install fisherman/z"

pip3 install --user virtualenv

repos=(
  # jiro4989/infra
  jiro4989/websh
  jiro4989/nimbot
  jiro4989/workspace
  jiro4989/sandbox
)
for r in \${repos[@]}; do
  # ghq getできない
  ghq get -p "\$r"
done

mkdir -p ~/bin

# mmv
(
  cd /tmp
  wget https://github.com/itchyny/mmv/releases/download/v0.1.1/mmv_v0.1.1_linux_amd64.tar.gz
  tar xzf ./mmv*.tar.gz
  install -m 0755 ./mmv*/mmv ~/bin/mmv
)

# direnv
(
  wget https://github.com/direnv/direnv/releases/download/v2.21.3/direnv.linux-amd64
  install -m 0755 ./direnv* ~/bin/direnv
)

# gopls
GO111MODULE=off go get -u golang.org/x/tools/gopls

# anyenv / nodenv
git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH="\$HOME/.anyenv/bin:\$PATH"
mkdir -p \$(anyenv root)/plugins
yes | anyenv install --init
git clone https://github.com/znz/anyenv-update.git \$(anyenv root)/plugins/anyenv-update

anyenv install nodeenv
eval "\$(anyenv init -)"

node_version=14.15.1
nodenv install \$node_version
nodenv local \$node_version
nodenv local
node -v

# Clojure
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
install -m 0755 lein ~/bin/lein

EOS

# Neovim
curl -sSfL https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > /usr/local/bin/nvim
chmod 0755 /usr/local/bin/nvim

# ssh
cp -r /home/vagrant/.host.ssh/config /home/vagrant/.ssh/
cp -r /home/vagrant/.host.ssh/conf.d /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/conf.d/*
chmod 0700 /home/vagrant/.ssh/conf.d
chown -R vagrant:vagrant /home/vagrant/.ssh/conf.d

# ghq
curl -sSL https://github.com/x-motemen/ghq/releases/download/v1.1.0/ghq_linux_amd64.zip > /tmp/ghq_linux_amd64.zip
pushd /tmp
unzip /tmp/ghq_linux_amd64.zip
install -m 0755 ghq_linux_amd64/ghq /usr/local/bin/ghq

# shfmt
curl -sSfL https://github.com/mvdan/sh/releases/download/v3.0.1/shfmt_v3.0.1_linux_amd64 > /usr/local/bin/shfmt
chmod +x /usr/local/bin/shfmt

# go
wget https://golang.org/dl/go1.14.6.linux-amd64.tar.gz
tar xzf go*.linux-amd64.tar.gz
mv go /usr/local/

# Java 14
(
  cd /tmp
  curl -O https://download.java.net/java/GA/jdk14/076bab302c7b4508975440c56f6cc26a/36/GPL/openjdk-14_linux-x64_bin.tar.gz
  tar xvf openjdk-14_linux-x64_bin.tar.gz

  mkdir -p /opt/java
  mv jdk-14 /opt/java/
  ln -sfn /opt/java/jdk-14 /opt/java/current
)

# user setup
chmod +x /tmp/init_vagrant_user.sh
sudo -u vagrant -i /tmp/init_vagrant_user.sh

# docker
usermod -a -G docker vagrant

# change shell
chsh -s $(which tmux) vagrant

# gh
curl -sSfL https://github.com/cli/cli/releases/download/v0.10.0/gh_0.10.0_linux_amd64.deb > /tmp/gh_0.10.0_linux_amd64.deb
apt install -y /tmp/gh_*_linux_amd64.deb

# fzf
wget https://github.com/junegunn/fzf-bin/releases/download/0.22.0/fzf-0.22.0-linux_amd64.tgz
tar xzf fzf-*-linux_amd64.tgz
install -m 0755 fzf /usr/local/bin/fzf

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
dpkg -i ripgrep_*_amd64.deb

# go-task
wget https://github.com/go-task/task/releases/download/v3.0.0/task_linux_amd64.deb
dpkg -i ./task_linux_amd64.deb
