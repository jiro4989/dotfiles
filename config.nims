#!/usr/bin/env -S nim --hints:off
# vim: ft=nim :

import os, strformat, distros
from strutils import split

const
  home = getHomeDir()
  confDir = getConfigDir()
  tmpDir = getTempDir()
  user = "jiro4989"
  repoDir = home / "src" / "github.com" / user
  dotDir = repoDir / "dotfiles"
  gopath = home

putEnv "GOPATH", gopath

template runExec(cmd: string) =
  when defined(dryRun):
    echo "DRY RUN: " & cmd
  else:
    exec cmd

template job(msg: string, body: untyped) =
  block:
    echo ""
    echo "=== " & msg & " ==="
    echo ""
    body

proc appendText(file, text: string) =
  when defined(dryRun):
    echo "DRY RUN: appendText " & text
  else:
    let s = openFile(file)
    let s2 s & "\n" & text
    writeFile(file, s2)

proc addGroup(group: string) =
  runExec &"sudo groupadd {group}"

proc addUserToGroup(user, group: string) =
  runExec &"sudo usermod -a -G {group} {user}"

proc goGet(pkg: string) =
  runExec &"go get -u {pkg}"

proc ghqGet(pkg: string) =
  let cmd = home / "bin" / "ghq"
  runExec &"{cmd} get -u {pkg}"

proc nimbleInstall(pkg: string) =
  let cmd = home / ".nimble" / "bin" / "nimble"
  runExec &"{cmd} install -Y {pkg}"

proc npmInstall(pkg: string) =
  runExec &"npm install -g {pkg}"

proc pipInstall(pkg: string, cmd = "pip3") =
  runExec &"{cmd} install {pkg}"

proc gemInstall(pkg: string) =
  runExec &"gem install {pkg}"

proc installPkg(pkg: string, yay = false) =
  let cmd =
    if yay: "yay"
    else: "pacman"
  let expr = &"sudo {cmd} -S --noconfirm {pkg}"
  runExec expr

proc downloadFile(url, dstDir = "/usr/local/bin", base = "", mode = "0755") =
  let base2 =
    if base == "":
      url.split("/")[^1]
    else:
      base

  let dst = dstDir / base2
  let expr = &"curl -O {dst} {url}"
  runExec expr
  runExec &"chmod {mode} {dst}"

proc gitConfig(name, value: string, scope = "global") =
  runExec &"git config --{scope} {name} {value}"

proc symLink(src, dst: string) =
  runExec &"ln -sfn {src} {dst}"

################################################################################
# Tasks
################################################################################

task setupNodeJS, "Node.jsのセットアップ":
  job "Setup nodejs":
    let d = "~/.npm-global"
    runExec &"mkdir {d}"
    runExec &"npm config set prefix '{d}'"

task setupShell, "シェルのセットアップ":
  job "Setup shells":
    # bash / zsh
    let dotDir = "$HOME/src/github.com/jiro4989/dotfiles"
    appendText home / ".bashrc", "source {dotDir}/bash/bashrc"
    appendText home / ".zshrc", "source {dotDir}/zsh/zshrc"
    runExec "chsh -s /usr/bin/zsh"

task installShellCmds, "シェルスクリプトのインストール":
  job "install shell cmds":
    let urls = [
      "https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes",
      "https://raw.githubusercontent.com/fumiyas/home-commands/master/echo-sd",
      ]
    for url in urls:
      downloadFile url
    downloadFile "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage", base = "nvim"

task setupVSCode, "VSCodeのセットアップ":
  job "Linking VSCode config":
    let dst = confDir / "Code" / "User"
    runExec &"mkdir {dst}"
    let f = "settings.json"
    symLink dotDir / "code" / "user" / f, dst / f

  job "Install VSCode extensions":
    withDir confDir / "code":
      for pkg in readFile("extensions.txt").split("\n"):
        runExec &"code --install-extension {pkg}"

task updateNpm, "npmパッケージを更新する":
  job "Install npm tools":
    let pkgs = [
      "bash-language-server",
      "vscode-css-languageserver-bin",
      "typescript-language-server",
      "dockerfile-language-server-nodejs",
      ]
    for pkg in pkgs:
      npmInstall pkg

task updateGem, "gemパッケージを更新する":
  job "Install gem tools":
    let pkgs = [
      "asciidoctor",
      "asciidoctor-diagram",
      "asciidoctor-pdf",
      ]
    for pkg in pkgs:
      gemInstall pkg

