#!/bin/bash

type ghq >/dev/null 2>&1 || {
  echo "Need ghq command"
  exit 1
}

time (
  ghq get Nim
  ghq get nim-lang/Nim

  set -eu

  cd $HOME/src/$(ghq list | grep -E "$USER/Nim$")
  bash build_all.sh
  ./koch tests
)
