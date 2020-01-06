#!/bin/bash

set -eu

readonly RED=$'\x1b[31m'
readonly GREEN=$'\x1b[32m'
readonly RESET=$'\x1b[m'

main() {
  while ((0 < $#)); do
    local opt="$1"
    shift
    case "$opt" in
      -h | --help)
      usage
      ;;
    -v | --version)
      echo "$VERSION"
      ;;
    *)
      ;;
    esac
  done
}

usage() {
  cat << EOS
TODO
EOS
}

log() {
  local level="$1"
  shift
  echo -e "$(date +"%Y/%m/%d %H:%M:%S [ $level ] $*")" >&2
}

info() {
  log "${GREEN}INFO${RESET}" "$*"
}

err() {
  log "${RED}ERROR${RESET}" "$*"
}

main ${1+"$@"}
exit $?
