#!/usr/bin/env -S nim --hints:off
# vim: ft=nim :

import os, strformat, distros

switch("hints", "off")

const
  home = getHomeDir()
  confDir = getConfigDir()
  tmpDir = getTempDir()
  userName = "jiro4989"
  repoDir = home / "src" / "github.com" / userName
  dotDir = repoDir / "dotfiles"

template job(msg: string, body: untyped) =
  block:
    echo msg
    body

proc downloadFile(url, dst: string, mode = "0755") =
  exec &"curl -O {dst} {url}"
  exec &"chmod {mode} {dst}"

proc symLink(src, dst: string) =
  exec &"ln -sfn {src} {dst}"

task setup, "Setup PC":
  if detectOs(Manjaro):
    job "パッケージのインストール":
      foreignDep "vim"
      foreignDep "code"

    job "Neovimのインストール":
      downloadFile "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage", "/usr/local/bin/nvim", "0755"

    job "vimの設定ファイルをリンク":
      let vimDir = dotDir / "vim"
      symLink vimDir, home / ".vim"
      symLink vimDir, confDir / "nvim"

    job "dein.vimのセットアップ":
      let installer = tmpDir / "dein_installer.sh"
      downloadFile "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh", installer

      let cacheDir = home / ".cache" / "dein"
      exec &"{installer} {cacheDir}"
