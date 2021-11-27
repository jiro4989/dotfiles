#!/bin/bash

set -eux

readonly WORKDIR=/tmp/work
readonly USERNAME=jiro4989
readonly MOUNT_HOME=/mnt/c/Users/jiro4989
readonly DOCKERCOMPOSE_VERSION=1.25.4
readonly SHFMT_VERSION=3.0.1
readonly DIRENV_VERSION=2.21.3
readonly NODE_VERSION=16.9.1

mkdir -p $WORKDIR
pushd $WORKDIR

sudo bash << EOS
set -eux

add-apt-repository -y ppa:lazygit-team/release
add-apt-repository -y ppa:cwchien/gradle
add-apt-repository -y ppa:git-core/ppa
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update -y
apt-get install -y  \
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

inst() {
  curl -sSfL "\$1" -o "\$2"
  install -m 0755 "\$2" "/usr/local/bin/\$2"
}

inst "https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" docker-compose
inst "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" nvim
inst "https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64" shfmt
inst "https://github.com/direnv/direnv/releases/download/v${DIRENV_VERSION}/direnv.linux-amd64" direnv

(
  cd /usr/local
  wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
  tar xzf go*.linux-amd64.tar.gz
)

curl -O https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-x64_bin.tar.gz
java_version=16
tar xvf openjdk-\${java_version}_linux-x64_bin.tar.gz
mkdir -p /opt/java
mv jdk-\${java_version} /opt/java/
ln -sfn /opt/java/jdk-\${java_version} /opt/java/current

wget https://github.com/jiro4989/relma/releases/download/v1.4.0/relma-linux-amd64.tar.gz
tar xzf relma-linux-amd64.tar.gz
install -m 0755 ./relma /usr/local/bin/relma

usermod -a -G docker $USERNAME
chsh -s \$(which tmux) $USERNAME
EOS

curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
bash init.sh -y
nimble install -Y inim bump subnet nimjson

go get -v -u golang.org/x/tools/gopls
go get -v -u golang.org/x/tools/cmd/goimports

git clone https://github.com/riywo/anyenv ~/.anyenv
export PATH=$PATH:$HOME/.anyenv/bin/anyenv
mkdir -p "$(anyenv root)/plugins"
yes | anyenv install --init
git clone https://github.com/znz/anyenv-update.git "$(anyenv root)/plugins/anyenv-update"

anyenv install nodenv
eval "$(anyenv init -)"
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

npm i -g bash-language-server

pip3 install --user cfn-lint

(
  cd
  git clone https://github.com/jiro4989/dotfiles
  cd dotfiles
  ./link_config.sh
  relma install -f ./conf/releases.json
)

git config --global user.name $USERNAME
git config --global user.email $USERNAME
git config --global alias.preq pull-request
git config --global alias.see browse
git config --global ghq.root ~/src

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c "fisher install edc/bass"
fish -c "fisher install oh-my-fish/theme-clearance"
fish -c "fisher install fisherman/z"

cp $MOUNT_HOME/.netrc ~/

install -o ${USERNAME} -g ${USERNAME} -m 0700 -d ~/.ssh
cp -r ${MOUNT_HOME}/.ssh/config ~/.ssh/
cp -r ${MOUNT_HOME}/.ssh/conf.d ~/.ssh/
chmod 0600 ~/.ssh/conf.d/*
chmod 0700 ~/.ssh/conf.d
chown -R ${USERNAME}:${USERNAME} ~/.ssh/conf.d

export PATH=$PATH:$HOME/relma/bin
ghq get -P \
  jiro4989/faker \
  jiro4989/nimjson \
  jiro4989/sandbox \
  jiro4989/scripts \
  jiro4989/setup-nim-action \
  jiro4989/textimg \
  jiro4989/websh \
  jiro4989/workspace \
  ;
