#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# sourceで直接複数指定できないみたいだったのでforループ
for f in "$script_dir"/conf.plugins.d/*.sh; do
  source "$f"
done

