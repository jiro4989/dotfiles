========
dotfiles
========

|gh-actions|

次郎の設定ファイルと環境構築スクリプトを管理する。

.. contents:: Table of contents
   :depth: 3

環境構築
========

初期環境構築は以下のコマンドを実行する。

.. code-block:: Bash

   curl "https://raw.githubusercontent.com/jiro4989/dotfiles/master/setup.sh" | bash

設定ファイルを更新したなどで再配置する際は以下を実行する。

.. code-block:: Bash

   ./deploy.sh

メモ
====

この環境構築を実行する時はOSが切り替わったタイミングなので色々忘れてる気がするの
で備忘録。

ファイルマネージャー
--------------------

ManjaroLinuxにはpcmanfmがデフォルトで使える。

フォント名を調べる
------------------

.. code-block:: Bash

   fc-list : family | grep HackGen

ベースになるフォントを調べる？

.. code-block:: Bash

   xrdb -query | grep font

git push時にパスワードを聞かれないようにする
--------------------------------------------

- SSH鍵の生成 `ssh-keygen -t rsa -b 4096 -C "your@email"`
- GitHubに公開鍵(id_rsa.pub)を登録
- Git cloneするときにsshでcloneする

.. |gh-actions| image:: https://github.com/jiro4989/dotfiles/workflows/test/badge.svg
   :target: https://github.com/jiro4989/dotfiles/actions
