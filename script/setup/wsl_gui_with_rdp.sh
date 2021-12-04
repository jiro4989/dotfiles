#!/bin/bash

set -eux

export DEBIAN_FRONTEND=noninteractive
apt update -yqq
apt upgrade -yqq
apt install -yqq xfce4 xrdp

cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sed -i \
  -e 's/3389/3390/g' \
  -e 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' \
  -e 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' \
  /etc/xrdp/xrdp.ini
echo xfce4-session > ~/.xsession

cp /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
sed -i \
  -e 's_^test -x /etc/X11/Xsession.*_# &_' \
  -e 's_^exec /bin/sh /etc/X11/Xsession.*_# &_' \
  /etc/xrdp/startwm.sh
echo startxfce4 >> /etc/xrdp/startwm.sh

diff -u /etc/xrdp/startwm.sh.bak /etc/xrdp/startwm.sh || true
