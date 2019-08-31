# ansible

環境構築用のAnsible-Playbook。

やることの詳細は[ManjaroLinux + i3の環境構築をするときにやること](https://scrapbox.io/jiro4989/ManjaroLinux_+_i3%E3%81%AE%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89%E3%82%92%E3%81%99%E3%82%8B%E3%81%A8%E3%81%8D%E3%81%AB%E3%82%84%E3%82%8B%E3%81%93%E3%81%A8)
にまとめている。

## 前提条件

- Ansible2

以下の公式インストール手順に従ってAnsibleをインストールする

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu

Ansible version

        % ansible --version
        ansible 2.7.7
          config file = None
          configured module search path = ['/home/jiro4989/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
          ansible python module location = /home/jiro4989/.local/lib/python3.6/site-packages/ansible
          executable location = /home/jiro4989/.local/bin/ansible
          python version = 3.6.7 (default, Oct 22 2018, 11:32:17) [GCC 8.2.0]

## 環境構築方法

以下のコマンドを実行する

```
sudo ./setup.sh manjaro
```

AnsiblePlaybookのみ実行したい場合は下記

```
sudo ./setup.sh manjaro -s
```

# ファイルマネージャー

ManjaroLinuxにはpcmanfmがインストールされているのでそれを使う。
i3wmではmod+F3で呼び出せる。

# フォント名を調べる

```bash
fc-list : family | grep HackGen
```

ベースになるフォントを調べる？

```bash
xrdb -query | grep font
```

# git push時にパスワードを聞かれないようにする

- SSH鍵の生成 
  `ssh-keygen -t rsa -b 4096 -C "your@email"`
- GitHubに公開鍵(id_rsa.pub)を登録
- Git cloneするときにsshでcloneする
  あとからsshに変更する際はスクリプトを使う。
  - jiro4989/bin/bin/git-ssh-set-url.sh

# トラブルシュート

## フォントが変わらない

urxvtのフォントが変更されなかった。
Boldフォントの方だけ反映されるという問題に直面した。

結論：$HOME/.Xresource内のフォント設定をコメントアウトしてOSを再起動したら解決した。

# タスク依存関係

* 初期セットアップ
  * systemdとかsnapdとか低レイヤのミドルウェアインストール
* Go環境のインストール (ghq)
  * dotfiles
    * editorのセットアップ
      * Vim, Neovim, VSCode
    * 各プログラミング言語環境のセットアップ
      * Nim, Ruby, Python
    * Docker
    * terminal

site.yml - ミドルウェアのインストールとデプロイ
site_setup.yml - ミドルウェアのインストール
site_deploy.yml - 各種設定のリンク、配置
site_update.yml - ミドルウェアのアップデート
