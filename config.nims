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

proc gemInstall(pkg: string) =
  exec &"gem install {pkg}"

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

################################################################################
# Tasks
################################################################################

task setup, "環境を構築する (初期化、デプロイ)":
  setCommand("init")
  setCommand("deploy")

task init, "パッケージ、ツール郡のインストール":
  if detectOs(Manjaro):
    setCommand("installPacmanPkg")
  setCommand("setupBluetooth")
  setCommand("setupIME")
  setCommand("setupNodeJS")
  setCommand("setupShell")
  setCommand("setupTerminal")
  setCommand("installShellCmds")
  setCommand("setupDocker")
  setCommand("setupClojure")
  setCommand("setupFont")
  setCommand("setupI3")
  setCommand("setupVSCode")

task installPacmanPkg, "Pacmanのパッケージをインストール":
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
      "code",
      "ruby",
      ]
    for pkg in pkgs:
      installPkg pkg

    job "yay":
      let pkgs = [
        "mozc",
        "ibus-mozc",
        "unzip-iconv",
        "chromium-widevine",
        ]
      for pkg in pkgs:
        installPkg pkg, yay=true

task setupBluetooth, "Bluetoothのセットアップ":
  job "Setup bluetooth auto enable":
    appendText "/etc/bluetooth/main.conf", "AutoEnable=true"

task setupIME, "IMEのセットアップ":
  job "Setup IME":
    let prof = home / ".profile"
    let s = """
export DefaultImModule=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
ibus-daemon -drx"""
    appendText prof, s

task setupNodeJS, "Node.jsのセットアップ":
  job "Setup nodejs":
    mkDir home / ".npm-global"
    exec "npm config set prefix '~/.npm-global'"

task setupShell, "シェルのセットアップ":
  job "Setup shells":
    # bash / zsh
    let dotDir = "$HOME/src/github.com/jiro4989/dotfiles"
    appendText home / ".bashrc", "source {dotDir}/bash/bashrc"
    appendText home / ".zshrc", "source {dotDir}/zsh/zshrc"
    exec "chsh -s /usr/bin/zsh"

task setupTerminal, "ターミナルのセットアップ":
  job "Setup terminals":
    # tmux
    symLink dotDir / "tmux.conf", home / ".tmux.conf"
    # termite
    let termDir = confDir / "termite"
    mkDir termDir
    symLink termDir / "config", confDir / "termite" / "config"

task installShellCmds, "シェルスクリプトのインストール":
  job "install shell cmds":
    let urls = [
      "https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes",
      "https://raw.githubusercontent.com/fumiyas/home-commands/master/echo-sd",
      ]
    for url in urls:
      downloadFile url
    downloadFile "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage", base="nvim"

task setupDocker, "Dockerのセットアップ":
  job "Setup docker":
    addGroup "docker"
    addUserToGroup user, "docker"

task setupClojure, "Clojureのセットアップ":
  job "Install clojure":
    downloadFile "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
    exec "lein"

task setupFont, "Fontのセットアップ":
  job "Install programming font":
    let version = "v1.3.0"
    downloadFile &"https://github.com/yuru7/HackGen/releases/download/{version}/HackGen_{version}.zip", dstDir="/tmp"
    withDir "/tmp":
      exec &"unzip {version}.zip"
    let fontDir = "/usr/share/fonts/truetype/hack-gen"
    exec &"sudo install -d -o root -g root -m 0755 {fontDir}"
    exec &"sudo cp -p /tmp/HackGen*.ttf {fontDir}"
    exec &"sudo git clone https://github.com/googlefonts/noto-emoji /usr/local/src/noto-emoji"
    exec "fc-cache -f -v"

task setupI3, "i3のセットアップ":
  job "Linking i3 config":
    symLink dotDir / "i3", confDir / "i3"

task setupVSCode, "VSCodeのセットアップ":
  job "Linking VSCode config":
    let dst = confDir / "Code" / "User"
    mkDir dst
    let f = "settings.json"
    symLink dotDir / "code" / "user" / f, dst / f

  job "Install VSCode extensions":
    withDir confDir / "code":
      for pkg in readFile("extensions.txt").split("\n"):
        exec &"code --install-extension {pkg}"

task deploy, "各種設定の配置、リンク、アップデート":
  setCommand("installGoXXX")
  setCommand("updateGitConfig")
  setCommand("updateGoPkgs")
  setCommand("updateGitRepos")
  setCommand("initVim")
  setCommand("updateNpm")
  setCommand("updatePip")
  setCommand("updateGem")
  setCommand("updateNimble")

task installGoXXX, "Goの特定のバージョンをインストールする":
  job "Setup go":
    let goVersion = "1.12"
    let verGo = "go" & goVersion
    goGet "golang.org/dl/" & verGo
    exec gopath / "bin" / verGo & " download"

task updateGitConfig, "ユーザの.gitconfigを更新する":
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

task updateGoPkgs, "Goのパッケージを更新する":
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

task updateGitRepos, "GitHubリポジトリを更新する":
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

task initVim, "Vim環境の初期設定を行う":
  job "Setup vim":
    let vimDir = dotDir / "vim"
    symLink vimDir, home / ".vim"
    symLink vimDir, confDir / "nvim"

    let installer = tmpDir / "dein_installer.sh"
    downloadFile "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh", installer

    let cacheDir = home / ".cache" / "dein"
    exec &"{installer} {cacheDir}"

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

task updatePip, "pipパッケージを更新する":
  job "Install pip tools":
    let pkgs = [
      "python-language-server",
      "pynvim",
      ]
    for pkg in pkgs:
      pipInstall pkg

task updateGem, "gemパッケージを更新する":
  job "Install gem tools":
    let pkgs = [
      "asciidoctor",
      "asciidoctor-diagram",
      "asciidoctor-pdf",
      ]
    for pkg in pkgs:
      gemInstall pkg

task updateNimble, "nimbleパッケージを更新する":
  job "Install nimble tools":
    let pkgs = [
      "nimlsp",
      "https://github.com/jiro4989/clitools",
      ]
    for pkg in pkgs:
      nimbleInstall pkg

