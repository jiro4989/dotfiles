#!/usr/bin/env -S nim --hints:off
# vim: ft=nim :

import os, strformat, distros

switch("hints", "off")

const
  home = getHomeDir()
  confDir = getConfigDir()
  tmpDir = getTempDir()
  user = "jiro4989"
  repoDir = home / "src" / "github.com" / user
  dotDir = repoDir / "dotfiles"

template job(msg: string, body: untyped) =
  block:
    echo msg
    body

proc addGroup(group: string) =
  exec &"sudo groupadd {group}"

proc addUserToGropu(user, group: string) =
  exec &"sudo usermod -a -G {group} {user}"

proc msg(s: string) =
  echo "--------------------------------------------------------------------------------"
  echo s
  echo "--------------------------------------------------------------------------------"

proc goGet(pkg: string) =
  exec &"go get -u {pkg}"

proc ghqGet(pkg: string) =
  exec &"ghq get -u {pkg}"

proc installPkg(pkg: string, yay = false) =
  let cmd =
    if yay: "yay"
    else: "pacman"
  let expr = &"sudo {cmd} -S --no-confirm {pkg}"
  msg expr
  exec expr

proc downloadFile(url, dstDir = "/usr/local/bin", base = "", mode = "0755") =
  let base2 =
    if base == "":
      url.split("/")[^1]
    else:
      base

  let dst = dstDir / base2
  let expr = &"curl -O {dst} {url}"
  msg expr
  exec expr
  exec &"chmod {mode} {dst}"

proc gitConfig(name, value: string, scope = "global") =
  exec &"git config --{scope} {name} {value}"

proc symLink(src, dst: string) =
  exec &"ln -sfn {src} {dst}"

task init, "パッケージ、ツール郡のインストール":
  if detectOs(Manjaro):
    var pkgs = [
      "systemd",
      "docker",
      "docker-compose",
      "yay",
      "ibus",
      "zip",
      "glibc",
      "sed",
      "make",
      "which",
      "gcc",
      "indent",
      "python-pip",
      "terraform",
      "pulseaudio",
      "pavucontrol",
      "lmms",
      "soundfont-fluid",
      "steam",
      "wine",
      "winetricks",
      "krita",
      "xf86-input-wacom",
      "snapper",
      "dnsutils",
      "lutris",
      "blueberry",
      "chromium",
      "go",
      "noto-fonts-emoji",
      "noto-fonts-extra",
      "noto-fonts-cjk",
      ]
    for pkg in pkgs:
      installPkg pkg

    pkgs = [
      "mozc",
      "ibus-mozc",
      "unzip-iconv",
      "chromium-widevine",
      ]
    for pkg in pkgs:
      installPkg pkg, yay=true

    let urls = [
      "https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes",
      "https://raw.githubusercontent.com/fumiyas/home-commands/master/echo-sd",
      ]
    for url in urls:
      downloadFile url
    downloadFile "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage", base="nvim"

    addGroup "docker"
    addUserToGroup user, "docker"

task deploy, "各種設定の配置、リンク":
  let home = getHomeDir()
  let gopath = home
  putEnv "GOPATH", gopath

  let goVersion = "1.12"
  let verGo = "go" & goVersion
  goGet "golang.org/dl/" & verGo
  exec gopath / "bin" / verGo & " download"

  job "Set git configs":
    let configs = [
      (name: "user.email", value: "jiroron666@gmail.com"),
      (name: "user.name", value: "jiro4989"),
      (name: "ghq.root", value: "~/src"),
      (name: "alias.preq", value: "pull-request"),
      (name: "alias.see", value: "browse"),
      ]
    for c in configs:
      gitConfig c.name, c.value

  job "Install go tools":
    let pkgs = [
      "github.com/motemen/ghq",
      "golang.org/x/tools/cmd/godoc",
      "golang.org/x/tools/cmd/gopls",
      "golang.org/x/tools/cmd/gorename",
      "golang.org/x/tools/cmd/gomvpkg",
      "github.com/tcnksm/ghr",
      "github.com/atotto/clipboard/cmd/gocopy",
      "github.com/derekparker/delve/cmd/dlv",
      "github.com/alecthomas/gometalinter",
      "github.com/hhatto/gocloc/cmd/gocloc",
      "github.com/mitchellh/gox",
      "github.com/mvdan/sh/cmd/shfmt",
      "github.com/peco/peco/cmd/peco/...",
      "github.com/ChimeraCoder/gojson/gojson",
      "github.com/mattn/twty",
      "github.com/greymd/ojichat",
      "github.com/jiro4989/textimg",
      "github.com/xztaityozx/owari",
      "github.com/jiro4989/align",
      "github.com/jiro4989/monit",
      "github.com/oxequa/realize",
      "github.com/mholt/archiver/cmd/arc",
      ]
    for pkg in pkgs:
      goGet pkg

  job "Download git repositories":
    let pkgs = [
      "jiro4989/dotfiles"
      "jiro4989/setup"
      "jiro4989/workspace"
      "jiro4989/text-proofreading"
      "jiro4989/textimg"
      "jiro4989/super_unko"
      "jiro4989/scripts"
      "unkontributors/super_unko"
      "theoremoon/ShellgeiBot"
      "theoremoon/ShellgeiBot-Image"
      ]
    for pkg in pkgs:
      ghqGet pkg

  exec "sudo " & home / "src/github.com/unkontributors/super_unko/install.sh"

    # job "vimの設定ファイルをリンク":
    #   let vimDir = dotDir / "vim"
    #   symLink vimDir, home / ".vim"
    #   symLink vimDir, confDir / "nvim"
    #
    # job "dein.vimのセットアップ":
    #   let installer = tmpDir / "dein_installer.sh"
    #   downloadFile "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh", installer
    #
    #   let cacheDir = home / ".cache" / "dein"
    #   exec &"{installer} {cacheDir}"
