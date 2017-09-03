ipfile="/etc/sysctl.conf"
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> $ipfile
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> $ipfile

echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/base

echo "dns-nameservers 8.8.8.8" >> /etc/network/interfaces
sudo resolvconf -u
sudo vim /etc/resolv.conf
