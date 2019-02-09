# setup

環境構築スクリプト

## 前提条件

- python3
- pip3
- ansible


    % ansible --version
    ansible 2.7.7
      config file = None
      configured module search path = ['/home/jiro4989/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
      ansible python module location = /home/jiro4989/.local/lib/python3.6/site-packages/ansible
      executable location = /home/jiro4989/.local/bin/ansible
      python version = 3.6.7 (default, Oct 22 2018, 11:32:17) [GCC 8.2.0]


```
ansible-playbook playbook.yaml --ask-become-pass
```
