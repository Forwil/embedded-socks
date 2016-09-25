#!/bin/sh
iptables -t nat -N REDSOCKS -v
iptables -t nat -A REDSOCKS -d 202.112.136.140 -j RETURN   -v
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN -v
iptables -t nat -A REDSOCKS -d 172.16.0.0/16 -j RETURN -v
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN -v
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN -v
iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345  -v
