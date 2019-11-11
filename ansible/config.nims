#!/usr/bin/env -S nim --hints:off
# vim: ft=nim :

import os, strformat, distros
from strutils import split

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

proc appendText(file, text: string) =
  var f = open(file, fmAppend)
  defer: close(f)
  f.writeLine(text)

proc addGroup(group: string) =
  exec &"sudo groupadd {group}"

proc addUserToGroup(user, group: string) =
  exec &"sudo usermod -a -G {group} {user}"

proc msg(s: string) =
  echo "--------------------------------------------------------------------------------"
  echo s
  echo "--------------------------------------------------------------------------------"

proc goGet(pkg: string) =
  exec &"go get -u {pkg}"

proc ghqGet(pkg: string) =
  let cmd = home / "bin" / "ghq"
  exec &"{cmd} get -u {pkg}"

proc nimbleInstall(pkg: string) =
  let cmd = home / ".nimble" / "bin" / "nimble"
  exec &"{cmd} install -Y {pkg}"

proc npmInstall(pkg: string) =
  exec &"npm install -g {pkg}"

proc pipInstall(pkg: string, cmd="pip3") =
  exec &"{cmd} install {pkg}"

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
    job "Pacman":
      let pkgs = [
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
        "nodejs",
        "npm",
        "noto-fonts-emoji",
        "noto-fonts-extra",
        "noto-fonts-cjk",
        "zsh",
        "tmux",
        "shellcheck",
        "bash-bats",
        "termite",
        ]
      for pkg in pkgs:
        installPkg pkg

    job "Setup nodejs":
      mkDir home / ".npm-global"
      exec "npm config set prefix '~/.npm-global'"

    job "Setup shells and terminals":
      # bash / zsh
      let dotDir = "$HOME/src/github.com/jiro4989/dotfiles"
      appendText home / ".bashrc", "source {dotDir}/bash/bashrc"
      appendText home / ".zshrc", "source {dotDir}/zsh/zshrc"
      exec "chsh -s /usr/bin/zsh"
      # tmux
      symLink dotDir / "tmux.conf", home / ".tmux.conf"
      # termite
      let termDir = confDir / "termite"
      mkDir termDir
      symLink termDir / "config", confDir / "termite" / "config"

    job "yay":
      let pkgs = [
        "mozc",
        "ibus-mozc",
        "unzip-iconv",
        "chromium-widevine",
        ]
      for pkg in pkgs:
        installPkg pkg, yay=true

    job "curl":
      let urls = [
        "https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes",
        "https://raw.githubusercontent.com/fumiyas/home-commands/master/echo-sd",
        ]
      for url in urls:
        downloadFile url
      downloadFile "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage", base="nvim"

    job "Setup docker":
      addGroup "docker"
      addUserToGroup user, "docker"

task deploy, "各種設定の配置、リンク":
  let home = getHomeDir()
  let gopath = home
  putEnv "GOPATH", gopath

  job "Setup go":
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
      "github.com/atotto/clipboard/cmd/gocopy",
      "github.com/derekparker/delve/cmd/dlv",
      "github.com/hhatto/gocloc/cmd/gocloc",
      "github.com/mvdan/sh/cmd/shfmt",
      "github.com/peco/peco/cmd/peco/...",
      "github.com/ChimeraCoder/gojson/gojson",
      "github.com/mattn/twty",
      "github.com/greymd/ojichat",
      "github.com/jiro4989/textimg",
      "github.com/xztaityozx/owari",
      "github.com/jiro4989/align",
      "github.com/jiro4989/monit",
      "github.com/mholt/archiver/cmd/arc",
      ]
    for pkg in pkgs:
      goGet pkg

  job "Download git repositories":
    let pkgs = [
      "jiro4989/dotfiles",
      "jiro4989/sandbox",
      "jiro4989/text-proofreading",
      "jiro4989/scripts",
      "jiro4989/clitools",
      "unkontributors/super_unko",
      "theoremoon/ShellgeiBot",
      "theoremoon/ShellgeiBot-Image",
      ]
    for pkg in pkgs:
      ghqGet pkg

  exec "sudo " & home / "src/github.com/unkontributors/super_unko/install.sh"

  job "Install npm tools":
    let pkgs = [
      "bash-language-server",
      "vscode-css-languageserver-bin",
      "typescript-language-server",
      "dockerfile-language-server-nodejs",
      ]
    for pkg in pkgs:
      npmInstall pkg

  job "Install pip tools":
    let pkgs = [
      "python-language-server",
      "pynvim",
      ]
    for pkg in pkgs:
      pipInstall pkg

  job "Install nimble tools":
    let pkgs = [
      "nimlsp",
      "https://github.com/jiro4989/clitools",
      ]
    for pkg in pkgs:
      nimbleInstall pkg

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
