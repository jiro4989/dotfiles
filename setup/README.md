# setup

環境構築スクリプト

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
ansible-playbook site.yaml --ask-become-pass
```
