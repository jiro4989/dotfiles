#!/bin/bash

set -eux

readonly WORKDIR=/tmp/work
readonly MOUNT_HOME=/mnt/c/Users/jiro4989
readonly SHFMT_VERSION=3.0.1
readonly DIRENV_VERSION=2.21.3

# GitHub Actions側で設定されてる値
export CI=${CI:-false}

mkdir -p $WORKDIR
pushd $WORKDIR

sudo bash << EOS
set -eux

./dotfiles/script/setup/apt.sh

inst() {
  (
    mkdir -p /tmp/work
    cd /tmp/work
    curl -sSfL "\$1" -o "\$2"
    install -m 0755 "\$2" "/usr/local/bin/\$2"
  )
}

inst "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" nvim
inst "https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64" shfmt
inst "https://github.com/direnv/direnv/releases/download/v${DIRENV_VERSION}/direnv.linux-amd64" direnv

./dotfiles/script/setup/go.sh &
p1=\$!
./dotfiles/script/setup/relma.sh &
p2=\$!
./dotfiles/script/setup/java.sh &
p3=\$!
./dotfiles/script/setup/wsl_gui_with_rdp.sh &
p4=\$!

wait \$p1
wait \$p2
wait \$p3
wait \$p4

if [ "$CI" = false ]; then
  ./dotfiles/script/setup/docker.sh
fi
EOS

./dotfiles/script/setup/link_config.sh

./dotfiles/script/setup/nim.sh &
p1=$!
./dotfiles/script/setup/go_tools.sh &
p2=$!
./dotfiles/script/setup/anyenv.sh &
p3=$!
relma install -f ./dotfiles/conf/releases.json &
p4=$!

wait $p1
wait $p2
wait $p3
wait $p4

if [ "$CI" = false ]; then
  cp $MOUNT_HOME/.netrc ~/
  ./dotfiles/script/setup/ssh.sh
fi
./dotfiles/script/setup/gitconfig.sh
./dotfiles/script/setup/fish.sh
./dotfiles/script/setup/repos.sh
