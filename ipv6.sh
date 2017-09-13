ipfile="/etc/sysctl.conf"
sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" >> $ipfile
sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> $ipfile

sudo echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/base

sudo echo "dns-nameservers 8.8.8.8" >> /etc/network/interfaces
sudo resolvconf -u
sudo vim /etc/resolv.conf
