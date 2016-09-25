#!/bin/sh
iptables -t nat -N REDSOCKS2 -v
iptables -t nat -A REDSOCKS2 -d 202.112.136.140 -j RETURN   -v
iptables -t nat -A REDSOCKS2 -d 10.0.0.0/8 -j RETURN -v
iptables -t nat -A REDSOCKS2 -d 172.16.0.0/16 -j RETURN -v
iptables -t nat -A REDSOCKS2 -d 192.168.0.0/16 -j RETURN -v
iptables -t nat -A REDSOCKS2 -d 127.0.0.0/8 -j RETURN -v
iptables -t nat -A REDSOCKS2 -p tcp -j REDIRECT --to-ports 12346  -v
