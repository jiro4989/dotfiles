#!/bin/bash

set -eux

readonly WORKDIR=/tmp/work
readonly MOUNT_HOME=/mnt/c/Users/jiro4989
readonly SHFMT_VERSION=3.0.1
readonly DIRENV_VERSION=2.21.3

# GitHub Actions側で設定されてる値
export CI=${CI:-false}

sudo bash << EOS
set -eux

./script/setup/apt.sh

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

./script/setup/go.sh &
p1=\$!
./script/setup/relma.sh &
p2=\$!
./script/setup/java.sh &
p3=\$!
./script/setup/wsl_gui_with_rdp.sh &
p4=\$!

wait \$p1
wait \$p2
wait \$p3
wait \$p4

if [ "$CI" = false ]; then
  ./script/setup/docker.sh
fi
EOS

./script/setup/link_config.sh

./script/setup/nim.sh &
p1=$!
./script/setup/go_tools.sh &
p2=$!
./script/setup/anyenv.sh &
p3=$!
relma init
relma install -f ./conf/releases.json &
p4=$!

wait $p1
wait $p2
wait $p3
wait $p4

if [ "$CI" = false ]; then
  cp $MOUNT_HOME/.netrc ~/
  ./script/setup/ssh.sh
fi
./script/setup/gitconfig.sh
./script/setup/fish.sh
./script/setup/repos.sh
