#!/bin/sh
iptables -F

sudo modprobe ip_gre
lsmod | grep gre
sudo apt install iptables iproute2

sudo ip tunnel add gre-cdn-iptv1 mode gre local 195.201.242.87 remote iptv-1.dns-protected.com ttl 255
sudo ip addr add 10.34.1.2/30 dev gre-cdn-iptv1
sudo ip link set gre-cdn-iptv1 up
sudo echo '100 GRE-IPTV1' >> /etc/iproute2/rt_tables
sudo ip rule add from 10.34.1.0/30 table GRE-IPTV1
sudo ip route add default via 10.34.1.1 table GRE-IPTV1

exit 0
