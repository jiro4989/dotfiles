#!/bin/bash

sub_cmd=$1
target_os=$2

script_dir=$(dirname $0)
pkg_dir="$script_dir/pkg.d"
pkg_file="$pkg_dir/$target_os.list"

mkdir -p "$pkg_dir"

main() { #{{{
  # ヘルプオプションチェック
  case "$sub_cmd" in
    -h | --help | help)
      usage
      ;;
  esac

  set -eux

  case "$sub_cmd" in
    "in")
      in_pkg
      ;;
    "out")
      out_pkg
      ;;
    *)
      usage
      ;;
  esac
} #}}}

in_pkg() { #{{{
  case "$target_os" in
    centos)
      ;;
    ubuntu)
      sudo apt-get install dselect
      sudo dselect update
      sudo dpkg --clear-selections
      sudo dpkg --set-selections < "$pkg_file"
      sudo apt-get dselect-upgrade
      sudo apt-get autoremove
      ;;
    *)
      usage
      ;;
  esac
} #}}}

out_pkg() { #{{{
  case "$target_os" in
    centos)
      ;;
    ubuntu)
      dpkg --get-selections > "$pkg_file"
      ;;
    *)
      usage
      ;;
  esac
} #}}}

usage() { # {{{
  local script_name
  script_name=$(basename $0)
  cat <<EOS
$script_name is script to manage OS packages.

description:
    "in"  subcommand installs packages from package list file.
    "out" subcommand outputs packages to package list file.

    package list file is put to "pkg.d" directory.

usage:
    $script_name { in | out } { ubuntu | centos }
    $script_name { -h | --help | help }
EOS
  exit 1
} # }}}

main
